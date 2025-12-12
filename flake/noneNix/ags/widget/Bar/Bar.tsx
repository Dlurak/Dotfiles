import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { Battery } from "./Battery"
import { Volume } from "./Volume"
import { Workspaces } from "./Workspaces"
import { Time } from "./Time"

const MARGIN = 8
const NIX_LOGO = " "

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
	  marginTop={MARGIN}
	  marginLeft={MARGIN}
	  marginRight={MARGIN}
	  marginBottom={0}
    >
      <centerbox cssName="centerbox">
        <box
          $type="start"
		  spacing={6}
		>
          <button
		    class="system"
			css="background: transparent;"
            halign={Gtk.Align.CENTER}
			onClicked={() => {
				const cc = app.get_window("controll-center");
				if (cc) cc.visible = !cc.visible;
			}}
			focusOnClick={false}
          >
            
            <label label={NIX_LOGO} />
          </button>
		  <Workspaces />
        </box>

        <box $type="center" />

		<box $type="end" spacing={6}>
			<Volume />
			<Battery />
			<Time />
		</box>
      </centerbox>
    </window>
  )
}
