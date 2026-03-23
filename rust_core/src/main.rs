use rust_core::{OptimizeRequest, OptimizeResponse, optimize_request};
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

    let response = match serde_json::from_str::<OptimizeRequest>(&input) {
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
