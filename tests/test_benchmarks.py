from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from unittest import mock

import run_benchmarks
from scripts import export_hls_cpp
from scripts import export_rtl_validation


class BenchmarkHarnessTest(unittest.TestCase):
    def test_acceptance_benchmarks_use_only_datapath_ops(self) -> None:
        benchmarks = run_benchmarks.build_acceptance_benchmarks()
        self.assertEqual(
            set(benchmarks.keys()),
            {"fir8", "dot16", "gemm_k8", "gemm_blocked_k8", "conv3x3", "stencil5"},
        )
        allowed_ops = {"input", "const", "add", "sub", "mul"}
        for graph in benchmarks.values():
            self.assertTrue(graph["root"])
            for node in graph["ir_nodes"]:
                self.assertIn(node["op"], allowed_ops)

    def test_size_sweep_benchmark_families_include_requested_sizes(self) -> None:
        families = run_benchmarks.build_size_sweep_benchmark_families()
        self.assertEqual(sorted(families["fir"].keys()), [4, 8, 16, 32])
        self.assertEqual(sorted(families["dot"].keys()), [8, 16, 32, 64])
        self.assertEqual(run_benchmarks.arithmetic_op_count(families["fir"][4]), 7)
        self.assertEqual(run_benchmarks.arithmetic_op_count(families["dot"][8]), 15)

    def test_python_metric_model_matches_mul_two(self) -> None:
        graph = run_benchmarks.build_smoke_cases()["mul_two"]
        metrics = run_benchmarks.graph_metrics(graph)
        self.assertEqual(
            metrics,
            {"area": 6, "latency": 3, "dsp_count": 1, "lut_count": 0, "power": 3},
        )

    def test_shared_cost_model_is_loaded_from_single_file(self) -> None:
        self.assertEqual(
            run_benchmarks.SHARED_COST_MODEL["baseline_multiply_mapping_policy"],
            "generic_mul_defaults_to_dsp_metrics",
        )
        self.assertEqual(
            run_benchmarks.SHARED_OP_METRICS["add_dsp"],
            {"area": 2, "latency": 1, "dsp_count": 1, "lut_count": 0, "power": 2},
        )
        self.assertEqual(
            run_benchmarks.SHARED_OP_METRICS["mul_lut"],
            {"area": 4, "latency": 6, "dsp_count": 0, "lut_count": 8, "power": 6},
        )

    def test_optimizer_runs_end_to_end_on_smoke_case(self) -> None:
        graph = run_benchmarks.build_smoke_cases()["mul_two"]
        response = run_benchmarks.run_optimizer(
            run_benchmarks.make_request(
                "mul_two",
                graph,
                mode="weighted",
                objective="weighted",
            )
        )
        self.assertTrue(response["feasible"])
        self.assertIn("metrics", response)

    def test_strict_zero_dsp_constraint_is_feasible(self) -> None:
        builder = run_benchmarks.IrBuilder()
        x = builder.input("x")
        y = builder.input("y")
        graph = builder.graph(builder.mul(x, y))
        response = run_benchmarks.run_optimizer(
            run_benchmarks.make_request(
                "generic_mul",
                graph,
                mode="constrained",
                objective="latency",
                budgets={"dsp_max": 0},
            )
        )
        self.assertTrue(response["feasible"])
        self.assertEqual(response["metrics"]["dsp_count"], 0)
        self.assertEqual(response["metrics"]["latency"], 6)

    def test_dsp_budget_can_be_spent_on_adders(self) -> None:
        builder = run_benchmarks.IrBuilder()
        a = builder.input("a")
        b = builder.input("b")
        c = builder.input("c")
        graph = builder.graph(builder.add(builder.add(a, b), c))
        response = run_benchmarks.run_optimizer(
            run_benchmarks.make_request(
                "add_chain",
                graph,
                mode="constrained",
                objective="latency",
                budgets={"dsp_max": 1},
            )
        )
        self.assertTrue(response["feasible"])
        self.assertEqual(response["metrics"]["dsp_count"], 1)
        self.assertLess(response["metrics"]["latency"], run_benchmarks.graph_metrics(graph)["latency"])
        self.assertIn("add_dsp", {node["op"] for node in response["optimized_ir"]["ir_nodes"]})

    def test_mac_dsp_is_selected_when_latency_is_prioritized(self) -> None:
        builder = run_benchmarks.IrBuilder()
        a = builder.input("a")
        b = builder.input("b")
        c = builder.input("c")
        graph = builder.graph(builder.add(builder.mul(a, b), c))
        unconstrained = run_benchmarks.run_optimizer(
            run_benchmarks.make_request(
                "mac_candidate",
                graph,
                mode="constrained",
                objective="latency",
                budgets={"dsp_max": 1},
            )
        )
        zero_dsp = run_benchmarks.run_optimizer(
            run_benchmarks.make_request(
                "mac_candidate_zero_dsp",
                graph,
                mode="constrained",
                objective="latency",
                budgets={"dsp_max": 0},
            )
        )
        self.assertTrue(unconstrained["feasible"])
        self.assertTrue(zero_dsp["feasible"])
        self.assertLess(unconstrained["metrics"]["latency"], zero_dsp["metrics"]["latency"])
        self.assertIn("mac_dsp", {node["op"] for node in unconstrained["optimized_ir"]["ir_nodes"]})

    def test_unique_weight_sweep_points_dedupes_duplicates(self) -> None:
        payload = {
            "weight_sweep": [
                {
                    "weights": {"w_area": 6.0, "w_latency": 1.0},
                    "response": {"metrics": {"area": 4, "latency": 6}},
                },
                {
                    "weights": {"w_area": 4.0, "w_latency": 1.0},
                    "response": {"metrics": {"area": 4, "latency": 6}},
                },
                {
                    "weights": {"w_area": 1.0, "w_latency": 4.0},
                    "response": {"metrics": {"area": 6, "latency": 3}},
                },
            ]
        }
        self.assertEqual(
            run_benchmarks.unique_weight_sweep_points(payload),
            [(4, 6), (6, 3)],
        )

    def test_fir8_constraints_force_real_tradeoff(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"fir8": run_benchmarks.build_acceptance_benchmarks()["fir8"]},
            config,
        )
        payload = results["benchmarks"]["fir8"]
        original = payload["original_metrics"]
        weighted = payload["runs"]["weighted"]["metrics"]
        area_budget = payload["runs"]["latency_under_area"]["metrics"]
        lut_cap = payload["runs"]["latency_under_lut"]["metrics"]

        self.assertLess(area_budget["latency"], weighted["latency"])
        self.assertGreater(area_budget["area"], weighted["area"])
        self.assertLessEqual(area_budget["area"], original["area"])

        self.assertLessEqual(lut_cap["lut_count"], original["lut_count"])
        self.assertGreater(lut_cap["dsp_count"], weighted["dsp_count"])
        self.assertGreater(lut_cap["area"], weighted["area"])

        self.assertGreater(len(run_benchmarks.unique_pareto_points(payload)), 1)
        self.assertGreater(len(run_benchmarks.unique_weight_sweep_points(payload)), 1)

    def test_latency_unconstrained_and_dsp_sweep_are_present(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"gemm_k8": run_benchmarks.build_acceptance_benchmarks()["gemm_k8"]},
            config,
        )
        payload = results["benchmarks"]["gemm_k8"]
        self.assertIn("latency_unconstrained", payload["runs"])
        self.assertIn("metrics", payload["runs"]["latency_unconstrained"])
        self.assertTrue(payload["dsp_budget_sweep"])
        self.assertEqual(
            payload["dsp_budget_sweep"][-1]["metrics"]["latency"],
            payload["runs"]["latency_unconstrained"]["metrics"]["latency"],
        )

    def test_power_runs_are_present(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"fir8": run_benchmarks.build_acceptance_benchmarks()["fir8"]},
            config,
        )
        payload = results["benchmarks"]["fir8"]
        self.assertIn("power_unconstrained", payload["runs"])
        self.assertIn("latency_under_power", payload["runs"])
        self.assertIn("power_under_latency", payload["runs"])
        self.assertIn("power", payload["runs"]["power_unconstrained"]["metrics"])

    def test_dsp_budget_sweep_is_monotone_and_improves_latency(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"fir8": run_benchmarks.build_acceptance_benchmarks()["fir8"]},
            config,
        )
        payload = results["benchmarks"]["fir8"]
        sweep = payload["dsp_budget_sweep"]
        latencies = [entry["metrics"]["latency"] for entry in sweep if entry.get("metrics")]
        self.assertEqual(latencies, sorted(latencies, reverse=True))
        self.assertGreater(latencies[0], latencies[-1])
        self.assertEqual(
            latencies[-1],
            payload["runs"]["latency_unconstrained"]["metrics"]["latency"],
        )

    def test_run_suite_uses_one_batch_optimizer_call_per_benchmark(self) -> None:
        benchmarks = {
            "fir8": run_benchmarks.build_acceptance_benchmarks()["fir8"],
            "gemm_k8": run_benchmarks.build_acceptance_benchmarks()["gemm_k8"],
        }
        config = run_benchmarks.load_benchmark_config()

        def fake_batch_response(request: dict) -> dict:
            results = []
            for query in request["queries"]:
                result = {
                    "name": query["name"],
                    "feasible": True,
                }
                if query["mode"] == "pareto_2d":
                    result["frontier"] = [
                        {
                            "optimized_ir": {
                                "ir_nodes": request["ir_nodes"],
                                "root": request["root"],
                            },
                            "metrics": {
                                "area": 1,
                                "latency": 1,
                                "dsp_count": 0,
                                "lut_count": 1,
                            },
                        }
                    ]
                else:
                    result["optimized_ir"] = {
                        "ir_nodes": request["ir_nodes"],
                        "root": request["root"],
                    }
                    result["metrics"] = {
                        "area": 1,
                        "latency": 1,
                        "dsp_count": 0,
                        "lut_count": 1,
                    }
                    result["score"] = 1.0
                results.append(result)
            return {
                "benchmark_name": request["benchmark_name"],
                "shared_stats": {
                    "iterations": 2,
                    "eclasses": 3,
                    "enodes": 4,
                    "runtime_ms": 10,
                },
                "results": results,
            }

        with (
            mock.patch.object(
                run_benchmarks,
                "run_optimizer_batch",
                side_effect=fake_batch_response,
            ) as run_batch,
            mock.patch.object(
                run_benchmarks,
                "run_optimizer",
                side_effect=AssertionError("old single-request path should not be used"),
            ),
        ):
            results = run_benchmarks.run_suite(benchmarks, config)

        self.assertEqual(run_batch.call_count, len(benchmarks))
        for payload in results["benchmarks"].values():
            self.assertIn("shared_stats", payload)
            self.assertEqual(payload["runs"]["weighted"]["stats"]["runtime_ms"], 10)

    def test_dot16_lut_cap_reports_infeasible_budget(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"dot16": run_benchmarks.build_acceptance_benchmarks()["dot16"]},
            config,
        )
        lut_cap = results["benchmarks"]["dot16"]["runs"]["latency_under_lut"]
        self.assertFalse(lut_cap["feasible"])
        self.assertIn("no feasible solution", lut_cap.get("message", ""))

    def test_summary_uses_least_latency_regression_when_needed(self) -> None:
        fake_results = {
            "metadata": {},
            "benchmarks": {
                "demo": {
                    "original_ir": {
                        "ir_nodes": [
                            {"id": "n0", "op": "input", "name": "x"},
                        ],
                        "root": "n0",
                    },
                    "original_metrics": {
                        "area": 10,
                        "latency": 5,
                        "dsp_count": 1,
                        "lut_count": 0,
                    },
                    "runs": {
                        "weighted": {
                            "feasible": True,
                            "metrics": {
                                "area": 8,
                                "latency": 6,
                                "dsp_count": 0,
                                "lut_count": 8,
                            },
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_unconstrained": {
                            "feasible": True,
                            "metrics": {
                                "area": 9,
                                "latency": 4,
                                "dsp_count": 1,
                                "lut_count": 0,
                            },
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_under_area": {
                            "feasible": True,
                            "metrics": {
                                "area": 10,
                                "latency": 4,
                                "dsp_count": 1,
                                "lut_count": 0,
                            },
                            "applied_budgets": {"area_max": 10},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "area_under_latency": {
                            "feasible": True,
                            "metrics": {
                                "area": 9,
                                "latency": 5,
                                "dsp_count": 1,
                                "lut_count": 0,
                            },
                            "applied_budgets": {"latency_max": 5},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_under_dsp": {
                            "feasible": True,
                            "metrics": {
                                "area": 8,
                                "latency": 6,
                                "dsp_count": 0,
                                "lut_count": 8,
                            },
                            "applied_budgets": {"dsp_max": 0},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_under_lut": {
                            "feasible": False,
                            "message": "no feasible solution satisfies the provided budgets",
                            "applied_budgets": {"lut_max": 0},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "pareto_2d": {
                            "feasible": True,
                            "frontier": [],
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                    },
                    "weight_sweep": [],
                    "dsp_budget_sweep": [
                        {
                            "dsp_max": 0,
                            "feasible": True,
                            "metrics": {"area": 8, "latency": 6, "dsp_count": 0, "lut_count": 8},
                            "applied_budgets": {"dsp_max": 0},
                        },
                        {
                            "dsp_max": 1,
                            "feasible": True,
                            "metrics": {"area": 9, "latency": 4, "dsp_count": 1, "lut_count": 0},
                            "applied_budgets": {"dsp_max": 1},
                        },
                    ],
                }
            },
        }
        summary = run_benchmarks.summarize_results(fake_results)
        self.assertEqual(summary["overview"]["best_latency_label"], "Least Latency Regression")
        with tempfile.TemporaryDirectory() as tmpdir:
            path = Path(tmpdir) / "analysis.md"
            run_benchmarks.write_analysis_markdown(fake_results, summary, path)
            self.assertIn("Least Latency Regression", path.read_text())

    def test_report_artifacts_are_generated(self) -> None:
        fake_results = {
            "metadata": {
                "baseline_multiply_mapping_policy": "generic_mul_defaults_to_dsp_metrics",
                "budget_profiles": {},
                "dsp_budget_sweep": {"enabled": True, "start": 0, "stop_mode": "original_dsp_count", "step": 1},
            },
            "benchmarks": {
                "demo": {
                    "original_ir": {
                        "ir_nodes": [
                            {"id": "n0", "op": "input", "name": "x"},
                            {"id": "n1", "op": "const", "value": 2},
                            {"id": "n2", "op": "mul", "inputs": ["n0", "n1"]},
                        ],
                        "root": "n2",
                    },
                    "original_metrics": {
                        "area": 4,
                        "latency": 3,
                        "dsp_count": 1,
                        "lut_count": 0,
                    },
                    "runs": {
                        "weighted": {
                            "feasible": True,
                            "optimized_ir": {
                                "ir_nodes": [
                                    {"id": "n0", "op": "input", "name": "x"},
                                    {"id": "n1", "op": "input", "name": "x"},
                                    {"id": "n2", "op": "add", "inputs": ["n0", "n1"]},
                                ],
                                "root": "n2",
                            },
                            "metrics": {
                                "area": 1,
                                "latency": 1,
                                "dsp_count": 0,
                                "lut_count": 1,
                            },
                            "score": 2.0,
                            "applied_budgets": {},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_unconstrained": {
                            "feasible": True,
                            "optimized_ir": {
                                "ir_nodes": [
                                    {"id": "n0", "op": "input", "name": "x"},
                                    {"id": "n1", "op": "const", "value": 2},
                                    {"id": "n2", "op": "mul_dsp", "inputs": ["n0", "n1"]},
                                ],
                                "root": "n2",
                            },
                            "metrics": {
                                "area": 6,
                                "latency": 3,
                                "dsp_count": 1,
                                "lut_count": 0,
                            },
                            "score": 3.0,
                            "applied_budgets": {},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_under_area": {
                            "feasible": True,
                            "optimized_ir": {
                                "ir_nodes": [
                                    {"id": "n0", "op": "input", "name": "x"},
                                    {"id": "n1", "op": "input", "name": "x"},
                                    {"id": "n2", "op": "add", "inputs": ["n0", "n1"]},
                                ],
                                "root": "n2",
                            },
                            "metrics": {
                                "area": 1,
                                "latency": 1,
                                "dsp_count": 0,
                                "lut_count": 1,
                            },
                            "score": 1.0,
                            "applied_budgets": {"area_max": 4},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "area_under_latency": {
                            "feasible": True,
                            "optimized_ir": {
                                "ir_nodes": [
                                    {"id": "n0", "op": "input", "name": "x"},
                                    {"id": "n1", "op": "input", "name": "x"},
                                    {"id": "n2", "op": "add", "inputs": ["n0", "n1"]},
                                ],
                                "root": "n2",
                            },
                            "metrics": {
                                "area": 1,
                                "latency": 1,
                                "dsp_count": 0,
                                "lut_count": 1,
                            },
                            "score": 1.0,
                            "applied_budgets": {"latency_max": 3},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_under_dsp": {
                            "feasible": True,
                            "optimized_ir": {
                                "ir_nodes": [
                                    {"id": "n0", "op": "input", "name": "x"},
                                    {"id": "n1", "op": "input", "name": "x"},
                                    {"id": "n2", "op": "add", "inputs": ["n0", "n1"]},
                                ],
                                "root": "n2",
                            },
                            "metrics": {
                                "area": 1,
                                "latency": 1,
                                "dsp_count": 0,
                                "lut_count": 1,
                            },
                            "score": 1.0,
                            "applied_budgets": {"dsp_max": 0},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "latency_under_lut": {
                            "feasible": True,
                            "optimized_ir": {
                                "ir_nodes": [
                                    {"id": "n0", "op": "input", "name": "x"},
                                    {"id": "n1", "op": "const", "value": 2},
                                    {"id": "n2", "op": "mul_dsp", "inputs": ["n0", "n1"]},
                                ],
                                "root": "n2",
                            },
                            "metrics": {
                                "area": 6,
                                "latency": 3,
                                "dsp_count": 1,
                                "lut_count": 0,
                            },
                            "score": 3.0,
                            "applied_budgets": {"lut_max": 0},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                        "pareto_2d": {
                            "feasible": True,
                            "frontier": [
                                {
                                    "optimized_ir": {
                                        "ir_nodes": [
                                            {"id": "n0", "op": "input", "name": "x"},
                                            {"id": "n1", "op": "input", "name": "x"},
                                            {"id": "n2", "op": "add", "inputs": ["n0", "n1"]},
                                        ],
                                        "root": "n2",
                                    },
                                    "metrics": {
                                        "area": 1,
                                        "latency": 1,
                                        "dsp_count": 0,
                                        "lut_count": 1,
                                    },
                                }
                            ],
                            "applied_budgets": {},
                            "stats": {"runtime_ms": 10, "iterations": 2},
                        },
                    },
                    "weight_sweep": [
                        {
                            "weights": {"w_area": 6.0, "w_latency": 1.0},
                            "response": {
                                "feasible": True,
                                "optimized_ir": {
                                    "ir_nodes": [
                                        {"id": "n0", "op": "input", "name": "x"},
                                        {"id": "n1", "op": "const", "value": 2},
                                        {"id": "n2", "op": "mul_lut", "inputs": ["n0", "n1"]},
                                    ],
                                    "root": "n2",
                                },
                                "metrics": {
                                    "area": 4,
                                    "latency": 6,
                                    "dsp_count": 0,
                                    "lut_count": 8,
                                },
                                "score": 30.0,
                                "applied_budgets": {},
                                "stats": {"runtime_ms": 10, "iterations": 2},
                            },
                        }
                    ],
                    "dsp_budget_sweep": [
                        {
                            "dsp_max": 0,
                            "feasible": True,
                            "metrics": {
                                "area": 4,
                                "latency": 6,
                                "dsp_count": 0,
                                "lut_count": 8,
                            },
                            "applied_budgets": {"dsp_max": 0},
                        },
                        {
                            "dsp_max": 1,
                            "feasible": True,
                            "metrics": {
                                "area": 6,
                                "latency": 3,
                                "dsp_count": 1,
                                "lut_count": 0,
                            },
                            "applied_budgets": {"dsp_max": 1},
                        },
                    ],
                }
            }
        }
        with tempfile.TemporaryDirectory() as tmpdir:
            tmp = Path(tmpdir)
            artifacts = run_benchmarks.write_report_artifacts(
                fake_results,
                report_path=tmp / "report.html",
                analysis_path=tmp / "analysis.md",
                summary_csv_path=tmp / "summary.csv",
            )
            self.assertTrue(Path(artifacts["report_path"]).exists())
            self.assertTrue(Path(artifacts["analysis_path"]).exists())
            self.assertTrue(Path(artifacts["summary_csv_path"]).exists())
            self.assertIn("Datapath Benchmark Report", Path(artifacts["report_path"]).read_text())
            self.assertIn("Original IR", Path(artifacts["report_path"]).read_text())
            self.assertIn("Weight-sweep sampled curve", Path(artifacts["report_path"]).read_text())
            self.assertIn("Bigger FPGA, Faster Datapath?", Path(artifacts["report_path"]).read_text())
            self.assertIn("Latency-optimal (no budgets)", Path(artifacts["report_path"]).read_text())
            self.assertIn("Benchmark Analysis", Path(artifacts["analysis_path"]).read_text())

    def test_paper_figures_are_generated(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"fir8": run_benchmarks.build_acceptance_benchmarks()["fir8"]},
            config,
        )
        with tempfile.TemporaryDirectory() as tmpdir:
            figure_paths = run_benchmarks.write_paper_figures(
                results,
                output_dir=Path(tmpdir),
            )
            self.assertTrue(Path(figure_paths["fir8_tradeoff_svg"]).exists())
            self.assertTrue(Path(figure_paths["fir8_tradeoff_png"]).exists())
            self.assertTrue(Path(figure_paths["fir8_dsp_scaling_svg"]).exists())
            self.assertTrue(Path(figure_paths["fir8_dsp_scaling_png"]).exists())

    def test_run_size_sweep_suite_collects_runtime_and_pareto_points(self) -> None:
        config = run_benchmarks.load_benchmark_config()

        def fake_batch_response(request: dict) -> dict:
            op_count = sum(
                1
                for node in request["ir_nodes"]
                if node["op"] in {"add", "sub", "mul"}
            )
            benchmark_name = request["benchmark_name"]
            frontier = [
                {
                    "optimized_ir": {
                        "ir_nodes": request["ir_nodes"],
                        "root": request["root"],
                    },
                    "metrics": {
                        "area": op_count,
                        "latency": max(1, op_count // 2),
                        "dsp_count": 0,
                        "lut_count": op_count,
                        "power": op_count,
                    },
                }
                for _ in range(max(1, op_count // 4))
            ]
            return {
                "benchmark_name": benchmark_name,
                "shared_stats": {
                    "iterations": 2,
                    "eclasses": op_count + 1,
                    "enodes": op_count + 2,
                    "runtime_ms": op_count * 3,
                    "shared_runtime_us": op_count * 3000,
                    "saturation_runtime_us": op_count * 2200,
                    "frontier_runtime_us": op_count * 800,
                },
                "results": [
                    {
                        "name": "weighted",
                        "feasible": True,
                        "optimized_ir": {
                            "ir_nodes": request["ir_nodes"],
                            "root": request["root"],
                        },
                        "metrics": {
                            "area": op_count,
                            "latency": max(1, op_count // 2),
                            "dsp_count": 0,
                            "lut_count": op_count,
                            "power": op_count,
                        },
                        "score": float(op_count),
                        "selection_runtime_us": op_count * 40,
                    },
                    {
                        "name": "latency_under_area",
                        "feasible": True,
                        "optimized_ir": {
                            "ir_nodes": request["ir_nodes"],
                            "root": request["root"],
                        },
                        "metrics": {
                            "area": op_count,
                            "latency": max(1, op_count // 3),
                            "dsp_count": 0,
                            "lut_count": op_count,
                            "power": op_count,
                        },
                        "score": float(max(1, op_count // 3)),
                        "selection_runtime_us": op_count * 25,
                    },
                    {
                        "name": "pareto_2d",
                        "feasible": True,
                        "frontier": frontier,
                        "selection_runtime_us": op_count * 10,
                    },
                ],
            }

        with mock.patch.object(
            run_benchmarks,
            "run_optimizer_batch",
            side_effect=fake_batch_response,
        ):
            results = run_benchmarks.run_size_sweep_suite(config)

        self.assertEqual(set(results["families"].keys()), {"fir", "dot"})
        fir_entries = results["families"]["fir"]
        dot_entries = results["families"]["dot"]
        self.assertEqual([entry["problem_size"] for entry in fir_entries], [4, 8, 16, 32])
        self.assertEqual([entry["problem_size"] for entry in dot_entries], [8, 16, 32, 64])
        self.assertTrue(all(entry["shared_stats"]["runtime_ms"] > 0 for entry in fir_entries + dot_entries))
        self.assertTrue(
            all(
                entry["latency_under_area"]["selection_runtime_us"] > 0
                for entry in fir_entries + dot_entries
            )
        )
        self.assertTrue(all(entry["pareto_points"] > 0 for entry in fir_entries + dot_entries))
        summary = run_benchmarks.summarize_size_sweep_results(results)
        self.assertEqual(summary["overview"]["family_count"], 2)
        self.assertGreater(summary["overview"]["max_op_count"], 0)
        self.assertTrue(
            all(
                len(summary["families"][family_name]["selection_runtime_ms"]) > 0
                for family_name in summary["families"]
            )
        )

    def test_size_sweep_figures_are_generated(self) -> None:
        fake_results = {
            "metadata": {"family_sizes": {"fir": [4, 8], "dot": [8, 16]}},
            "families": {
                "fir": [
                    {
                        "benchmark_name": "fir4",
                        "family": "fir",
                        "problem_size": 4,
                        "op_count": 7,
                        "shared_stats": {
                            "runtime_ms": 12,
                            "shared_runtime_us": 12000,
                            "saturation_runtime_us": 9000,
                            "frontier_runtime_us": 3000,
                        },
                        "latency_under_area": {"selection_runtime_us": 120},
                        "pareto_points": 3,
                    },
                    {
                        "benchmark_name": "fir8",
                        "family": "fir",
                        "problem_size": 8,
                        "op_count": 15,
                        "shared_stats": {
                            "runtime_ms": 24,
                            "shared_runtime_us": 24000,
                            "saturation_runtime_us": 18000,
                            "frontier_runtime_us": 6000,
                        },
                        "latency_under_area": {"selection_runtime_us": 180},
                        "pareto_points": 6,
                    },
                ],
                "dot": [
                    {
                        "benchmark_name": "dot8",
                        "family": "dot",
                        "problem_size": 8,
                        "op_count": 15,
                        "shared_stats": {
                            "runtime_ms": 18,
                            "shared_runtime_us": 18000,
                            "saturation_runtime_us": 13500,
                            "frontier_runtime_us": 4500,
                        },
                        "latency_under_area": {"selection_runtime_us": 150},
                        "pareto_points": 4,
                    },
                    {
                        "benchmark_name": "dot16",
                        "family": "dot",
                        "problem_size": 16,
                        "op_count": 31,
                        "shared_stats": {
                            "runtime_ms": 44,
                            "shared_runtime_us": 44000,
                            "saturation_runtime_us": 33000,
                            "frontier_runtime_us": 11000,
                        },
                        "latency_under_area": {"selection_runtime_us": 260},
                        "pareto_points": 9,
                    },
                ],
            },
        }
        with tempfile.TemporaryDirectory() as tmpdir:
            figure_paths = run_benchmarks.write_size_sweep_figures(
                fake_results,
                output_dir=Path(tmpdir),
            )
            self.assertTrue(Path(figure_paths["size_sweep_frontier_svg"]).exists())
            self.assertTrue(Path(figure_paths["size_sweep_frontier_png"]).exists())
            self.assertTrue(Path(figure_paths["size_sweep_scaling_svg"]).exists())
            self.assertTrue(Path(figure_paths["size_sweep_scaling_png"]).exists())

    def test_hls_cpp_export_generates_resource_annotated_sources(self) -> None:
        fake_graph = {
            "ir_nodes": [
                {"id": "a", "op": "input", "name": "a"},
                {"id": "b", "op": "input", "name": "b"},
                {"id": "c", "op": "input", "name": "c"},
                {"id": "m0", "op": "mul_dsp", "inputs": ["a", "b"]},
                {"id": "m1", "op": "mul_lut", "inputs": ["m0", "c"]},
                {"id": "r", "op": "add_dsp", "inputs": ["m1", "a"]},
            ],
            "root": "r",
        }
        fake_results = {
            "benchmarks": {
                "toy": {
                    "original_ir": fake_graph,
                    "original_metrics": {
                        "area": 14,
                        "latency": 10,
                        "power": 10,
                        "dsp_count": 2,
                        "lut_count": 8,
                    },
                    "runs": {
                        "weighted": {
                            "feasible": True,
                            "optimized_ir": fake_graph,
                            "metrics": {
                                "area": 14,
                                "latency": 10,
                                "power": 10,
                                "dsp_count": 2,
                                "lut_count": 8,
                            },
                        }
                    },
                }
            }
        }
        with tempfile.TemporaryDirectory() as tmpdir:
            results_path = Path(tmpdir) / "results.json"
            results_path.write_text(json.dumps(fake_results))
            out_dir = Path(tmpdir) / "hls"
            export_hls_cpp.export_hls_cpp(
                results_path=results_path,
                output_dir=out_dir,
                benchmarks=["toy"],
                variants=["original", "weighted", "latency_under_lut"],
                test_vectors=8,
            )
            source = (out_dir / "src" / "toy_weighted.cpp").read_text()
            header = (out_dir / "src" / "generated_datapaths.hpp").read_text()
            metadata = (out_dir / "metadata" / "generated_variants.json").read_text()
            self.assertIn("dsp_mul", source)
            self.assertIn("soft_mul", source)
            self.assertIn("// op: mul_dsp", source)
            self.assertIn("// op: mul_lut", source)
            self.assertIn("math_dsp_control", header)
            self.assertIn("latency_under_lut", metadata)
            self.assertTrue((out_dir / "scripts" / "run_cpp_tests.sh").exists())
            self.assertTrue((out_dir / "scripts" / "run_intel_hls.sh").exists())
            self.assertTrue((out_dir / "scripts" / "parse_hls_reports.py").exists())
            self.assertTrue((out_dir / "README.md").exists())

    def test_rtl_export_generates_quartus_validation_flow(self) -> None:
        builder = run_benchmarks.IrBuilder()
        a = builder.input("a")
        b = builder.input("b")
        original_root = builder.mul(a, b)
        fake_graph = builder.graph(original_root)
        weighted_graph = {
            "ir_nodes": [
                {"id": "n0", "op": "input", "name": "a"},
                {"id": "n1", "op": "input", "name": "b"},
                {"id": "n2", "op": "mul_dsp", "inputs": ["n0", "n1"]},
                {"id": "n3", "op": "input", "name": "c"},
                {"id": "n4", "op": "mul_lut", "inputs": ["n2", "n3"]},
            ],
            "root": "n4",
        }
        fake_results = {
            "benchmarks": {
                "toy": {
                    "original_ir": fake_graph,
                    "original_metrics": {
                        "area": 6,
                        "latency": 3,
                        "power": 3,
                        "dsp_count": 1,
                        "lut_count": 0,
                    },
                    "runs": {
                        "weighted": {
                            "feasible": True,
                            "optimized_ir": weighted_graph,
                            "metrics": {
                                "area": 10,
                                "latency": 9,
                                "power": 9,
                                "dsp_count": 2,
                                "lut_count": 8,
                            },
                        }
                    },
                }
            }
        }
        with tempfile.TemporaryDirectory() as tmpdir:
            results_path = Path(tmpdir) / "results.json"
            results_path.write_text(json.dumps(fake_results))
            out_dir = Path(tmpdir) / "rtl"
            export_rtl_validation.export_rtl_validation(
                results_path=results_path,
                output_dir=out_dir,
                benchmarks=["toy"],
                variants=["original", "weighted"],
                family="Arria10",
                device="10AX115U1F45I1SG",
                clock_ns=2.0,
                test_vectors=4,
            )
            source = (out_dir / "src" / "toy_weighted.v").read_text()
            metadata = json.loads((out_dir / "metadata" / "generated_variants.json").read_text())
            weighted = next(item for item in metadata["variants"] if item["variant"] == "weighted")
            self.assertIn('(* multstyle = "dsp" *)', source)
            self.assertIn('(* multstyle = "logic" *)', source)
            self.assertEqual(weighted["rtl_intended_dsp_count"], 1)
            self.assertEqual(weighted["rtl_intended_logic_mul_count"], 1)
            self.assertTrue((out_dir / "tests" / "tb_toy.sv").exists())
            self.assertTrue((out_dir / "quartus" / "toy_weighted" / "toy_weighted.qsf").exists())
            self.assertTrue((out_dir / "scripts" / "run_functional_sim.sh").exists())
            self.assertTrue((out_dir / "scripts" / "run_quartus_compile.sh").exists())
            self.assertTrue((out_dir / "scripts" / "parse_quartus_reports.py").exists())


if __name__ == "__main__":
    unittest.main()
