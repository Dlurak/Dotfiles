import { App, Astal, Gtk } from "astal/gtk3"

export const Power = () => {
    const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor

	return (
		<window
			className="power"
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={TOP | LEFT | RIGHT | BOTTOM}
			application={App}
		>
			<box className="wrapper" valign={Gtk.Align.CENTER} halign={Gtk.Align.CENTER} vexpand hexpand>
				<box className="wrapper">
					<button>
					</button>
				</box>
			</box>
		</window>
	)
}
