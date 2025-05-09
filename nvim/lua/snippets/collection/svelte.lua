return {
	{ trigger = 'script', body = '<script>\n\t${1}\n</script>' },
	{ trigger = 'json', body = '{JSON.stringify(${1})}' },
	{ trigger = 'window', body = '<svelte:window\n/>' },
	{ trigger = 'scriptts', body = '<script lang="ts">\n\t${1:script}\n</script>' },
	{ trigger = 'style', body = '<style>\n\t${1:style}\n</style>' },
	{ trigger = 'onMount', body = 'onMount(() => {\n\t${1:onMountCallback}\n});' },
	{ trigger = 'each', body = '{#each ${1:array} as ${2:item}}\n\t${3}\n{/each}' },
	{ trigger = 'if', body = '{#if ${1:condition}}\n\t${2}\n{:else}\n\t${3}\n{/if}' }
}
