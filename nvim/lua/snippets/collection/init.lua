return {
	snippets_by_filetype = {
		typescript = require("snippets.collection.typescript").typescript,
		typescriptreact = require("snippets.collection.typescript").typescriptreact,
		svelte = require("snippets.collection.svelte"),
		rust = require("snippets.collection.rust"),
		markdown = require("snippets.collection.markdown"),
		typst = require("snippets.collection.typst"),
	},
	global_snippets = require("snippets.collection.global"),
}
