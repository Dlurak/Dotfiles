import { createPoll } from "ags/time"
import { Gtk } from "ags/gtk4"

export function Time() {
	const time = createPoll("", 1000, "date +%H:%M")

	return (
		<menubutton halign={Gtk.Align.CENTER}>
			<label label={time} />
			<popover>
				<TimePopover />
			</popover>
		</menubutton>
	);
}

function TimePopover() {
	const timeSecs = createPoll("", 250, "date +%H:%M:%S")
	return (
		<box
			orientation={Gtk.Orientation.VERTICAL}
			spacing={8}
		>
			<label
				label={timeSecs}
				css={`
					font-weight: 800;
					font-size: 2.5rem;
					padding-top: 8px;
				`}
			/>
			<Gtk.Calendar />
		</box>
	)
}
