local module = {}

-- TODO: Add support for javascript, not only typescript
-- Javascript needs things for document....

module.typescript = {
	{ trigger = 'fun', body = 'function ${1:name}(${2:args}) {\n\t$0\n}' },
	{ trigger = 'import', body = 'import { ${2:obj} } from "${1:package}";' },
	{ trigger = 'if', body = 'if (${1:condition}) {\n\t$0\n}' },
	{ trigger = 'interface', body = 'interface ${1:InterfaceName} {\n\t${2:property}: ${3:type};\n}' },
	{ trigger = "log", body = "console.log(${1:variable});" }
}

module.typescriptreact = {
	unpack(module.typescript),
	{ trigger = 'component', body = 'const ${1:ComponentName} = (${2:props}) => {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t);\n};' },
	{ trigger = 'useState', body = 'const [${1:state}, set${1/(.*)/${1:/capitalize}/}] = useState(${2:initialValue});' },
	{ trigger = 'useEffect', body = 'useEffect(() => {\n\t${1:effect}\n\treturn () => {\n\t\t${2:cleanup}\n\t};\n}, [${3:dependencies}]);' },
	{ trigger = 'props', body = 'interface ${1:PropsName} {\n\t${2:prop}: ${3:type};\n}' },
}

return module
