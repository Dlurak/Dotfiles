use std::convert::TryFrom;
use std::env;
use std::process::exit;
use std::time::{Duration, SystemTime, UNIX_EPOCH};

#[derive(Debug, Default)]
enum Unit {
    #[default]
    Seconds,
    Milliseconds,
}

impl Unit {
    fn duration(&self, duration: Duration) -> u64 {
        match self {
            Unit::Seconds => duration.as_secs(),
            Unit::Milliseconds => duration.as_millis() as u64,
        }
    }
}

impl TryFrom<&str> for Unit {
    type Error = String;

    fn try_from(value: &str) -> Result<Self, Self::Error> {
        match value {
            "sec" | "seconds" | "s" => Ok(Unit::Seconds),
            "milliseconds" | "ms" => Ok(Unit::Milliseconds),
            _ => Err(format!("Invalid unit: {}", value)),
        }
    }
}

fn parse_unit_arg(arg: &str) -> Option<Unit> {
    let prefix_len = if arg.starts_with("--unit=") {
        7
    } else if arg.starts_with("-u=") {
        3
    } else {
        return None;
    };

    let unit_str = &arg[prefix_len..];
    Unit::try_from(unit_str).map_err(|e| {
        eprintln!("Error': {}", e);
        exit(1);
    }).ok()
}

fn main() {
    let unit = env::args()
        .find(|arg| arg.starts_with("--unit=") || arg.starts_with("-u="))
        .and_then(|arg| parse_unit_arg(&arg))
        .unwrap_or_default();

    let start = SystemTime::now();
    match start.duration_since(UNIX_EPOCH) {
        Ok(duration) => {
            println!("{}", unit.duration(duration));
        },
        Err(e) => {
            eprintln!("Error: {:?}", e);
            exit(1);
        }
    }
}
