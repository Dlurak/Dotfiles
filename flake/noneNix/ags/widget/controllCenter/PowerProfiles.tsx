import { bind } from "astal"
import AstalPowerProfiles from "gi://AstalPowerProfiles"

const fmtProfile = (profile: string) => {
	switch (profile) {
		case "balanced":
			return "Balanced"
		case "performance":
			return "Performance ⚡"
		case "power-saver":
			return "Power Saver"
	}
	return profile
}

const nextProfile = (profile: string) => {
	switch (profile) {
		case "balanced":
			return "performance"
		case "performance":
			return "power-saver"
		case "power-saver":
			return "balanced"
	}
	return profile
}

export const PowerProfiles = () => {
	const powerprofiles = AstalPowerProfiles.get_default();

	return (
		<button
			hexpand
			className="bordered big-button"
			onClick={() => {
				powerprofiles.activeProfile = nextProfile(powerprofiles.activeProfile)
			}}
		>
			<box hexpand spacing={6}>
				<label className="big-icon">
					
				</label>
				<box vertical hexpand>
					<label className="title" xalign={0}>{bind(powerprofiles, "activeProfile").as(fmtProfile)}</label>
					<label className="value" xalign={0}>{bind(powerprofiles, "activeProfile").as(p => fmtProfile(nextProfile(p)))}</label>
				</box>
			</box>
		</button>
	)
}
