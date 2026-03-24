use crate::ir::{
    BatchOptimizeRequest, BatchOptimizeResponse, BatchQuery, BatchQueryResponse, Budgets, Expr,
    FrontierPoint, Metrics, Mode, Objective, OptimizeRequest, OptimizeResponse, RunStats,
    SaturationLimits, Weights, graph_to_expr,
};
use crate::language::{Math, MathAnalysis};
use crate::rewrites::datapath_rewrites;
use anyhow::Result;
use egg::{EGraph, Id, RecExpr, Runner, Symbol};
use std::cmp::Ordering;
use std::collections::HashMap;
use std::time::{Duration, Instant};

const MAX_FRONTIER_PER_ECLASS: usize = 128;
const MAX_FRONTIER_PASSES: usize = 16;

#[derive(Clone, Debug, PartialEq, Eq)]
struct Candidate {
    expr: Expr,
    metrics: Metrics,
}

#[derive(Clone, Debug)]
struct PreparedBenchmark {
    root_frontier: Option<Vec<Candidate>>,
    stats: RunStats,
}

impl Candidate {
    fn from_expr(expr: Expr) -> Self {
        let metrics = expr.metrics();
        Self { expr, metrics }
    }

    fn weighted_score(&self, weights: &Weights) -> f64 {
        self.metrics.weighted_score(weights)
    }
}

pub fn optimize_request(request: &OptimizeRequest) -> Result<OptimizeResponse> {
    let prepared = prepare_benchmark(&request.graph(), &request.saturation_limits)?;
    Ok(evaluate_prepared(
        &prepared,
        &request.mode,
        &request.objective,
        &request.weights,
        &request.budgets,
    ))
}

pub fn optimize_batch_request(request: &BatchOptimizeRequest) -> Result<BatchOptimizeResponse> {
    let prepared = prepare_benchmark(&request.graph(), &request.saturation_limits)?;
    let results = request
        .queries
        .iter()
        .map(|query| evaluate_batch_query(&prepared, query))
        .collect();

    Ok(BatchOptimizeResponse {
        benchmark_name: request.benchmark_name.clone(),
        shared_stats: prepared.stats.clone(),
        results,
        message: None,
    })
}

fn prepare_benchmark(
    graph: &crate::ir::IrGraph,
    limits: &SaturationLimits,
) -> Result<PreparedBenchmark> {
    let root_expr = graph_to_expr(graph)?;
    let expr = expr_to_recexpr(&root_expr);

    let started = Instant::now();
    let runner = Runner::<Math, MathAnalysis, ()>::default()
        .with_expr(&expr)
        .with_iter_limit(limits.iter_limit)
        .with_node_limit(limits.node_limit)
        .with_time_limit(Duration::from_millis(limits.time_limit_ms))
        .run(&datapath_rewrites());

    let eclasses = runner.egraph.classes().count();
    let enodes = runner
        .egraph
        .classes()
        .map(|class| class.nodes.len())
        .sum::<usize>();
    let stats = RunStats {
        iterations: runner.iterations.len(),
        eclasses,
        enodes,
        runtime_ms: started.elapsed().as_millis() as u64,
    };

    let root_id = runner.egraph.find(runner.roots[0]);
    let frontiers = extract_frontiers(&runner.egraph);
    let root_frontier = frontiers.get(&root_id).cloned();

    Ok(PreparedBenchmark {
        root_frontier,
        stats,
    })
}

fn evaluate_prepared(
    prepared: &PreparedBenchmark,
    mode: &Mode,
    objective: &Objective,
    weights: &Weights,
    budgets: &Budgets,
) -> OptimizeResponse {
    let stats = prepared.stats.clone();
    let Some(root_frontier) = prepared.root_frontier.as_deref() else {
        return missing_frontier_response(stats);
    };

    match mode {
        Mode::Weighted => weighted_response(root_frontier, weights, stats),
        Mode::Constrained => {
            constrained_response(root_frontier, objective, weights, budgets, stats)
        }
        Mode::Pareto2d => pareto_response(root_frontier, stats),
    }
}

fn evaluate_batch_query(prepared: &PreparedBenchmark, query: &BatchQuery) -> BatchQueryResponse {
    BatchQueryResponse::from_optimize_response(
        query.name.clone(),
        query.label.clone(),
        evaluate_prepared(
            prepared,
            &query.mode,
            &query.objective,
            &query.weights,
            &query.budgets,
        ),
    )
}

fn missing_frontier_response(stats: RunStats) -> OptimizeResponse {
    OptimizeResponse {
        feasible: false,
        optimized_ir: None,
        metrics: None,
        score: None,
        frontier: Vec::new(),
        stats,
        message: Some("no extraction candidates were produced".to_string()),
    }
}

