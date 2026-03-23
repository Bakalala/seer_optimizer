from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

import run_benchmarks


class BenchmarkHarnessTest(unittest.TestCase):
    def test_acceptance_benchmarks_use_only_datapath_ops(self) -> None:
        benchmarks = run_benchmarks.build_acceptance_benchmarks()
        self.assertEqual(set(benchmarks.keys()), {"fir8", "dot16", "gemm_k8", "conv3x3", "stencil5"})
        allowed_ops = {"input", "const", "add", "sub", "mul"}
        for graph in benchmarks.values():
            self.assertTrue(graph["root"])
            for node in graph["ir_nodes"]:
                self.assertIn(node["op"], allowed_ops)

    def test_python_metric_model_matches_mul_two(self) -> None:
        graph = run_benchmarks.build_smoke_cases()["mul_two"]
        metrics = run_benchmarks.graph_metrics(graph)
        self.assertEqual(metrics, {"area": 6, "latency": 3, "dsp_count": 1, "lut_count": 0})

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

    def test_dot16_lut_cap_reports_infeasible_budget(self) -> None:
        config = run_benchmarks.load_benchmark_config()
        results = run_benchmarks.run_suite(
            {"dot16": run_benchmarks.build_acceptance_benchmarks()["dot16"]},
            config,
        )
        lut_cap = results["benchmarks"]["dot16"]["runs"]["latency_under_lut"]
        self.assertFalse(lut_cap["feasible"])
        self.assertIn("no feasible solution", lut_cap.get("message", ""))

    def test_report_artifacts_are_generated(self) -> None:
        fake_results = {
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
                                "stats": {"runtime_ms": 10, "iterations": 2},
                            },
                        }
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
            self.assertIn("Benchmark Analysis", Path(artifacts["analysis_path"]).read_text())


if __name__ == "__main__":
    unittest.main()
