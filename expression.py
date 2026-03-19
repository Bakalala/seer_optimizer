"""
expression.py — AST nodes for the SEER optimizer DSL.

Supports: Const, Var, Add, Sub, Mul.
Each node is a plain tuple-like object that is hashable and pretty-printable.
"""

from __future__ import annotations
from dataclasses import dataclass
from typing import Union

# ---------------------------------------------------------------------------
# AST node types
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class Const:
    value: int
    def __repr__(self) -> str:
        return f"Const({self.value})"

@dataclass(frozen=True)
class Var:
    name: str
    def __repr__(self) -> str:
        return f'Var("{self.name}")'

@dataclass(frozen=True)
class Add:
    left: "Expr"
    right: "Expr"
    def __repr__(self) -> str:
        return f"Add({self.left}, {self.right})"

@dataclass(frozen=True)
class Sub:
    left: "Expr"
    right: "Expr"
    def __repr__(self) -> str:
        return f"Sub({self.left}, {self.right})"

@dataclass(frozen=True)
class Mul:
    left: "Expr"
    right: "Expr"
    def __repr__(self) -> str:
        return f"Mul({self.left}, {self.right})"

# Union type for any expression node
Expr = Union[Const, Var, Add, Sub, Mul]