fn weighted_response(
    candidates: &[Candidate],
    weights: &Weights,
    stats: RunStats,
) -> OptimizeResponse {
    if let Some(best) = select_best_weighted(candidates, weights) {
        OptimizeResponse {
            feasible: true,
            optimized_ir: Some(best.expr.to_ir_graph()),
            metrics: Some(best.metrics.clone()),
            score: Some(best.weighted_score(weights)),
            frontier: Vec::new(),
            stats,
            message: None,
        }
    } else {
        OptimizeResponse {
            feasible: false,
            optimized_ir: None,
            metrics: None,
            score: None,
            frontier: Vec::new(),
            stats,
            message: Some("no weighted solution found".to_string()),
        }
    }
}

fn constrained_response(
    candidates: &[Candidate],
    objective: &Objective,
    weights: &Weights,
    budgets: &Budgets,
    stats: RunStats,
) -> OptimizeResponse {
    let feasible: Vec<&Candidate> = candidates
        .iter()
        .filter(|candidate| candidate.metrics.satisfies(budgets))
        .collect();

    let Some(best) = select_best_constrained(&feasible, objective, weights) else {
        return OptimizeResponse {
            feasible: false,
            optimized_ir: None,
            metrics: None,
            score: None,
            frontier: Vec::new(),
            stats,
            message: Some("no feasible solution satisfies the provided budgets".to_string()),
        };
    };

    let score = match objective {
        Objective::Weighted => Some(best.weighted_score(weights)),
        Objective::Area => Some(best.metrics.area as f64),
        Objective::Latency => Some(best.metrics.latency as f64),
    };

    OptimizeResponse {
        feasible: true,
        optimized_ir: Some(best.expr.to_ir_graph()),
        metrics: Some(best.metrics.clone()),
        score,
        frontier: Vec::new(),
        stats,
        message: None,
    }
}

fn pareto_response(candidates: &[Candidate], stats: RunStats) -> OptimizeResponse {
    let frontier_candidates = pareto_project_area_latency(candidates);
    let frontier = frontier_candidates
        .into_iter()
        .map(|candidate| FrontierPoint {
            optimized_ir: candidate.expr.to_ir_graph(),
            metrics: candidate.metrics,
            score: None,
        })
        .collect::<Vec<_>>();

    OptimizeResponse {
        feasible: !frontier.is_empty(),
        optimized_ir: None,
        metrics: None,
        score: None,
        frontier,
        stats,
        message: None,
    }
}

fn expr_to_recexpr(expr: &Expr) -> RecExpr<Math> {
    fn push(expr: &Expr, recexpr: &mut RecExpr<Math>) -> Id {
        match expr {
            Expr::Input(name) => recexpr.add(Math::Symbol(Symbol::from(name.as_str()))),
            Expr::Const(value) => recexpr.add(Math::Num(*value)),
            Expr::Add(left, right) | Expr::AddDsp(left, right) | Expr::AddLut(left, right) => {
                let left_id = push(left, recexpr);
                let right_id = push(right, recexpr);
                recexpr.add(Math::Add([left_id, right_id]))
            }
            Expr::Sub(left, right) | Expr::SubDsp(left, right) | Expr::SubLut(left, right) => {
                let left_id = push(left, recexpr);
                let right_id = push(right, recexpr);
                recexpr.add(Math::Sub([left_id, right_id]))
            }
            Expr::Mul(left, right) => {
                let left_id = push(left, recexpr);
                let right_id = push(right, recexpr);
                recexpr.add(Math::Mul([left_id, right_id]))
            }
            Expr::MulDsp(left, right) | Expr::MulLut(left, right) => {
                let left_id = push(left, recexpr);
                let right_id = push(right, recexpr);
                recexpr.add(Math::Mul([left_id, right_id]))
            }
            Expr::MacDsp(acc, left, right) => {
                let acc_id = push(acc, recexpr);
                let left_id = push(left, recexpr);
                let right_id = push(right, recexpr);
                let mul_id = recexpr.add(Math::Mul([left_id, right_id]));
                recexpr.add(Math::Add([acc_id, mul_id]))
            }
        }
    }

    let mut recexpr = RecExpr::default();
    let _ = push(expr, &mut recexpr);
    recexpr
}

fn extract_frontiers(egraph: &EGraph<Math, MathAnalysis>) -> HashMap<Id, Vec<Candidate>> {
    let mut frontiers: HashMap<Id, Vec<Candidate>> = HashMap::new();

    for _ in 0..MAX_FRONTIER_PASSES {
        let mut changed = false;
        for class in egraph.classes() {
            let mut candidates = frontiers.get(&class.id).cloned().unwrap_or_default();
            for node in &class.nodes {
                candidates.extend(candidates_for_node(node, &frontiers));
            }
            let pruned = prune_candidates(candidates);
            let needs_update = frontiers.get(&class.id) != Some(&pruned);
            if needs_update {
                frontiers.insert(class.id, pruned);
                changed = true;
            }
        }
        if !changed {
            break;
        }
    }

    frontiers
}

