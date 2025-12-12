import { Gtk } from "ags/gtk4";
import { MAIN_BUTTON_SIZE, SPACING } from "./consts";
import { QsSmallButton } from "./Wrapper/QsButton";
import { execAsync } from "ags/process";
import { createPoll } from "ags/time";

const processRuns = async (name: string) => execAsync(
		`bash -c 'pgrep -x "${name}" > /dev/null && echo "true" || echo "false"'`
	).then(res => res === "true");
const toggleProcess = (process: string, args = "") => () => execAsync(`bash -c 'pkill ${process} || ${process} ${args}'`);

function HyprSunsetButton() {
	const active = createPoll(false, 1000, () => {
		return  processRuns("hyprsunset")
	});

	return (
		<QsSmallButton onClicked={toggleProcess("hyprsunset", "-t 5000")}>
			<label css={active(active => active ? "color: #E0AF68;" : "")} label=" 󰔎 " />
		</QsSmallButton>
	);
}
function WlinhibitButton() {
	const active = createPoll(false, 1000, () => {
		return  processRuns("wlinhibit")
	});

	return (
		<QsSmallButton onClicked={toggleProcess("wlinhibit")}>
			<label
			css={active(active => active ? "color: #F7768E;" : "")}
			label={active(active => active ? '  ' : '  ')} />
		</QsSmallButton>
	);
}

function IIOButton() {
	const active = createPoll(false, 1000, () => {
		return  processRuns("iio-hyprland")
	});

	return (
		<QsSmallButton onClicked={toggleProcess("iio-hyprland")}>
			<label
			css={active(active => active ?  "": "color: #7AA2F7;")}
			label="  " />
		</QsSmallButton>
	);
}

export function QuickButtons() {
	return (
		<box
			orientation={Gtk.Orientation.VERTICAL}
			widthRequest={MAIN_BUTTON_SIZE}
			spacing={SPACING}
			hexpand
			vexpand
		>
			<box
				widthRequest={MAIN_BUTTON_SIZE}
				spacing={SPACING}
				hexpand
				vexpand
			>
				<IIOButton />
				<HyprSunsetButton />
			</box>
			<box
				widthRequest={MAIN_BUTTON_SIZE}
				spacing={SPACING}
				hexpand
				vexpand
			>
				<QsSmallButton onClicked={() => {
					execAsync([
						"bash",
						"-c",
						'grim -g "$(slurp)" - | wl-copy && screenshot-notify'
					])
				}}>
					<label label=" 󰹑 " />
				</QsSmallButton>
				<WlinhibitButton />
			</box>
		</box>
	);
}
