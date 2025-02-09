import { Variable } from "astal";
import { View } from "../../types";
import { App } from "astal/gtk3";

type TabButton = [string, View]
const tabButtons: TabButton[] = [
	[ " ", "controlls"],
	[ "󰀻 ", "apps"],
	[" ", "mixer"],
]



export const SidePanel = ({ currentView }: { currentView: Variable<View> }) => (
	<box vertical className="view-select">
		{tabButtons.map(([icon, view]) => (
			<button
				className={currentView(v => v === view ? "focused" : "")}
				onClick={() => currentView.set(view)}
			>
				{` ${icon}`}
			</button>
		))}
		<box vexpand />
		<button onClick={() => App.toggle_window("power")}>
			
		</button>
	</box>
)
