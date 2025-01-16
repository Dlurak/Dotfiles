import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { Workspaces } from "./workspaces";
import { Media } from "./Media";
import { Volume } from "./Volume";
import { Battery } from "./Battery";
import { Clock } from "./Clock";

const margin = 8;

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return (
		<window
			name="bar"
			className="bar"
			gdkmonitor={gdkmonitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={TOP | LEFT | RIGHT}
			application={App}
			margin-top={margin}
			margin-bottom={0}
			margin-left={margin}
			margin-right={margin}
		>
			<centerbox>
				<box spacing={8}>
					<button
						className="bar-system-button"
						onClick={() => {
							App.toggle_window("controll-center")
						}}
					>
						 
					</button>
					<Workspaces monitor={gdkmonitor} />
				</box>

				<box>
					<Media />
				</box>

				<box halign={Gtk.Align.END} spacing={12}>
					<Volume />
					<Battery />
					<Clock />
				</box>
			</centerbox>
		</window>
	)
}
