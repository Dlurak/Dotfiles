local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node

local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local conds_expand = require("luasnip.extras.conditions.expand")

local utils = require("custom.snippets.utils")

ls.add_snippets("tex", {
	s("beg", {
		t("\\begin{"), i(1, "align*"), t("}"),
		t({ "", "\t" }), i(2),
		t({ "", "\\end{" }), rep(1), t("}"),
	}),
	s("section", { t("\\section{"), i(0), t("}") }),
	s("subsection", { t("\\subsection{"), i(0), t("}") }),
	s("subsubsection", { t("\\subsubsection{"), i(0), t("}") }),
	s("paragraph", { t("\\paragraph{"), i(0), t("}") }),
	s("textbf", { t("\\textbf{"), i(0), t("}") }),
	s("quote", { t("\\glqq "), i(0), t("\\grqq") }),
	s("im", { t("$"), i(1), t("$"), i(0) }),
	s("dm", {
		t { "\\[", "\t" },
		i(0),
		t { "", ".\\]" },
	}),
	s("ali*", {
		t { "\\begin{align*}", "\t" },
		i(0),
		t { "", "\\end{align*}" },
	}),
	s("itemize", {
		t { "\\begin{itemize}", "\t\\item " },
		i(0),
		t { "", "\\end{itemize}" },
	}),
	s("enum", {
		t { "\\begin{enumerate}", "\t\\item " },
		i(0),
		t { "", "\\end{enumerate}" },
	}),
	-- s("frac", { t("\\frac{"), i(1), t("}{"), i(2), t("}") }, { condition =  utils.is_math }),
	-- s("sqrt", { t("\\sqrt{"), i(1), t("}") }, { condition =  utils.is_math }),
	-- s("sq", { t("\\^{2}") }, { condition =  utils.is_math }),
	s("frac", { t("\\frac{"), i(1), t("}{"), i(2), t("}") }),
	s("sqrt", { t("\\sqrt{"), i(1), t("}") }),
	s("sq", { t("\\^{2}") }),
})

ls.add_snippets("markdown", {
	s("img", {
		t("!["),
		i(2, "alt text"),
		t("]("),
		i(1, "image_url"),
		t(")"),
	}),
})
