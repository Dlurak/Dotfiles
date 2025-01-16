return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	config = function()
		require("custom.snippets.luasnip_init")
	end,
	keys = {
		{"<C-e>", function() require("luasnip").expand() end, mode = "i", { silent = true }},
		{"<C-b>", function() require("luasnip").jump(1) end, mode = {"n", "s", "i"}, { silent = true }},
		{"<C-s>", function() 
			local ls = require("luasnip")
			if ls.choice_active() then
				print("changing")
				ls.change_choice(1)
			end
		end, mode = {"n", "s", "i"}, { silent = true }},
	}
}
