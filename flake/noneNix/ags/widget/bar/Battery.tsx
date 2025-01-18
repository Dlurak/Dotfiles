import { bind } from "astal"
import AstalBattery from "gi://AstalBattery"

export const Battery = () => {
	const bat = AstalBattery.get_default();

	const icon = bind(bat, "percentage")
		.as((b) => Math.round(b * 10) * 10)
		.as((b) => `battery-level-${b}-symbolic`);

	const label = bind(bat, "percentage").as((b) => `${Math.round(b * 100)}%`)

	return (
		<box spacing={6}>
			<icon icon={icon} />
			<label>{label}</label>
		</box>
	);
}
