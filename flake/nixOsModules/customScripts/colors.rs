use std::io::Write;

fn main() {
    const FG_COLOR: &str = "\x1b[38;5;";
    const BG_COLOR: &str = "\x1b[48;5;";
    const RESET_COLOR: &str = "\x1b[0m";

    for i in 0..=15 {
        println!(
            "{FG_COLOR}{i}mColor {:2}{RESET_COLOR}   {BG_COLOR}{i}m  Color {:2}  {RESET_COLOR}",
             i, i,
        );
    }

    std::io::stdout().flush().unwrap();
}
