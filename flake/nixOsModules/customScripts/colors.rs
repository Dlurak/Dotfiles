use std::{
    io::{Write, stdout},
    env::args
};

const FG_COLOR: &str = "\x1b[38;5;";
const BG_COLOR: &str = "\x1b[48;5;";
const RESET_COLOR: &str = "\x1b[0m";

fn main() {
    let upper_limit: u8 = args()
        .nth(1)
        .and_then(|n| n.parse().ok())
        .unwrap_or(15);
    for i in 0..=upper_limit {
        println!(
            "{FG_COLOR}{i}mColor {i:2}{RESET_COLOR}   {BG_COLOR}{i}m  Color {i:2}  {RESET_COLOR}",
        );
    }

    _ = stdout().flush();
}
