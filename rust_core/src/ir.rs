use anyhow::{Context, Result, bail};
use serde::{Deserialize, Serialize};
use std::collections::{HashMap, HashSet};
use std::fmt;

fn default_weight() -> f64 {
    1.0
}

fn default_iter_limit() -> usize {
    30
}

fn default_node_limit() -> usize {
    50_000
}

fn default_time_limit_ms() -> u64 {
    2_000
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
#[serde(rename_all = "snake_case")]
pub enum Mode {
    Weighted,
    Constrained,
    #[serde(rename = "pareto_2d")]
    Pareto2d,
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
#[serde(rename_all = "snake_case")]
pub enum Objective {
    Area,
    Latency,
    Weighted,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Weights {
    #[serde(default = "default_weight")]
    pub w_area: f64,
    #[serde(default = "default_weight")]
    pub w_latency: f64,
}

impl Default for Weights {
    fn default() -> Self {
        Self {
            w_area: default_weight(),
            w_latency: default_weight(),
        }
    }
}

#[derive(Clone, Debug, Default, Serialize, Deserialize)]
pub struct Budgets {
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub area_max: Option<u32>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub latency_max: Option<u32>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub dsp_max: Option<u32>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub lut_max: Option<u32>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct SaturationLimits {
    #[serde(default = "default_iter_limit")]
    pub iter_limit: usize,
    #[serde(default = "default_node_limit")]
    pub node_limit: usize,
    #[serde(default = "default_time_limit_ms")]
    pub time_limit_ms: u64,
}

impl Default for SaturationLimits {
    fn default() -> Self {
        Self {
            iter_limit: default_iter_limit(),
            node_limit: default_node_limit(),
            time_limit_ms: default_time_limit_ms(),
        }
    }
}

#[derive(Clone, Debug, Serialize, Deserialize, PartialEq, Eq, Hash)]
#[serde(rename_all = "snake_case")]
pub enum IrOp {
    Input,
    Const,
    Add,
    Sub,
    Mul,
    MulDsp,
    MulLut,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct IrNode {
    pub id: String,
    pub op: IrOp,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub value: Option<i64>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub inputs: Vec<String>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct IrGraph {
    pub ir_nodes: Vec<IrNode>,
    pub root: String,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct OptimizeRequest {
    pub benchmark_name: String,
    pub ir_nodes: Vec<IrNode>,
    pub root: String,
    pub mode: Mode,
    pub objective: Objective,
    #[serde(default)]
    pub weights: Weights,
    #[serde(default)]
    pub budgets: Budgets,
    #[serde(default)]
    pub saturation_limits: SaturationLimits,
}

impl OptimizeRequest {
    pub fn graph(&self) -> IrGraph {
        IrGraph {
            ir_nodes: self.ir_nodes.clone(),
            root: self.root.clone(),
        }
    }
}

#[derive(Clone, Debug, Default, Serialize, Deserialize, PartialEq, Eq, Hash)]
pub struct Metrics {
    pub area: u32,
    pub latency: u32,
    pub dsp_count: u32,
    pub lut_count: u32,
}

impl Metrics {
    pub fn weighted_score(&self, weights: &Weights) -> f64 {
        (self.area as f64 * weights.w_area) + (self.latency as f64 * weights.w_latency)
    }

    pub fn satisfies(&self, budgets: &Budgets) -> bool {
        budgets.area_max.is_none_or(|max| self.area <= max)
            && budgets.latency_max.is_none_or(|max| self.latency <= max)
            && budgets.dsp_max.is_none_or(|max| self.dsp_count <= max)
            && budgets.lut_max.is_none_or(|max| self.lut_count <= max)
    }

    pub fn dominates(&self, other: &Self) -> bool {
        let no_worse = self.area <= other.area
            && self.latency <= other.latency
            && self.dsp_count <= other.dsp_count
            && self.lut_count <= other.lut_count;
        let strictly_better = self.area < other.area
            || self.latency < other.latency
            || self.dsp_count < other.dsp_count
            || self.lut_count < other.lut_count;
        no_worse && strictly_better
    }
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct FrontierPoint {
    pub optimized_ir: IrGraph,
    pub metrics: Metrics,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub score: Option<f64>,
}

#[derive(Clone, Debug, Default, Serialize, Deserialize)]
pub struct RunStats {
    pub iterations: usize,
    pub eclasses: usize,
    pub enodes: usize,
    pub runtime_ms: u64,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct OptimizeResponse {
    pub feasible: bool,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub optimized_ir: Option<IrGraph>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub metrics: Option<Metrics>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub score: Option<f64>,
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub frontier: Vec<FrontierPoint>,
    pub stats: RunStats,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub message: Option<String>,
}

impl OptimizeResponse {
    pub fn error(message: impl Into<String>) -> Self {
        Self {
            feasible: false,
            optimized_ir: None,
            metrics: None,
            score: None,
            frontier: Vec::new(),
            stats: RunStats::default(),
            message: Some(message.into()),
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq, Hash)]
pub enum Expr {
    Input(String),
    Const(i64),
    Add(Box<Expr>, Box<Expr>),
    Sub(Box<Expr>, Box<Expr>),
    Mul(Box<Expr>, Box<Expr>),
    MulDsp(Box<Expr>, Box<Expr>),
    MulLut(Box<Expr>, Box<Expr>),
}

impl Expr {
    pub fn metrics(&self) -> Metrics {
        match self {
            Expr::Input(_) | Expr::Const(_) => Metrics::default(),
            Expr::Add(left, right) | Expr::Sub(left, right) => {
                let left_metrics = left.metrics();
                let right_metrics = right.metrics();
                Metrics {
                    area: left_metrics.area + right_metrics.area + 1,
                    latency: left_metrics.latency.max(right_metrics.latency) + 1,
                    dsp_count: left_metrics.dsp_count + right_metrics.dsp_count,
                    lut_count: left_metrics.lut_count + right_metrics.lut_count + 1,
                }
            }
            Expr::Mul(left, right) | Expr::MulDsp(left, right) => {
                let left_metrics = left.metrics();
                let right_metrics = right.metrics();
                Metrics {
                    area: left_metrics.area + right_metrics.area + 6,
                    latency: left_metrics.latency.max(right_metrics.latency) + 3,
                    dsp_count: left_metrics.dsp_count + right_metrics.dsp_count + 1,
                    lut_count: left_metrics.lut_count + right_metrics.lut_count,
                }
            }
            Expr::MulLut(left, right) => {
                let left_metrics = left.metrics();
                let right_metrics = right.metrics();
                Metrics {
                    area: left_metrics.area + right_metrics.area + 4,
                    latency: left_metrics.latency.max(right_metrics.latency) + 6,
                    dsp_count: left_metrics.dsp_count + right_metrics.dsp_count,
                    lut_count: left_metrics.lut_count + right_metrics.lut_count + 8,
                }
            }
        }
    }

    pub fn size(&self) -> usize {
        match self {
            Expr::Input(_) | Expr::Const(_) => 1,
            Expr::Add(left, right)
            | Expr::Sub(left, right)
            | Expr::Mul(left, right)
            | Expr::MulDsp(left, right)
            | Expr::MulLut(left, right) => 1 + left.size() + right.size(),
        }
    }

    pub fn to_ir_graph(&self) -> IrGraph {
        fn push_expr(expr: &Expr, nodes: &mut Vec<IrNode>, next_id: &mut usize) -> String {
            match expr {
                Expr::Input(name) => {
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::Input,
                        name: Some(name.clone()),
                        value: None,
                        inputs: Vec::new(),
                    });
                    id
                }
                Expr::Const(value) => {
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::Const,
                        name: None,
                        value: Some(*value),
                        inputs: Vec::new(),
                    });
                    id
                }
                Expr::Add(left, right) => {
                    let left_id = push_expr(left, nodes, next_id);
                    let right_id = push_expr(right, nodes, next_id);
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::Add,
                        name: None,
                        value: None,
                        inputs: vec![left_id, right_id],
                    });
                    id
                }
                Expr::Sub(left, right) => {
                    let left_id = push_expr(left, nodes, next_id);
                    let right_id = push_expr(right, nodes, next_id);
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::Sub,
                        name: None,
                        value: None,
                        inputs: vec![left_id, right_id],
                    });
                    id
                }
                Expr::Mul(left, right) => {
                    let left_id = push_expr(left, nodes, next_id);
                    let right_id = push_expr(right, nodes, next_id);
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::Mul,
                        name: None,
                        value: None,
                        inputs: vec![left_id, right_id],
                    });
                    id
                }
                Expr::MulDsp(left, right) => {
                    let left_id = push_expr(left, nodes, next_id);
                    let right_id = push_expr(right, nodes, next_id);
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::MulDsp,
                        name: None,
                        value: None,
                        inputs: vec![left_id, right_id],
                    });
                    id
                }
                Expr::MulLut(left, right) => {
                    let left_id = push_expr(left, nodes, next_id);
                    let right_id = push_expr(right, nodes, next_id);
                    let id = format!("n{next_id}");
                    *next_id += 1;
                    nodes.push(IrNode {
                        id: id.clone(),
                        op: IrOp::MulLut,
                        name: None,
                        value: None,
                        inputs: vec![left_id, right_id],
                    });
                    id
                }
            }
        }

        let mut nodes = Vec::new();
        let mut next_id = 0;
        let root = push_expr(self, &mut nodes, &mut next_id);
        IrGraph {
            ir_nodes: nodes,
            root,
        }
    }
}

