return {
	"nat-418/boole.nvim",
	config = function()
		require("boole").setup({
			mappings = {
				increment = '<C-a>',
				decrement = '<C-x>'
			},
			allow_caps_additions = {
				{ "montag", "dienstag", "mittwoch", "donnerstag", "freitag", "samstag", "sonntag" },
				{ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven" },
				{ "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun", "zehn", "elf" },
				{
                    "alpha",
                    "beta",
                    "gamma",
                    "delta",
                    "epsilon",
                    "zeta",
                    "eta",
                    "theta",
                    "iota",
                    "kappa",
                    "lambda",
                    "mu",
                    "nu",
                    "xi",
                    "omicron",
                    "pi",
                    "rho",
                    "sigma",
                    "tau",
                    "upsilon",
                    "phi",
                    "chi",
                    "psi",
                    "omega"
                },
			},
		})
	end
}
