#!/usr/bin/env python3
"""
main.py — SEER-style cost-guided program optimizer.

Runs a benchmark suite through e-graph equality saturation and extracts
the lowest-cost expression under multiple hardware cost models.
Optionally generates a Graphviz visualization of the e-graph.
"""

from __future__ import annotations
import os, subprocess, shutil
from expression import Expr, Const, Var, Add, Sub, Mul
from egraph import EGraph
from rewrites import ALL_RULES
from extractor import extract
from cost_model import ALL_COST_MODELS, AREA_COST

# ---------------------------------------------------------------------------
# Benchmark suite
# ---------------------------------------------------------------------------
x, y, z = Var("x"), Var("y"), Var("z")

def add_chain(var: Expr, depth: int) -> Expr:
    """Build Add(var, Add(var, Add(var, ... var))) of given depth."""
    result = var
    for _ in range(depth - 1):
        result = Add(var, result)
    return result

BENCHMARKS = [
    # --- Identity simplifications ---
    ("Mul(Add(x,0),1)",             Mul(Add(x, Const(0)), Const(1))),
    ("Add(x,x)",                    Add(x, x)),
    ("Sub(x,x)",                    Sub(x, x)),

    # --- Deep Add chains (x+x+x+... = n*x) ---
    ("x+x+x+x  (depth=4)",         add_chain(x, 4)),
    ("x+x+x+x+x+x+x+x (depth=8)", add_chain(x, 8)),

    # --- Redundant computation elimination ---
    ("Add(Mul(x,1),Mul(x,1))",      Add(Mul(x, Const(1)), Mul(x, Const(1)))),
    ("Add(Mul(x,0),Mul(y,1))",      Add(Mul(x, Const(0)), Mul(y, Const(1)))),

    # --- Strength reduction trade-offs ---
    ("Mul(x,2)",                    Mul(x, Const(2))),
    ("Mul(Add(x,y),2)",             Mul(Add(x, y), Const(2))),

    # --- Dead-code-like patterns ---
    ("Mul(Sub(x,x),Add(y,z))",      Mul(Sub(x, x), Add(y, z))),
    ("Add(Mul(x,0),y)",             Add(Mul(x, Const(0)), y)),

    # --- Polynomial-like expressions ---
    ("Mul(Add(x,x),Add(y,y))",      Mul(Add(x, x), Add(y, y))),
    ("Add(Mul(x,y),Mul(x,z))",      Add(Mul(x, y), Mul(x, z))),

    # --- Constant folding chains ---
    ("Mul(Add(2,3),x)",             Mul(Add(Const(2), Const(3)), x)),
    ("Add(Mul(2,3),Mul(4,5))",      Add(Mul(Const(2), Const(3)), Mul(Const(4), Const(5)))),

    # --- Mixed deep nesting ---
    ("Mul(Add(x,x),Mul(y,1))",      Mul(Add(x, x), Mul(y, Const(1)))),
    ("Sub(Mul(x,1),Mul(x,1))",      Sub(Mul(x, Const(1)), Mul(x, Const(1)))),
]


# ---------------------------------------------------------------------------
# Run a single expression through the optimizer
# ---------------------------------------------------------------------------

def optimize(expr: Expr, cost_model, max_iters: int = 8, node_limit: int = 500):
    eg = EGraph()
    root = eg.add(expr)
    eg.apply_rules(ALL_RULES, max_iters, node_limit=node_limit)
    opt_expr, opt_cost = extract(eg, root, cost_model)
    return eg, root, opt_expr, opt_cost


def expr_cost(expr: Expr, cost_model) -> float:
    """Compute the cost of a raw AST (without e-graph optimisation)."""
    eg = EGraph()
    root = eg.add(expr)
    _, cost = extract(eg, root, cost_model)
    return cost

# ---------------------------------------------------------------------------
# Graphviz visualisation
# ---------------------------------------------------------------------------

def egraph_to_dot(eg: EGraph) -> str:
    lines = ["digraph egraph {", '  rankdir=TB;', '  compound=true;',
             '  node [shape=record, fontname="Courier"];']

    classes: dict[int, set] = {}
    for node, eid in eg.hashcons.items():
        canon = eg._canonicalize(node)
        rid = eg.find(eid)
        classes.setdefault(rid, set()).add(canon)

    # Subgraph per e-class
    for rid, nodes in sorted(classes.items()):
        lines.append(f'  subgraph cluster_{rid} {{')
        lines.append(f'    label="e-class {rid}"; style=dashed; color=blue;')
        for i, node in enumerate(sorted(nodes, key=str)):
            nid = f"n{rid}_{i}"
            if node[0] in ("Const", "Var"):
                label = f"{node[0]}({node[1]})"
            else:
                label = node[0]
            lines.append(f'    {nid} [label="{label}"];')
        lines.append("  }")

    # Edges from binary nodes to children e-classes
    node_index = {}
    for rid, nodes in sorted(classes.items()):
        for i, node in enumerate(sorted(nodes, key=str)):
            node_index[(rid, node)] = f"n{rid}_{i}"

    for rid, nodes in sorted(classes.items()):
        for node in nodes:
            if node[0] not in ("Const", "Var"):
                src = node_index.get((rid, node))
                if not src:
                    continue
                for ci, child_id in enumerate(node[1:]):
                    crid = eg.find(child_id)
                    # pick any node in child eclass as target
                    child_nodes = sorted(classes.get(crid, set()), key=str)
                    if child_nodes:
                        tgt = node_index.get((crid, child_nodes[0]))
                        if tgt:
                            side = "L" if ci == 0 else "R"
                            lines.append(f'  {src} -> {tgt} [label="{side}", '
                                         f'lhead=cluster_{crid}];')

    lines.append("}")
    return "\n".join(lines)


