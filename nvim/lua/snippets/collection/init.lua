return {
	snippets_by_filetype = {
		typescript = require("snippets.collection.typescript").typescript,
		typescript_react = require("snippets.collection.typescript").typescript_react,
		svelte = require("snippets.collection.svelte"),
		rust = require("snippets.collection.rust"),
	},
	-- global_snippets = require("snippets.collection.global"),
	global_snippets = {}
}