fn candidates_for_node(node: &Math, frontiers: &HashMap<Id, Vec<Candidate>>) -> Vec<Candidate> {
    match node {
        Math::Num(value) => vec![Candidate::from_expr(Expr::Const(*value))],
        Math::Symbol(symbol) => vec![Candidate::from_expr(Expr::Input(symbol.to_string()))],
        Math::Add([left, right]) => combine_add(*left, *right, frontiers),
        Math::Sub([left, right]) => combine_sub(*left, *right, frontiers),
        Math::Mul([left, right]) => combine_mul(*left, *right, frontiers),
    }
}

fn combine_binary_variants(
    left_id: Id,
    right_id: Id,
    frontiers: &HashMap<Id, Vec<Candidate>>,
    constructors: &[fn(Expr, Expr) -> Expr],
) -> Vec<Candidate> {
    let Some(left_candidates) = frontiers.get(&left_id) else {
        return Vec::new();
    };
    let Some(right_candidates) = frontiers.get(&right_id) else {
        return Vec::new();
    };

    let mut combined =
        Vec::with_capacity(left_candidates.len() * right_candidates.len() * constructors.len());
    for left in left_candidates {
        for right in right_candidates {
            for constructor in constructors {
                combined.push(Candidate::from_expr(constructor(
                    left.expr.clone(),
                    right.expr.clone(),
                )));
            }
        }
    }
    combined
}

fn combine_add(
    left_id: Id,
    right_id: Id,
    frontiers: &HashMap<Id, Vec<Candidate>>,
) -> Vec<Candidate> {
    let mut combined =
        combine_binary_variants(left_id, right_id, frontiers, &[make_add_lut, make_add_dsp]);
    combined.extend(combine_mac_candidates(left_id, right_id, frontiers));
    combined
}

fn combine_sub(
    left_id: Id,
    right_id: Id,
    frontiers: &HashMap<Id, Vec<Candidate>>,
) -> Vec<Candidate> {
    combine_binary_variants(left_id, right_id, frontiers, &[make_sub_lut, make_sub_dsp])
}

fn combine_mul(
    left_id: Id,
    right_id: Id,
    frontiers: &HashMap<Id, Vec<Candidate>>,
) -> Vec<Candidate> {
    let Some(left_candidates) = frontiers.get(&left_id) else {
        return Vec::new();
    };
    let Some(right_candidates) = frontiers.get(&right_id) else {
        return Vec::new();
    };

    let mut combined = Vec::with_capacity(left_candidates.len() * right_candidates.len() * 2);
    for left in left_candidates {
        for right in right_candidates {
            combined.push(Candidate::from_expr(Expr::MulDsp(
                Box::new(left.expr.clone()),
                Box::new(right.expr.clone()),
            )));
            combined.push(Candidate::from_expr(Expr::MulLut(
                Box::new(left.expr.clone()),
                Box::new(right.expr.clone()),
            )));
        }
    }
    combined
}

fn combine_mac_candidates(
    left_id: Id,
    right_id: Id,
    frontiers: &HashMap<Id, Vec<Candidate>>,
) -> Vec<Candidate> {
    let Some(left_candidates) = frontiers.get(&left_id) else {
        return Vec::new();
    };
    let Some(right_candidates) = frontiers.get(&right_id) else {
        return Vec::new();
    };

    let mut combined = Vec::new();
    for left in left_candidates {
        for right in right_candidates {
            if let Some((mul_left, mul_right)) = multiply_operands(&left.expr) {
                combined.push(Candidate::from_expr(Expr::MacDsp(
                    Box::new(right.expr.clone()),
                    Box::new(mul_left),
                    Box::new(mul_right),
                )));
            }
            if let Some((mul_left, mul_right)) = multiply_operands(&right.expr) {
                combined.push(Candidate::from_expr(Expr::MacDsp(
                    Box::new(left.expr.clone()),
                    Box::new(mul_left),
                    Box::new(mul_right),
                )));
            }
        }
    }
    combined
}

fn multiply_operands(expr: &Expr) -> Option<(Expr, Expr)> {
    match expr {
        Expr::Mul(left, right) | Expr::MulDsp(left, right) | Expr::MulLut(left, right) => {
            Some((*left.clone(), *right.clone()))
        }
        _ => None,
    }
}

fn make_add_lut(left: Expr, right: Expr) -> Expr {
    Expr::AddLut(Box::new(left), Box::new(right))
}

