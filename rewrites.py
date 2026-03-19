"""
rewrites.py — Algebraic rewrite rules for the SEER optimizer.

Each rule is a callable(egraph) → list[(id_a, id_b)] of pairs to union.
"""

from __future__ import annotations
from typing import List, Tuple
from egraph import EGraph

# ---------------------------------------------------------------------------
# Helper: iterate all canonical enodes in the e-graph
# ---------------------------------------------------------------------------

def _matches(eg: EGraph):
    """Yield (canonical_enode, eclass_id) for every live entry."""
    seen = set()
    for node, eid in list(eg.hashcons.items()):
        canon = eg._canonicalize(node)
        rid = eg.find(eid)
        key = (canon, rid)
        if key not in seen:
            seen.add(key)
            yield canon, rid


# ---------------------------------------------------------------------------
# Individual rewrite rules
# ---------------------------------------------------------------------------

def rule_add_zero(eg: EGraph) -> List[Tuple[int, int]]:
    """Add(x, 0) → x"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Add":
            r = eg.find(node[2])
            # check if the right child's eclass contains Const(0)
            for rn in eg.eclass.get(r, set()):
                if rn == ("Const", 0):
                    merges.append((eid, eg.find(node[1])))
    return merges

def rule_mul_one(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(x, 1) → x"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            r = eg.find(node[2])
            for rn in eg.eclass.get(r, set()):
                if rn == ("Const", 1):
                    merges.append((eid, eg.find(node[1])))
    return merges

def rule_mul_zero(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(x, 0) → 0"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            r = eg.find(node[2])
            for rn in eg.eclass.get(r, set()):
                if rn == ("Const", 0):
                    zero_id = eg._add_node(("Const", 0))
                    merges.append((eid, zero_id))
    return merges

def rule_add_self(eg: EGraph) -> List[Tuple[int, int]]:
    """Add(x, x) → Mul(2, x)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Add" and eg.find(node[1]) == eg.find(node[2]):
            two_id = eg._add_node(("Const", 2))
            mul_id = eg._add_node(("Mul", two_id, eg.find(node[1])))
            merges.append((eid, mul_id))
    return merges

def rule_sub_self(eg: EGraph) -> List[Tuple[int, int]]:
    """Sub(x, x) → 0"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Sub" and eg.find(node[1]) == eg.find(node[2]):
            zero_id = eg._add_node(("Const", 0))
            merges.append((eid, zero_id))
    return merges

def rule_add_comm(eg: EGraph) -> List[Tuple[int, int]]:
    """Add(x, y) → Add(y, x)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Add":
            swap_id = eg._add_node(("Add", eg.find(node[2]), eg.find(node[1])))
            merges.append((eid, swap_id))
    return merges

def rule_mul_comm(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(x, y) → Mul(y, x)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            swap_id = eg._add_node(("Mul", eg.find(node[2]), eg.find(node[1])))
            merges.append((eid, swap_id))
    return merges

def rule_add_assoc(eg: EGraph) -> List[Tuple[int, int]]:
    """Add(x, Add(y, z)) → Add(Add(x, y), z)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Add":
            r = eg.find(node[2])
            for rn in eg.eclass.get(r, set()):
                if rn[0] == "Add":
                    xy = eg._add_node(("Add", eg.find(node[1]), eg.find(rn[1])))
                    new = eg._add_node(("Add", xy, eg.find(rn[2])))
                    merges.append((eid, new))
    return merges

def rule_mul_assoc(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(x, Mul(y, z)) → Mul(Mul(x, y), z)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            r = eg.find(node[2])
            for rn in eg.eclass.get(r, set()):
                if rn[0] == "Mul":
                    xy = eg._add_node(("Mul", eg.find(node[1]), eg.find(rn[1])))
                    new = eg._add_node(("Mul", xy, eg.find(rn[2])))
                    merges.append((eid, new))
    return merges

def rule_distribute(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(x, Add(y, z)) → Add(Mul(x, y), Mul(x, z))"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            r = eg.find(node[2])
            for rn in eg.eclass.get(r, set()):
                if rn[0] == "Add":
                    x = eg.find(node[1])
                    xy = eg._add_node(("Mul", x, eg.find(rn[1])))
                    xz = eg._add_node(("Mul", x, eg.find(rn[2])))
                    new = eg._add_node(("Add", xy, xz))
                    merges.append((eid, new))
    return merges

# ---------------------------------------------------------------------------
# Constant folding rules
# ---------------------------------------------------------------------------

def _const_val(eg: EGraph, eid: int):
    """If this eclass contains a Const, return its value, else None."""
    for n in eg.eclass.get(eg.find(eid), set()):
        if n[0] == "Const":
            return n[1]
    return None

def rule_const_fold_add(eg: EGraph) -> List[Tuple[int, int]]:
    """Add(Const(a), Const(b)) → Const(a + b)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Add":
            a = _const_val(eg, node[1])
            b = _const_val(eg, node[2])
            if a is not None and b is not None:
                new_id = eg._add_node(("Const", a + b))
                merges.append((eid, new_id))
    return merges

def rule_const_fold_mul(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(Const(a), Const(b)) → Const(a * b)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            a = _const_val(eg, node[1])
            b = _const_val(eg, node[2])
            if a is not None and b is not None:
                new_id = eg._add_node(("Const", a * b))
                merges.append((eid, new_id))
    return merges

def rule_const_fold_sub(eg: EGraph) -> List[Tuple[int, int]]:
    """Sub(Const(a), Const(b)) → Const(a - b)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Sub":
            a = _const_val(eg, node[1])
            b = _const_val(eg, node[2])
            if a is not None and b is not None:
                new_id = eg._add_node(("Const", a - b))
                merges.append((eid, new_id))
    return merges

# ---------------------------------------------------------------------------
# Strength reduction
# ---------------------------------------------------------------------------

def rule_mul_two(eg: EGraph) -> List[Tuple[int, int]]:
    """Mul(x, 2) → Add(x, x)  (strength reduction: mul by 2 is cheaper as add)"""
    merges = []
    for node, eid in _matches(eg):
        if node[0] == "Mul":
            two = _const_val(eg, node[2])
            if two == 2:
                x = eg.find(node[1])
                add_id = eg._add_node(("Add", x, x))
                merges.append((eid, add_id))
    return merges


# ---------------------------------------------------------------------------
# Collect all rules
# ---------------------------------------------------------------------------

ALL_RULES = [
    # Algebraic identities
    rule_add_zero, rule_mul_one, rule_mul_zero,
    rule_add_self, rule_sub_self,
    # Structural
    rule_add_comm, rule_mul_comm,
    rule_add_assoc, rule_mul_assoc,
    rule_distribute,
    # Constant folding
    rule_const_fold_add, rule_const_fold_mul, rule_const_fold_sub,
    # Strength reduction
    rule_mul_two,
]

