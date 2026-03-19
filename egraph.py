"""
egraph.py — Pure-Python E-Graph with union-find and equality saturation.

An e-graph stores equivalence classes (e-classes) of e-nodes.
Each e-node is (operator, child_eclass_id, …).
Rewrite rules are applied iteratively until no new merges occur (saturation).
"""

from __future__ import annotations
from typing import Dict, List, Set, Tuple, Optional, Callable
from expression import Expr, Const, Var, Add, Sub, Mul

# An ENode is (operator_tag, *children_ids)
# Leaf nodes:  ("Const", value)  or  ("Var", name)
# Binary nodes: ("Add", id_l, id_r), etc.
ENode = tuple

class EGraph:
    """Minimal e-graph backed by a union-find."""

    def __init__(self):
        self.parent: Dict[int, int] = {}      # union-find parent
        self.eclass: Dict[int, Set[ENode]] = {}  # eclass id → set of enodes
        self.hashcons: Dict[ENode, int] = {}   # canonical enode → eclass id
        self._next_id = 0

    # ------ Union-Find ------
    def _make_id(self) -> int:
        i = self._next_id; self._next_id += 1
        self.parent[i] = i; self.eclass[i] = set()
        return i

    def find(self, i: int) -> int:
        while self.parent[i] != i:
            self.parent[i] = self.parent[self.parent[i]]  # path compression
            i = self.parent[i]
        return i

    def union(self, a: int, b: int) -> int:
        a, b = self.find(a), self.find(b)
        if a == b:
            return a
        # merge smaller into larger
        if len(self.eclass[a]) < len(self.eclass[b]):
            a, b = b, a
        self.parent[b] = a
        self.eclass[a] |= self.eclass[b]
        return a

    # ------ Canonicalization ------
    def _canonicalize(self, node: ENode) -> ENode:
        """Replace children ids with their canonical (find) ids."""
        tag = node[0]
        if tag in ("Const", "Var"):
            return node
        return (tag,) + tuple(self.find(c) for c in node[1:])

    def _rebuild(self):
        """Re-canonicalize the hashcons and eclass sets after unions."""
        new_hashcons: Dict[ENode, int] = {}
        for node, eid in list(self.hashcons.items()):
            canon = self._canonicalize(node)
            eid = self.find(eid)
            if canon in new_hashcons:
                eid = self.union(eid, new_hashcons[canon])
            new_hashcons[canon] = eid
        self.hashcons = new_hashcons
        # Rebuild eclass sets
        new_eclass: Dict[int, Set[ENode]] = {}
        for node, eid in self.hashcons.items():
            rid = self.find(eid)
            new_eclass.setdefault(rid, set()).add(node)
        self.eclass = new_eclass

    # ------ Insertion ------
    def _add_node(self, node: ENode) -> int:
        canon = self._canonicalize(node)
        if canon in self.hashcons:
            return self.find(self.hashcons[canon])
        eid = self._make_id()
        self.eclass[eid].add(canon)
        self.hashcons[canon] = eid
        return eid

    def add(self, expr: Expr) -> int:
        """Recursively insert an AST into the e-graph, return its eclass id."""
        if isinstance(expr, Const):
            return self._add_node(("Const", expr.value))
        if isinstance(expr, Var):
            return self._add_node(("Var", expr.name))
        if isinstance(expr, Add):
            return self._add_node(("Add", self.add(expr.left), self.add(expr.right)))
        if isinstance(expr, Sub):
            return self._add_node(("Sub", self.add(expr.left), self.add(expr.right)))
        if isinstance(expr, Mul):
            return self._add_node(("Mul", self.add(expr.left), self.add(expr.right)))
        raise ValueError(f"Unknown expression type: {type(expr)}")

    # ------ Pattern Matching & Rule Application ------
    def apply_rules(self, rules: List, max_iters: int = 10, node_limit: int = 5000):
        """Apply rewrite rules until saturation or max iterations.

        Each rule is a callable(egraph) that returns a list of (id_a, id_b)
        pairs to union.  Stops early if the e-graph exceeds *node_limit*
        e-nodes (prevents blow-up from commutativity / associativity).
        """
        for _ in range(max_iters):
            if len(self.hashcons) > node_limit:
                break
            matches: List[Tuple[int, int]] = []
            for rule in rules:
                matches.extend(rule(self))
                if len(self.hashcons) > node_limit:
                    break
            if not matches:
                break  # saturated
            for a, b in matches:
                self.union(a, b)
            self._rebuild()

    def all_enodes(self):
        """Yield (canonical_enode, canonical_eclass_id) for every live entry."""
        for node, eid in self.hashcons.items():
            yield self._canonicalize(node), self.find(eid)

    # ------ Debug helpers ------
    def num_eclasses(self) -> int:
        roots = {self.find(i) for i in self.parent}
        return len(roots)

    def dump(self):
        """Print all e-classes and their e-nodes."""
        classes: Dict[int, Set[ENode]] = {}
        for node, eid in self.hashcons.items():
            rid = self.find(eid)
            classes.setdefault(rid, set()).add(self._canonicalize(node))
        for rid, nodes in sorted(classes.items()):
            print(f"  e{rid}: {nodes}")
