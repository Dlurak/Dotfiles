import Hyprland from "gi://AstalHyprland";
import { createBinding, For } from "gnim";

export function Workspaces() {
	const hyprland = Hyprland.get_default();

	const focused = createBinding(hyprland, "focusedWorkspace").as((ws) => ws.id);

	return (
		<box class="workspaces">
			<For each={
				createBinding(hyprland, "workspaces")(
					(ws) => ws.toSorted(
						// (a, b) => a.name.localeCompare(b.name)
						(a, b) => a.id - b.id
					)
				)
			}>
				{(workspace: Hyprland.Workspace) => (
					<button
						onClicked={() => workspace.focus()}
						focusOnClick={false}
					>
						<label label={focused.as(focused => focused === workspace.id ? "" : workspace.name)} />
					</button>
				)}
			</For>
		</box>
	);
}
