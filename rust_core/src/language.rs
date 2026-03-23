use egg::{Analysis, DidMerge, EGraph, Id, Symbol, define_language};

define_language! {
    pub enum Math {
        Num(i64),
        Symbol(Symbol),
        "+" = Add([Id; 2]),
        "-" = Sub([Id; 2]),
        "*" = Mul([Id; 2]),
    }
}

#[derive(Default)]
pub struct MathAnalysis;

impl Analysis<Math> for MathAnalysis {
    type Data = Option<i64>;

    fn make(egraph: &mut EGraph<Math, Self>, enode: &Math) -> Self::Data {
        match enode {
            Math::Num(value) => Some(*value),
            Math::Symbol(_) => None,
            Math::Add([left, right]) => Some(egraph[*left].data? + egraph[*right].data?),
            Math::Sub([left, right]) => Some(egraph[*left].data? - egraph[*right].data?),
            Math::Mul([left, right]) => Some(egraph[*left].data? * egraph[*right].data?),
        }
    }

    fn merge(&mut self, to: &mut Self::Data, from: Self::Data) -> DidMerge {
        match (*to, from) {
            (None, Some(value)) => {
                *to = Some(value);
                DidMerge(true, false)
            }
            _ => DidMerge(false, false),
        }
    }

    fn modify(egraph: &mut EGraph<Math, Self>, id: Id) {
        if let Some(value) = egraph[id].data {
            let constant_id = egraph.add(Math::Num(value));
            egraph.union(id, constant_id);
        }
    }
}