impl fmt::Display for Expr {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Expr::Input(name) => write!(f, "{name}"),
            Expr::Const(value) => write!(f, "{value}"),
            Expr::Add(left, right) => write!(f, "(+ {left} {right})"),
            Expr::Sub(left, right) => write!(f, "(- {left} {right})"),
            Expr::Mul(left, right) => write!(f, "(* {left} {right})"),
            Expr::MulDsp(left, right) => write!(f, "(*dsp {left} {right})"),
            Expr::MulLut(left, right) => write!(f, "(*lut {left} {right})"),
        }
    }
}

pub fn graph_to_expr(graph: &IrGraph) -> Result<Expr> {
    let mut nodes_by_id = HashMap::new();
    for node in &graph.ir_nodes {
        let previous = nodes_by_id.insert(node.id.clone(), node.clone());
        if previous.is_some() {
            bail!("duplicate node id {}", node.id);
        }
    }

    let mut cache = HashMap::new();
    let mut visiting = HashSet::new();
    build_expr(&graph.root, &nodes_by_id, &mut cache, &mut visiting)
}

fn build_expr(
    node_id: &str,
    nodes_by_id: &HashMap<String, IrNode>,
    cache: &mut HashMap<String, Expr>,
    visiting: &mut HashSet<String>,
) -> Result<Expr> {
    if let Some(expr) = cache.get(node_id) {
        return Ok(expr.clone());
    }

    if !visiting.insert(node_id.to_string()) {
        bail!("cycle detected while visiting node {node_id}");
    }

    let node = nodes_by_id
        .get(node_id)
        .with_context(|| format!("missing node {node_id}"))?;
    let expr = match node.op {
        IrOp::Input => {
            if !node.inputs.is_empty() {
                bail!("input node {} cannot have inputs", node.id);
            }
            let name = node
                .name
                .clone()
                .with_context(|| format!("input node {} is missing name", node.id))?;
            Expr::Input(name)
        }
        IrOp::Const => {
            if !node.inputs.is_empty() {
                bail!("const node {} cannot have inputs", node.id);
            }
            let value = node
                .value
                .with_context(|| format!("const node {} is missing value", node.id))?;
            Expr::Const(value)
        }
        IrOp::Add => binary_expr(node, nodes_by_id, cache, visiting, Expr::Add)?,
        IrOp::Sub => binary_expr(node, nodes_by_id, cache, visiting, Expr::Sub)?,
        IrOp::Mul => binary_expr(node, nodes_by_id, cache, visiting, Expr::Mul)?,
        IrOp::MulDsp => binary_expr(node, nodes_by_id, cache, visiting, Expr::MulDsp)?,
        IrOp::MulLut => binary_expr(node, nodes_by_id, cache, visiting, Expr::MulLut)?,
    };

    visiting.remove(node_id);
    cache.insert(node_id.to_string(), expr.clone());
    Ok(expr)
}

fn binary_expr(
    node: &IrNode,
    nodes_by_id: &HashMap<String, IrNode>,
    cache: &mut HashMap<String, Expr>,
    visiting: &mut HashSet<String>,
    constructor: fn(Box<Expr>, Box<Expr>) -> Expr,
) -> Result<Expr> {
    if node.inputs.len() != 2 {
        bail!(
            "binary node {} must have exactly two inputs, got {}",
            node.id,
            node.inputs.len()
        );
    }
    let left = build_expr(&node.inputs[0], nodes_by_id, cache, visiting)?;
    let right = build_expr(&node.inputs[1], nodes_by_id, cache, visiting)?;
    Ok(constructor(Box::new(left), Box::new(right)))
}
