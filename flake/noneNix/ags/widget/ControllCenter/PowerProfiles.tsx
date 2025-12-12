import { Gtk } from "ags/gtk4";
import { QsMainButton } from "./Wrapper/QsButton";
import PowerProfiles from "gi://AstalPowerProfiles"
import { createBinding } from "gnim";

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
	return "balanced"
}

export function PowerProfilesButton() {
	const powerprofiles = PowerProfiles.get_default()

	return (
		<QsMainButton
			standalone
			title={createBinding(powerprofiles, "activeProfile")(fmtProfile)}
			subtitle={createBinding(powerprofiles, "activeProfile")(prof => fmtProfile(nextProfile(prof)))}
			image={
				<image
					iconSize={Gtk.IconSize.LARGE}
					iconName={createBinding(powerprofiles, "iconName")}
				/>
			}
			onClicked={() => {
				const next = nextProfile(powerprofiles.get_active_profile());
				powerprofiles.set_active_profile(next);
			}}
		/>
	);
}
