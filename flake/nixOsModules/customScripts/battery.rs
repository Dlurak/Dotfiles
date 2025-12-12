use std::fs;
use std::str::FromStr;

#[derive(PartialEq, Eq)]
enum Status {
    Charging,
    Discharging
}

impl FromStr for Status {
    type Err = ();

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        match s {
            "Charging" | "Full" => Ok(Self::Charging),
            "Discharging" => Ok(Self::Discharging),
            _ => Err(())
        }
    }
}

fn icon(status: Status, cap: u8) -> Option<char> {
    if status == Status::Charging {
        match cap {
            0..=5 => Some('󰢟'),
            4..=15 => Some('󰢜'),
            14..=25 => Some('󰂆'),
            24..=35 => Some('󰂇'),
            34..=45 => Some('󰂈'),
            44..=55 => Some('󰢝'),
            54..=65 => Some('󰂉'),
            64..=75 => Some('󰢞'),
            74..=85 => Some('󰂊'),
            84..=95 => Some('󰂋'),
            94..=100 => Some('󰂅'),
            _ => None
        }
    } else {
        match cap {
            0..=5 => Some('󰂎'),
            4..=15 => Some('󰁺'),
            14..=25 => Some('󰁻'),
            24..=35 => Some('󰁼'),
            34..=45 => Some('󰁽'),
            44..=55 => Some('󰁾'),
            54..=65 => Some('󰁿'),
            64..=75 => Some('󰂀'),
            74..=85 => Some('󰂁'),
            84..=95 => Some('󰂂'),
            94..=100 => Some('󰁹'),
            _ => None
        }
    }
}

fn try_main() -> Option<()> {
    let mut capacity = fs::read_to_string("/sys/class/power_supply/BAT0/capacity").ok()?;
    capacity.pop();
    let capacity = capacity.parse().ok()?;
    let mut status = fs::read_to_string("/sys/class/power_supply/BAT0/status").ok()?;
    status.pop();
    let status = status.parse().ok()?;

    println!("{}  {capacity}%", icon(status, capacity)?);
    Some(())
}

fn main() {
    try_main();
}
