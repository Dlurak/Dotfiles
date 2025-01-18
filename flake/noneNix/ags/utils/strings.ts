export const shorten = (str: string, maxLen: number, extender = "...") => {
	if (str.length <= maxLen) {
		return str
	}

	return `${str.slice(0, maxLen-extender.length)}${extender}`
}
