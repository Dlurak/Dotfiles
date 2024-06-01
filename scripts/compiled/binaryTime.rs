use std::env;

fn to_binary(num: u8) -> String {
    let string = format!("{:08b}", num);

    string.replace("1", "●").replace("0", "○")
}

fn main() {
    let args: Vec<String> = env::args().collect();

    for arg in args.iter().skip(1) {
        match arg.parse::<u8>() {
            Ok(num) => println!("{}", to_binary(num)),
            Err(_) => continue
        }
    }
}
