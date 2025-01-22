import { Gtk } from "astal/gtk3";
import AstalApps from "gi://AstalApps"

type Props = {
	app: AstalApps.Application,
	reset: VoidFunction
}

export const AppButton = ({ app, reset }: Props)  => <button
    className="AppButton"
    onClicked={() => {
        reset();
        app.launch();
    } }>
		<box spacing={6}>
			<icon icon={app.iconName} />
			<box valign={Gtk.Align.CENTER} vertical>
				<label
					className="name"
					truncate
					xalign={0}
					label={app.name} />
				{app.description && <label
					className="description"
					wrap
					xalign={0}
					label={app.description} />}
			</box>
		</box>
</button>
