import { exec } from "astal"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"

export const Power = () => {
    const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor

	return (
		<window
			className="power"
			name="power"
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			keymode={Astal.Keymode.EXCLUSIVE}
			visible={false}
			anchor={TOP | LEFT | RIGHT | BOTTOM}
			application={App}
			onKeyPressEvent={(self, event: Gdk.Event) => {
				if (event.get_keyval()[1] === Gdk.KEY_Escape) {
					self.hide()
					App.get_window("controll-center")?.hide()
				}
			}}
		>
			<box className="wrapper" valign={Gtk.Align.CENTER} halign={Gtk.Align.CENTER} vexpand hexpand spacing={8}>
				{[
					["", "Lock", "hyprlock"],
					["", "Shutdown", "shutdown 0"],
					["", "Suspend", "systemctl suspend"],
					["", "Reboot", "reboot"],
				].map(([icon, label, cmd]) => (
					<button
						onClick={() => {
							App.toggle_window("power")
							App.get_window("controll-center")?.hide()
							exec(cmd)
						}}
					>
						<box vertical vexpand hexpand>
							<box vexpand />
							<label label={icon} className="power-icon" valign={Gtk.Align.CENTER} halign={Gtk.Align.CENTER} />
							<box vexpand />
							<label label={label} margin={4} />
						</box>
					</button>
				))}
			</box>
		</window>
	)
}
