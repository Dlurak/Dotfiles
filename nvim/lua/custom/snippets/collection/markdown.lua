local install_snippet = [[
```bash
npm install ${1:package-name}
```

```bash
yarn add ${1:package-name}
```

```bash
pnpm add ${1:package-name}
```

```bash
bun add ${1:package-name}
```
]]

return {
	{ trigger = 'link', body = '[${1:Label}](${2:URL})' },
	{ trigger = 'img', body = '![${1:Label}](${2:URL})' },

	{ trigger = 'install', body = install_snippet }
}
