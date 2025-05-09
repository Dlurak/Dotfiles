local test_mod = [[
#[cfg(test)]
mod tests {
    use super::*;
}
]]

local test_fn = [[
#[test]
fn test_$1() {
    assert_eq!($2);
}
]]

local impl_fmt = [[
impl fmt::Display for $1 {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", $2)
    }
}
]]

return {
	{ trigger = "test-mod", body = test_mod },
	{ trigger = "test-fn", body = test_fn },
	{ trigger = "impl-fmt", body = impl_fmt },
	{ trigger = "prln", body = 'println!("{}", $1);' }
}
