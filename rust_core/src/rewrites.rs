use crate::language::{Math, MathAnalysis};
use egg::{Rewrite, rewrite as rw};

pub fn datapath_rewrites() -> Vec<Rewrite<Math, MathAnalysis>> {
    vec![
        rw!("add-zero-right"; "(+ ?x 0)" => "?x"),
        rw!("add-zero-left"; "(+ 0 ?x)" => "?x"),
        rw!("sub-zero"; "(- ?x 0)" => "?x"),
        rw!("sub-self"; "(- ?x ?x)" => "0"),
        rw!("mul-one-right"; "(* ?x 1)" => "?x"),
        rw!("mul-one-left"; "(* 1 ?x)" => "?x"),
        rw!("mul-zero-right"; "(* ?x 0)" => "0"),
        rw!("mul-zero-left"; "(* 0 ?x)" => "0"),
        rw!("add-self"; "(+ ?x ?x)" => "(* 2 ?x)"),
        rw!("mul-two-left"; "(* 2 ?x)" => "(+ ?x ?x)"),
        rw!("mul-two-right"; "(* ?x 2)" => "(+ ?x ?x)"),
        rw!("add-commute"; "(+ ?a ?b)" => "(+ ?b ?a)"),
        rw!("mul-commute"; "(* ?a ?b)" => "(* ?b ?a)"),
        rw!("distribute-left"; "(* ?x (+ ?y ?z))" => "(+ (* ?x ?y) (* ?x ?z))"),
        rw!("distribute-right"; "(* (+ ?y ?z) ?x)" => "(+ (* ?y ?x) (* ?z ?x))"),
        rw!("factor-left"; "(+ (* ?x ?y) (* ?x ?z))" => "(* ?x (+ ?y ?z))"),
        rw!("factor-right"; "(+ (* ?y ?x) (* ?z ?x))" => "(* (+ ?y ?z) ?x)"),
    ]
}