def render_egraph(eg: EGraph, filename: str = "egraph"):
    dot = egraph_to_dot(eg)
    dot_path = os.path.join(os.path.dirname(__file__), f"{filename}.dot")
    png_path = os.path.join(os.path.dirname(__file__), f"{filename}.png")
    with open(dot_path, "w") as f:
        f.write(dot)
    if shutil.which("dot"):
        r = subprocess.run(["dot", "-Tpng", dot_path, "-o", png_path],
                           capture_output=True)
        if r.returncode == 0:
            print(f"\n📊 E-graph visualisation saved → {png_path}")
        else:
            print(f"\n📊 E-graph DOT file saved → {dot_path}  (PNG render failed, graph may be too large)")
    else:
        print(f"\n📊 E-graph DOT file saved → {dot_path}  (install Graphviz to render PNG)")


# ---------------------------------------------------------------------------
# Table printer
# ---------------------------------------------------------------------------

def print_table(results):
    """Print a formatted benchmark results table and save to results.txt.

    results: list of (name, [(cost_model_name, orig_cost, opt_cost, opt_repr)])
    """
    # Pre-scan to find the widest content in each column
    col_expr = len("Expression")
    col_model = len("Cost Model")
    col_opt = len("Optimized")
    col_num = len("saved")  # minimum width for numeric columns

    for name, model_results in results:
        col_expr = max(col_expr, len(name))
        for cm_name, orig_c, opt_c, opt_repr in model_results:
            col_model = max(col_model, len(cm_name))
            col_opt = max(col_opt, len(opt_repr))
            col_num = max(col_num, len(f"{orig_c:.1f}"), len(f"{opt_c:.1f}"),
                          len(f"{orig_c - opt_c:.1f}"))

    # Add a little padding
    col_expr += 2
    col_model += 2
    col_opt += 2
    col_num = max(col_num + 2, 8)

    def row(expr, model, opt, orig_s, opt_s, saved_s):
        return (f"{expr:<{col_expr}} | {model:<{col_model}} "
                f"| {opt:<{col_opt}} | {orig_s:>{col_num}} "
                f"| {opt_s:>{col_num}} | {saved_s:>{col_num}}")

    header = row("Expression", "Cost Model", "Optimized", "orig", "opt", "saved")
    sep = "-" * len(header)

    lines = [sep, header, sep]

    for name, model_results in results:
        first = True
        for cm_name, orig_c, opt_c, opt_repr in model_results:
            saved = orig_c - opt_c
            label = name if first else ""
            lines.append(row(label, cm_name, opt_repr,
                             f"{orig_c:.1f}", f"{opt_c:.1f}", f"{saved:.1f}"))
            first = False
        lines.append(sep)

    table_text = "\n".join(lines)

    # Print to stdout
    print("\n" + table_text)

    # Save to file
    out_path = os.path.join(os.path.dirname(__file__), "results.txt")
    with open(out_path, "w") as f:
        f.write("SEER-style E-Graph Optimizer — Benchmark Results\n")
        f.write("=" * 50 + "\n\n")
        f.write(table_text + "\n")
    print(f"\n📄 Results saved → {out_path}")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    print("=" * 70)
    print("   SEER-style E-Graph Program Optimizer")
    print("   Cost-Guided Equality Saturation with Multiple Hardware Models")
    print("=" * 70)

    # --- Detailed output for specific test cases ---
    test_cases = [BENCHMARKS[0], BENCHMARKS[2]]
    for name, expr in test_cases:
        print(f"\n▸ Test case: {name}")
        _, _, opt, opt_cost = optimize(expr, AREA_COST)
        orig_cost = expr_cost(expr, AREA_COST)
        print(f"  Original:  {expr}")
        print(f"  Optimized: {opt}")
        print(f"  Original cost (area): {orig_cost:.0f}")
        print(f"  Optimized cost (area): {opt_cost:.0f}")

    # --- Full benchmark table ---
    results = []
    for name, expr in BENCHMARKS:
        model_results = []
        for cm in ALL_COST_MODELS:
            _, _, opt, opt_cost = optimize(expr, cm)
            orig_cost = expr_cost(expr, cm)
            model_results.append((cm.name, orig_cost, opt_cost, repr(opt)))
        results.append((name, model_results))

    print_table(results)

    # --- Graphviz for a simple benchmark ---
    simple_expr = Sub(x, x)
    eg = EGraph()
    root = eg.add(simple_expr)
    eg.apply_rules(ALL_RULES, max_iters=4, node_limit=100)
    render_egraph(eg, "egraph_example")


if __name__ == "__main__":
    main()
