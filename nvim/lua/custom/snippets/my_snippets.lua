return {
	snippets_by_filetype = {
		typescript = require("custom.snippets.collection.typescript").typescript,
		typescript_react = require("custom.snippets.collection.typescript").typescript_react,
		markdown = require("custom.snippets.collection.markdown"),
		javascript = {
			{ trigger = 'fun', body = 'function ${1:name}(${2:args}) {\n\t$0\n}' },
			{ trigger = 'arrow', body = 'const ${1:name} = (${2:args}) => {\n\t$0\n};' },
			{ trigger = 'if', body = 'if (${1:condition}) {\n\t$0\n}' },
			{ trigger = 'console', body = 'console.log(${1:message});' }
		},
		svelte = {
			{ trigger = 'script', body = '<script>\n\t${1:script}\n</script>' },
			{ trigger = 'scriptts', body = '<script lang="ts">\n\t${1:script}\n</script>' },
			{ trigger = 'style', body = '<style>\n\t${1:style}\n</style>' },
			{ trigger = 'onMount', body = 'onMount(() => {\n\t${1:onMountCallback}\n});' },
			{ trigger = 'each', body = '{#each ${1:array} as ${2:item}}\n\t${3}\n{/each}' },
			{ trigger = 'if', body = '{#if ${1:condition}}\n\t${2}\n{:else}\n\t${3}\n{/if}' }
		},
	},
	global_snippets = {
		{ trigger = 'todo', body = '// TODO: ${1:task}' },
		{ trigger = 'fixme', body = '// FIXME: ${1:issue}' }
	}
}
