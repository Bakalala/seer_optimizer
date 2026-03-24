use rust_core::{
    BatchOptimizeRequest, BatchOptimizeResponse, OptimizeRequest, OptimizeResponse,
    optimize_batch_request, optimize_request,
};
use serde_json::Value;
use std::io::{self, Read};

fn main() {
    let mut input = String::new();
    if let Err(error) = io::stdin().read_to_string(&mut input) {
        let response = OptimizeResponse::error(format!("failed to read stdin: {error}"));
        println!(
            "{}",
            serde_json::to_string_pretty(&response).expect("response serialization should succeed")
        );
        return;
    }

    let value = match serde_json::from_str::<Value>(&input) {
        Ok(value) => value,
        Err(error) => {
            let response = OptimizeResponse::error(format!("invalid request json: {error}"));
            println!(
                "{}",
                serde_json::to_string_pretty(&response)
                    .expect("response serialization should succeed")
            );
            return;
        }
    };

    if value.get("queries").is_some() {
        let response = match serde_json::from_value::<BatchOptimizeRequest>(value) {
            Ok(request) => match optimize_batch_request(&request) {
                Ok(response) => response,
                Err(error) => BatchOptimizeResponse::error(String::new(), error.to_string()),
            },
            Err(error) => BatchOptimizeResponse::error(
                String::new(),
                format!("invalid batch request json: {error}"),
            ),
        };
        println!(
            "{}",
            serde_json::to_string_pretty(&response).expect("response serialization should succeed")
        );
        return;
    }

    let response = match serde_json::from_value::<OptimizeRequest>(value) {
        Ok(request) => match optimize_request(&request) {
            Ok(response) => response,
            Err(error) => OptimizeResponse::error(error.to_string()),
        },
        Err(error) => OptimizeResponse::error(format!("invalid request json: {error}")),
    };

    println!(
        "{}",
        serde_json::to_string_pretty(&response).expect("response serialization should succeed")
    );
}