fn make_add_dsp(left: Expr, right: Expr) -> Expr {
    Expr::AddDsp(Box::new(left), Box::new(right))
}

fn make_sub_lut(left: Expr, right: Expr) -> Expr {
    Expr::SubLut(Box::new(left), Box::new(right))
}

fn make_sub_dsp(left: Expr, right: Expr) -> Expr {
    Expr::SubDsp(Box::new(left), Box::new(right))
}

fn prune_candidates(candidates: Vec<Candidate>) -> Vec<Candidate> {
    let mut deduped = HashMap::<Metrics, Candidate>::new();
    for candidate in candidates {
        deduped
            .entry(candidate.metrics.clone())
            .and_modify(|existing| {
                if candidate_cmp(&candidate, existing) == Ordering::Less {
                    *existing = candidate.clone();
                }
            })
            .or_insert(candidate);
    }

    let mut ordered = deduped.into_values().collect::<Vec<_>>();
    ordered.sort_by(candidate_cmp);

    let mut nondominated: Vec<Candidate> = Vec::new();
    'outer: for candidate in ordered {
        for existing in &nondominated {
            if existing.metrics.dominates(&candidate.metrics) {
                continue 'outer;
            }
        }
        nondominated.retain(|existing| !candidate.metrics.dominates(&existing.metrics));
        nondominated.push(candidate);
    }

    nondominated.sort_by(candidate_cmp);
    if nondominated.len() > MAX_FRONTIER_PER_ECLASS {
        nondominated.truncate(MAX_FRONTIER_PER_ECLASS);
    }
    nondominated
}

fn select_best_weighted<'a>(
    candidates: &'a [Candidate],
    weights: &Weights,
) -> Option<&'a Candidate> {
    candidates.iter().min_by(|left, right| {
        left.weighted_score(weights)
            .partial_cmp(&right.weighted_score(weights))
            .unwrap_or(Ordering::Equal)
            .then_with(|| candidate_cmp(left, right))
    })
}

fn select_best_constrained<'a>(
    candidates: &'a [&Candidate],
    objective: &Objective,
    weights: &Weights,
) -> Option<&'a Candidate> {
    candidates
        .iter()
        .copied()
        .min_by(|left, right| match objective {
            Objective::Area => left
                .metrics
                .area
                .cmp(&right.metrics.area)
                .then_with(|| candidate_cmp(left, right)),
            Objective::Latency => left
                .metrics
                .latency
                .cmp(&right.metrics.latency)
                .then_with(|| candidate_cmp(left, right)),
            Objective::Weighted => left
                .weighted_score(weights)
                .partial_cmp(&right.weighted_score(weights))
                .unwrap_or(Ordering::Equal)
                .then_with(|| candidate_cmp(left, right)),
        })
}

fn pareto_project_area_latency(candidates: &[Candidate]) -> Vec<Candidate> {
    let mut best_for_pair = HashMap::<(u32, u32), Candidate>::new();
    for candidate in candidates {
        let key = (candidate.metrics.area, candidate.metrics.latency);
        best_for_pair
            .entry(key)
            .and_modify(|existing| {
                if candidate_cmp(candidate, existing) == Ordering::Less {
                    *existing = candidate.clone();
                }
            })
            .or_insert_with(|| candidate.clone());
    }

    let mut ordered = best_for_pair.into_values().collect::<Vec<_>>();
    ordered.sort_by(candidate_cmp);

    let mut frontier = Vec::new();
    let mut best_latency = u32::MAX;
    for candidate in ordered {
        if candidate.metrics.latency < best_latency {
            best_latency = candidate.metrics.latency;
            frontier.push(candidate);
        }
    }
    frontier
}

