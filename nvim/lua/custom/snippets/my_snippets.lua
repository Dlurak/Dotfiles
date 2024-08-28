return {
	snippets_by_filetype = {
		typescript = require("custom.snippets.collection.typescript").typescript,
		typescript_react = require("custom.snippets.collection.typescript").typescript_react,
		svelte = require("custom.snippets.collection.svelte"),
		markdown = require("custom.snippets.collection.markdown"),
		rust = require("custom.snippets.collection.rust"),
		lua = require("custom.snippets.collection.lua"),
		tex = require("custom.snippets.collection.tex"),
	},
	global_snippets = require("custom.snippets.collection.global"),
}
