export const formatTime = (seconds: number, showSecond = false) => {
	if (seconds <= 0) return "Unknown";

	const hours = Math.floor(seconds / 3600);
	const minutes = Math.floor((seconds % 3600) / 60);
	const secs = Math.round(seconds % 60);

	if (hours > 0) {
		return showSecond
			? `${hours}h ${minutes}m ${secs}s`
			: `${hours}h ${minutes}m`;
	} 
	if (minutes > 0) {
		return showSecond
			? `${minutes}m ${secs}s`
			: `${minutes}m`;
	}
	return `${secs}s`;
};

export const formatMusicTime = (seconds: number) => {
	const hours = Math.floor(seconds / 3600);
	const minutes = Math.floor((seconds % 3600) / 60);
	const secs = Math.round(seconds % 60);

	const base = `${minutes.toString().padStart(2, "0")}:${secs.toString().padStart(2, "0")}`
	return hours > 0
		? `${hours.toString().padStart(2, "0")}:${base}`
		: base;
}
