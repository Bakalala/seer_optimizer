"""
cost_model.py — Hardware-inspired cost models for the SEER optimizer.

Each cost model maps an operator tag to a numeric cost.
A WeightedCost model combines multiple models with user-specified weights.
"""

from __future__ import annotations
from dataclasses import dataclass, field
from typing import Dict

# ---------------------------------------------------------------------------
# Cost model base
# ---------------------------------------------------------------------------

@dataclass
class CostModel:
    name: str
    costs: Dict[str, float]

    def node_cost(self, tag: str) -> float:
        return self.costs.get(tag, 0)


# ---------------------------------------------------------------------------
# Predefined cost models
# ---------------------------------------------------------------------------

AREA_COST = CostModel("area", {
    "Const": 1, "Var": 1, "Add": 2, "Sub": 2, "Mul": 4,
})

LATENCY_COST = CostModel("latency", {
    "Const": 0, "Var": 0, "Add": 1, "Sub": 1, "Mul": 3,
})

ENERGY_COST = CostModel("energy", {
    "Const": 1, "Var": 1, "Add": 3, "Sub": 3, "Mul": 5,
})


# ---------------------------------------------------------------------------
# Weighted combination
# ---------------------------------------------------------------------------

@dataclass
class WeightedCost:
    """cost = α·area + β·latency + γ·energy"""
    alpha: float = 1.0
    beta: float = 1.0
    gamma: float = 1.0
    name: str = field(init=False)

    def __post_init__(self):
        self.name = f"weighted(α={self.alpha},β={self.beta},γ={self.gamma})"

    def node_cost(self, tag: str) -> float:
        return (self.alpha  * AREA_COST.node_cost(tag)
              + self.beta   * LATENCY_COST.node_cost(tag)
              + self.gamma  * ENERGY_COST.node_cost(tag))


ALL_COST_MODELS = [
    AREA_COST,
    LATENCY_COST,
    ENERGY_COST,
    WeightedCost(alpha=10, beta=1,  gamma=1),   # area-constrained
    WeightedCost(alpha=1,  beta=1,  gamma=10),   # energy-constrained
    WeightedCost(alpha=1,  beta=10, gamma=1),    # latency-constrained
]
