import { Accessor, For, Setter } from "gnim";
import { Tab } from "./types";
import { Gtk } from "ags/gtk4";
import { keys } from "../../utils/obj";

type Props = {
	selected: Accessor<Tab>
	setSelected: Setter<Tab>
}

const TABS: Partial<Record<Tab, string>> = {
	"general": "  "
}

export function SideBar({ setSelected, selected }: Props) {
	return (
		<box
			orientation={Gtk.Orientation.VERTICAL}
			class="sidebar"
		>
			{...keys(TABS).map((tab) => (
				<button
					onClicked={() => setSelected(tab)}
					halign={Gtk.Align.CENTER}
					valign={Gtk.Align.CENTER}
					css={selected(sel => sel === tab ? "color: #BB9AF7" : "")}
				>
					<label label={TABS[tab]} />
				</button>
			))}
		</box>
	);
}