fn candidate_cmp(left: &Candidate, right: &Candidate) -> Ordering {
    left.metrics
        .area
        .cmp(&right.metrics.area)
        .then(left.metrics.latency.cmp(&right.metrics.latency))
        .then(left.metrics.dsp_count.cmp(&right.metrics.dsp_count))
        .then(left.metrics.lut_count.cmp(&right.metrics.lut_count))
        .then(left.expr.size().cmp(&right.expr.size()))
        .then(left.expr.to_string().cmp(&right.expr.to_string()))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ir::{
        BatchOptimizeRequest, BatchQuery, IrGraph, IrNode, IrOp, OptimizeRequest, SaturationLimits,
        graph_to_expr,
    };

    struct TestIrBuilder {
        nodes: Vec<IrNode>,
        next_id: usize,
    }

    impl TestIrBuilder {
        fn new() -> Self {
            Self {
                nodes: Vec::new(),
                next_id: 0,
            }
        }

        fn input(&mut self, name: &str) -> String {
            self.push(IrOp::Input, Some(name.to_string()), None, Vec::new())
        }

        fn constant(&mut self, value: i64) -> String {
            self.push(IrOp::Const, None, Some(value), Vec::new())
        }

        fn add(&mut self, left: String, right: String) -> String {
            self.push(IrOp::Add, None, None, vec![left, right])
        }

        fn mul(&mut self, left: String, right: String) -> String {
            self.push(IrOp::Mul, None, None, vec![left, right])
        }

        fn finish(self, root: String) -> (Vec<IrNode>, String) {
            (self.nodes, root)
        }

        fn push(
            &mut self,
            op: IrOp,
            name: Option<String>,
            value: Option<i64>,
            inputs: Vec<String>,
        ) -> String {
            let id = format!("n{}", self.next_id);
            self.next_id += 1;
            self.nodes.push(IrNode {
                id: id.clone(),
                op,
                name,
                value,
                inputs,
            });
            id
        }
    }

    fn test_limits() -> SaturationLimits {
        SaturationLimits {
            iter_limit: 12,
            node_limit: 12_000,
            time_limit_ms: 800,
        }
    }

    fn build_fir8_nodes() -> (Vec<IrNode>, String) {
        let mut builder = TestIrBuilder::new();
        let coeffs = [1, 2, 3, 4, 4, 3, 2, 1];
        let mut terms = Vec::new();
        for (idx, coeff) in coeffs.into_iter().enumerate() {
            let sample = builder.input(&format!("x{idx}"));
            let weight = builder.constant(coeff);
            terms.push(builder.mul(weight, sample));
        }

        let mut acc = terms[0].clone();
        for term in terms.iter().skip(1) {
            acc = builder.add(acc, term.clone());
        }
        builder.finish(acc)
    }

    fn request_from_nodes(
        benchmark_name: &str,
        nodes: Vec<IrNode>,
        root: &str,
        mode: Mode,
        objective: Objective,
        budgets: Budgets,
    ) -> OptimizeRequest {
        OptimizeRequest {
            benchmark_name: benchmark_name.to_string(),
            ir_nodes: nodes,
            root: root.to_string(),
            mode,
            objective,
            weights: Weights::default(),
            budgets,
            saturation_limits: test_limits(),
        }
    }

    fn batch_request_from_nodes(
        benchmark_name: &str,
        nodes: Vec<IrNode>,
        root: &str,
        queries: Vec<BatchQuery>,
    ) -> BatchOptimizeRequest {
        BatchOptimizeRequest {
            benchmark_name: benchmark_name.to_string(),
            ir_nodes: nodes,
            root: root.to_string(),
            saturation_limits: test_limits(),
            queries,
        }
    }

    #[test]
    fn weighted_simplifies_identity_chain() {
        let request = request_from_nodes(
            "identity",
            vec![
                IrNode {
                    id: "x".into(),
                    op: IrOp::Input,
                    name: Some("x".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "zero".into(),
                    op: IrOp::Const,
                    name: None,
                    value: Some(0),
                    inputs: vec![],
                },
                IrNode {
                    id: "one".into(),
                    op: IrOp::Const,
                    name: None,
                    value: Some(1),
                    inputs: vec![],
                },
                IrNode {
                    id: "sum".into(),
                    op: IrOp::Add,
                    name: None,
                    value: None,
                    inputs: vec!["x".into(), "zero".into()],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Mul,
                    name: None,
                    value: None,
                    inputs: vec!["sum".into(), "one".into()],
                },
            ],
            "root",
            Mode::Weighted,
            Objective::Weighted,
            Budgets::default(),
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        assert!(response.feasible);
        assert_eq!(response.metrics.expect("metrics").area, 0);
    }

    #[test]
    fn constrained_respects_area_budget() {
        let request = request_from_nodes(
            "mul_two",
            vec![
                IrNode {
                    id: "x".into(),
                    op: IrOp::Input,
                    name: Some("x".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "two".into(),
                    op: IrOp::Const,
                    name: None,
                    value: Some(2),
                    inputs: vec![],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Mul,
                    name: None,
                    value: None,
                    inputs: vec!["x".into(), "two".into()],
                },
            ],
            "root",
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                area_max: Some(1),
                ..Budgets::default()
            },
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        assert!(response.feasible);
        let metrics = response.metrics.expect("metrics");
        assert!(metrics.area <= 1);
        assert_eq!(metrics.latency, 2);
    }

    #[test]
    fn pareto_frontier_is_nondominated() {
        let request = request_from_nodes(
            "generic_mul",
            vec![
                IrNode {
                    id: "x".into(),
                    op: IrOp::Input,
                    name: Some("x".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "y".into(),
                    op: IrOp::Input,
                    name: Some("y".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Mul,
                    name: None,
                    value: None,
                    inputs: vec!["x".into(), "y".into()],
                },
            ],
            "root",
            Mode::Pareto2d,
            Objective::Latency,
            Budgets::default(),
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        assert!(response.frontier.len() >= 2);
        for (i, point) in response.frontier.iter().enumerate() {
            for (j, other) in response.frontier.iter().enumerate() {
                if i == j {
                    continue;
                }
                let dominates = other.metrics.area <= point.metrics.area
                    && other.metrics.latency <= point.metrics.latency
                    && (other.metrics.area < point.metrics.area
                        || other.metrics.latency < point.metrics.latency);
                assert!(!dominates);
            }
        }
    }

    #[test]
    fn constrained_respects_zero_dsp_budget() {
        let request = request_from_nodes(
            "generic_mul_zero_dsp",
            vec![
                IrNode {
                    id: "x".into(),
                    op: IrOp::Input,
                    name: Some("x".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "y".into(),
                    op: IrOp::Input,
                    name: Some("y".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Mul,
                    name: None,
                    value: None,
                    inputs: vec!["x".into(), "y".into()],
                },
            ],
            "root",
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                dsp_max: Some(0),
                ..Budgets::default()
            },
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        assert!(response.feasible);
        let metrics = response.metrics.expect("metrics");
        assert_eq!(metrics.dsp_count, 0);
        assert_eq!(metrics.area, 4);
        assert_eq!(metrics.latency, 6);
        assert_eq!(metrics.lut_count, 8);
    }

    #[test]
    fn fir8_area_budget_forces_less_aggressive_simplification() {
        let (nodes, root) = build_fir8_nodes();
        let original_metrics = graph_to_expr(&IrGraph {
            ir_nodes: nodes.clone(),
            root: root.clone(),
        })
        .expect("graph should parse")
        .metrics();

        let weighted = optimize_request(&request_from_nodes(
            "fir8_weighted",
            nodes.clone(),
            &root,
            Mode::Weighted,
            Objective::Weighted,
            Budgets::default(),
        ))
        .expect("weighted extraction should succeed");
        let area_constrained = optimize_request(&request_from_nodes(
            "fir8_area_budget",
            nodes,
            &root,
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                area_max: Some(original_metrics.area),
                ..Budgets::default()
            },
        ))
        .expect("constrained extraction should succeed");

        let weighted_metrics = weighted.metrics.expect("weighted metrics");
        let constrained_metrics = area_constrained.metrics.expect("constrained metrics");
        assert!(weighted.feasible);
        assert!(area_constrained.feasible);
        assert!(constrained_metrics.latency < weighted_metrics.latency);
        assert!(constrained_metrics.area > weighted_metrics.area);
        assert!(constrained_metrics.area <= original_metrics.area);
        assert!(constrained_metrics.dsp_count > weighted_metrics.dsp_count);
    }

    #[test]
    fn fir8_lut_cap_forces_dsp_heavy_solution() {
        let (nodes, root) = build_fir8_nodes();
        let original_metrics = graph_to_expr(&IrGraph {
            ir_nodes: nodes.clone(),
            root: root.clone(),
        })
        .expect("graph should parse")
        .metrics();

        let weighted = optimize_request(&request_from_nodes(
            "fir8_weighted",
            nodes.clone(),
            &root,
            Mode::Weighted,
            Objective::Weighted,
            Budgets::default(),
        ))
        .expect("weighted extraction should succeed");
        let lut_capped = optimize_request(&request_from_nodes(
            "fir8_lut_cap",
            nodes,
            &root,
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                lut_max: Some(original_metrics.lut_count),
                ..Budgets::default()
            },
        ))
        .expect("lut-capped extraction should succeed");

        let weighted_metrics = weighted.metrics.expect("weighted metrics");
        let constrained_metrics = lut_capped.metrics.expect("constrained metrics");
        assert!(lut_capped.feasible);
        assert!(constrained_metrics.lut_count <= original_metrics.lut_count);
        assert!(constrained_metrics.dsp_count > weighted_metrics.dsp_count);
        assert!(constrained_metrics.area > weighted_metrics.area);
        assert!(constrained_metrics.latency <= original_metrics.latency);
    }

    #[test]
    fn impossible_budget_reports_infeasible_solution() {
        let request = request_from_nodes(
            "generic_mul_impossible_budget",
            vec![
                IrNode {
                    id: "x".into(),
                    op: IrOp::Input,
                    name: Some("x".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "y".into(),
                    op: IrOp::Input,
                    name: Some("y".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Mul,
                    name: None,
                    value: None,
                    inputs: vec!["x".into(), "y".into()],
                },
            ],
            "root",
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                area_max: Some(0),
                latency_max: Some(0),
                dsp_max: Some(0),
                lut_max: Some(0),
            },
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        assert!(!response.feasible);
        assert!(response.metrics.is_none());
        assert!(
            response
                .message
                .expect("message")
                .contains("no feasible solution")
        );
    }

    #[test]
    fn latency_unconstrained_is_no_worse_than_any_dsp_capped_result() {
        let (nodes, root) = build_fir8_nodes();
        let original_metrics = graph_to_expr(&IrGraph {
            ir_nodes: nodes.clone(),
            root: root.clone(),
        })
        .expect("graph should parse")
        .metrics();

        let unconstrained = optimize_request(&request_from_nodes(
            "fir8_latency_unconstrained",
            nodes.clone(),
            &root,
            Mode::Constrained,
            Objective::Latency,
            Budgets::default(),
        ))
        .expect("unconstrained extraction should succeed");
        let unconstrained_latency = unconstrained.metrics.expect("metrics").latency;

        for dsp_max in 0..=original_metrics.dsp_count {
            let response = optimize_request(&request_from_nodes(
                &format!("fir8_dsp_cap_{dsp_max}"),
                nodes.clone(),
                &root,
                Mode::Constrained,
                Objective::Latency,
                Budgets {
                    dsp_max: Some(dsp_max),
                    ..Budgets::default()
                },
            ))
            .expect("constrained extraction should succeed");
            let metrics = response.metrics.expect("metrics");
            assert!(unconstrained_latency <= metrics.latency);
        }
    }

    #[test]
    fn dsp_budget_can_be_spent_on_adders() {
        let request = request_from_nodes(
            "add_chain",
            vec![
                IrNode {
                    id: "a".into(),
                    op: IrOp::Input,
                    name: Some("a".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "b".into(),
                    op: IrOp::Input,
                    name: Some("b".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "c".into(),
                    op: IrOp::Input,
                    name: Some("c".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "sum0".into(),
                    op: IrOp::Add,
                    name: None,
                    value: None,
                    inputs: vec!["a".into(), "b".into()],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Add,
                    name: None,
                    value: None,
                    inputs: vec!["sum0".into(), "c".into()],
                },
            ],
            "root",
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                dsp_max: Some(1),
                ..Budgets::default()
            },
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        assert!(response.feasible);
        let metrics = response.metrics.expect("metrics");
        assert_eq!(metrics.dsp_count, 1);
        assert_eq!(metrics.latency, 3);
        let optimized = response.optimized_ir.expect("optimized ir");
        assert!(
            optimized
                .ir_nodes
                .iter()
                .any(|node| node.op == IrOp::AddDsp)
        );
    }

    #[test]
    fn mac_dsp_is_selected_when_available() {
        let request = request_from_nodes(
            "mac_candidate",
            vec![
                IrNode {
                    id: "a".into(),
                    op: IrOp::Input,
                    name: Some("a".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "b".into(),
                    op: IrOp::Input,
                    name: Some("b".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "c".into(),
                    op: IrOp::Input,
                    name: Some("c".into()),
                    value: None,
                    inputs: vec![],
                },
                IrNode {
                    id: "prod".into(),
                    op: IrOp::Mul,
                    name: None,
                    value: None,
                    inputs: vec!["a".into(), "b".into()],
                },
                IrNode {
                    id: "root".into(),
                    op: IrOp::Add,
                    name: None,
                    value: None,
                    inputs: vec!["prod".into(), "c".into()],
                },
            ],
            "root",
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                dsp_max: Some(1),
                ..Budgets::default()
            },
        );

        let zero_dsp_request = request_from_nodes(
            "mac_candidate_zero_dsp",
            request.ir_nodes.clone(),
            &request.root,
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                dsp_max: Some(0),
                ..Budgets::default()
            },
        );

        let response = optimize_request(&request).expect("optimizer should succeed");
        let zero_dsp = optimize_request(&zero_dsp_request).expect("optimizer should succeed");
        assert!(response.feasible);
        assert!(zero_dsp.feasible);
        let metrics = response.metrics.expect("metrics");
        let zero_dsp_metrics = zero_dsp.metrics.expect("zero-dsp metrics");
        assert_eq!(metrics.dsp_count, 1);
        assert!(metrics.latency < zero_dsp_metrics.latency);
        let optimized = response.optimized_ir.expect("optimized ir");
        assert!(
            optimized
                .ir_nodes
                .iter()
                .any(|node| node.op == IrOp::MacDsp)
        );
    }

    #[test]
    fn batch_matches_single_query_results() {
        let (nodes, root) = build_fir8_nodes();
        let single_weighted = optimize_request(&request_from_nodes(
            "fir8_weighted_single",
            nodes.clone(),
            &root,
            Mode::Weighted,
            Objective::Weighted,
            Budgets::default(),
        ))
        .expect("single weighted should succeed");
        let single_area_capped = optimize_request(&request_from_nodes(
            "fir8_area_single",
            nodes.clone(),
            &root,
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                area_max: Some(55),
                ..Budgets::default()
            },
        ))
        .expect("single constrained should succeed");
        let single_zero_dsp = optimize_request(&request_from_nodes(
            "fir8_zero_dsp_single",
            nodes.clone(),
            &root,
            Mode::Constrained,
            Objective::Latency,
            Budgets {
                dsp_max: Some(0),
                ..Budgets::default()
            },
        ))
        .expect("single zero-dsp should succeed");
        let single_pareto = optimize_request(&request_from_nodes(
            "fir8_pareto_single",
            nodes.clone(),
            &root,
            Mode::Pareto2d,
            Objective::Latency,
            Budgets::default(),
        ))
        .expect("single pareto should succeed");

        let batch = optimize_batch_request(&batch_request_from_nodes(
            "fir8_batch",
            nodes,
            &root,
            vec![
                BatchQuery {
                    name: "weighted".into(),
                    mode: Mode::Weighted,
                    objective: Objective::Weighted,
                    weights: Weights::default(),
                    budgets: Budgets::default(),
                    label: None,
                },
                BatchQuery {
                    name: "latency_under_area".into(),
                    mode: Mode::Constrained,
                    objective: Objective::Latency,
                    weights: Weights::default(),
                    budgets: Budgets {
                        area_max: Some(55),
                        ..Budgets::default()
                    },
                    label: None,
                },
                BatchQuery {
                    name: "latency_under_dsp".into(),
                    mode: Mode::Constrained,
                    objective: Objective::Latency,
                    weights: Weights::default(),
                    budgets: Budgets {
                        dsp_max: Some(0),
                        ..Budgets::default()
                    },
                    label: None,
                },
                BatchQuery {
                    name: "pareto_2d".into(),
                    mode: Mode::Pareto2d,
                    objective: Objective::Latency,
                    weights: Weights::default(),
                    budgets: Budgets::default(),
                    label: None,
                },
            ],
        ))
        .expect("batch optimization should succeed");

        let weighted = batch
            .results
            .iter()
            .find(|result| result.name == "weighted")
            .expect("weighted batch result");
        assert_eq!(weighted.metrics, single_weighted.metrics);
        assert_eq!(weighted.optimized_ir, single_weighted.optimized_ir);

        let area_capped = batch
            .results
            .iter()
            .find(|result| result.name == "latency_under_area")
            .expect("area-capped batch result");
        assert_eq!(area_capped.metrics, single_area_capped.metrics);
        assert_eq!(area_capped.optimized_ir, single_area_capped.optimized_ir);

        let zero_dsp = batch
            .results
            .iter()
            .find(|result| result.name == "latency_under_dsp")
            .expect("zero-dsp batch result");
        assert_eq!(zero_dsp.metrics, single_zero_dsp.metrics);
        assert_eq!(zero_dsp.optimized_ir, single_zero_dsp.optimized_ir);

        let pareto = batch
            .results
            .iter()
            .find(|result| result.name == "pareto_2d")
            .expect("pareto batch result");
        assert_eq!(pareto.frontier, single_pareto.frontier);
        assert_eq!(
            batch.shared_stats.iterations,
            single_weighted.stats.iterations
        );
        assert_eq!(batch.shared_stats.eclasses, single_weighted.stats.eclasses);
        assert_eq!(batch.shared_stats.enodes, single_weighted.stats.enodes);
        assert!(batch.shared_stats.runtime_ms > 0);
    }

    #[test]
    fn batch_latency_unconstrained_matches_empty_budget_query() {
        let (nodes, root) = build_fir8_nodes();
        let single = optimize_request(&request_from_nodes(
            "fir8_latency_single",
            nodes.clone(),
            &root,
            Mode::Constrained,
            Objective::Latency,
            Budgets::default(),
        ))
        .expect("single unconstrained latency should succeed");

        let batch = optimize_batch_request(&batch_request_from_nodes(
            "fir8_latency_batch",
            nodes,
            &root,
            vec![BatchQuery {
                name: "latency_unconstrained".into(),
                mode: Mode::Constrained,
                objective: Objective::Latency,
                weights: Weights::default(),
                budgets: Budgets::default(),
                label: None,
            }],
        ))
        .expect("batch should succeed");

        let result = batch.results.first().expect("batch result");
        assert_eq!(result.metrics, single.metrics);
        assert_eq!(result.optimized_ir, single.optimized_ir);
        assert_eq!(batch.shared_stats.iterations, single.stats.iterations);
        assert_eq!(batch.shared_stats.eclasses, single.stats.eclasses);
        assert_eq!(batch.shared_stats.enodes, single.stats.enodes);
        assert!(batch.shared_stats.runtime_ms > 0);
    }
}
