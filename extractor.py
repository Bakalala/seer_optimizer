"""
extractor.py — Bottom-up cost-guided extraction from an e-graph.

For each e-class, picks the e-node whose (node_cost + sum of children costs)
is minimal, then reconstructs the corresponding AST.
"""

from __future__ import annotations
from typing import Dict, Tuple
from egraph import EGraph
from expression import Expr, Const, Var, Add, Sub, Mul

_BIN_OPS = {"Add": Add, "Sub": Sub, "Mul": Mul}


def extract(eg: EGraph, root_id: int, cost_model) -> Tuple[Expr, float]:
    """
    Extract the lowest-cost expression from *root_id*'s e-class.

    Returns (expr, total_cost).
    """
    best_cost: Dict[int, float] = {}   # eclass id → best total cost
    best_node: Dict[int, tuple] = {}   # eclass id → best enode

    # Collect canonical e-classes
    classes: Dict[int, set] = {}
    for node, eid in eg.hashcons.items():
        canon = eg._canonicalize(node)
        rid = eg.find(eid)
        classes.setdefault(rid, set()).add(canon)

    # Keep iterating until costs stabilise (handles cycles from commutativity)
    changed = True
    while changed:
        changed = False
        for rid, nodes in classes.items():
            for node in nodes:
                tag = node[0]
                nc = cost_model.node_cost(tag)
                if tag in ("Const", "Var"):
                    total = nc
                else:
                    children = [eg.find(c) for c in node[1:]]
                    if any(c not in best_cost for c in children):
                        continue
                    total = nc + sum(best_cost[c] for c in children)
                if rid not in best_cost or total < best_cost[rid]:
                    best_cost[rid] = total
                    best_node[rid] = node
                    changed = True

    return _reconstruct(eg, eg.find(root_id), best_node), best_cost.get(eg.find(root_id), float("inf"))


def _reconstruct(eg: EGraph, rid: int, best_node: Dict[int, tuple]) -> Expr:
    node = best_node[rid]
    tag = node[0]
    if tag == "Const":
        return Const(node[1])
    if tag == "Var":
        return Var(node[1])
    left  = _reconstruct(eg, eg.find(node[1]), best_node)
    right = _reconstruct(eg, eg.find(node[2]), best_node)
    return _BIN_OPS[tag](left, right)
