import AstalBattery from "gi://AstalBattery"
import { createBinding } from "gnim"
import { Gtk } from "ags/gtk4"
import { With } from "ags"
import { formatTime } from "../../utils/time";

export function Battery() {
	const battery = AstalBattery.get_default()
	const percentage = createBinding(battery, "percentage");

	return (
		<menubutton>
			<box spacing={6}>
				<label label={percentage(perc => `${Math.round(perc * 100)}%`)} />
				<image iconName={createBinding(battery, "iconName")} />
			</box>
			<popover>
				<BatteryPopover battery={battery} />
			</popover>
		</menubutton>
	)
}

function BatteryPopover({ battery }: { battery: AstalBattery.Device }) {
	const percentage = createBinding(battery, "percentage");
	return (
		<box
			class="battery-popover"
			orientation={Gtk.Orientation.VERTICAL}
			spacing={6}
		>
			<label
				label="Battery"
				css={`
					font-weight: 700;
					font-size: 1.5rem;
					padding-bottom: 0.75rem;
				`}
			/>

			<box spacing={6} class="meter" css="padding-bottom: 0.5rem;">
				<box spacing={4}>
					<label label={percentage(perc => `${Math.round(perc * 100)}%`)} />
					<image iconName={createBinding(battery, "iconName")} />
				</box>
				<levelbar
					value={percentage}
					heightRequest={16}
					widthRequest={180}
				/>
			</box>

			<box
				class="stats"
				orientation={Gtk.Orientation.VERTICAL}
				halign={Gtk.Align.START}
			>
				<With value={createBinding(battery, "charging")}>
					{(charging) => charging
						? <label
							halign={Gtk.Align.START}
							label={createBinding(battery, "timeToFull")(secs => `Fully Charged in: ${formatTime(secs)}`)}
						/>
						: <label
							halign={Gtk.Align.START}
							label={createBinding(battery, "timeToEmpty")(secs => `Empty in: ${formatTime(secs)}`)}
						/>
					}
				</With>

				<label
					halign={Gtk.Align.START}
					label={createBinding(battery, "energy")(e => `Energy: ${e} Wh`)}
				/>
			</box>
		</box>
	);
}
