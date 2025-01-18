import { exec, Variable } from "astal";
import { App } from "astal/gtk3";

const uptime = Variable("").poll(
	10_000,
	`awk '{printf "%02d:%02d", $1/3600, ($1%3600)/60}' /proc/uptime`
)

export const PowerLine = () => (
		<box className="bordered power-line">
			<label>
				{exec("whoami")}
			</label>
			<box hexpand />
			<label>
				{uptime()}
			</label>
			<button onClick={() => App.toggle_window("power")}>
				
			</button>
		</box>
	)
