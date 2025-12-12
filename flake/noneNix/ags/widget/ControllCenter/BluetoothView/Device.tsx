import Bluetooth from "gi://AstalBluetooth?version=0.1";
import { SPACING } from "../consts";
import { Gtk } from "ags/gtk4";
import { createBinding } from "gnim";
import { QsMainButton } from "../Wrapper/QsButton";
import { BluetoothBattery } from "./DeviceWidgets";

export function Device({ device }: { device: Bluetooth.Device }) {
	return (
		<box
			class="device bordered"
			css="padding: 8px;"
			hexpand
			spacing={SPACING * 2}
			orientation={Gtk.Orientation.VERTICAL}
		>
			<label
				halign={Gtk.Align.START}
				label={createBinding(device, "alias")}
				css={`
					font-weight: 800;
					font-size: 1.4rem;
				`}
			/>

			<box
				halign={Gtk.Align.START}
				spacing={SPACING}
			>
				<image
					halign={Gtk.Align.START}
					pixelSize={55}
					iconName={createBinding(device, "icon")}
				/>

				<box hexpand />

				<box
					orientation={Gtk.Orientation.VERTICAL}
					spacing={SPACING}
				>
					<QsMainButton
						standalone
						title={createBinding(device, "connected")(con => con ? "Disconnect" : "Connect")}
						onClicked={() => {
							if (device.connected) device.disconnect_device(() => {});
							else device.connect_device(() => {});
						}}
						image={
							<image
								iconSize={Gtk.IconSize.NORMAL}
								iconName="bluetooth-active-symbolic"
							/>
						}
					/>
					<BluetoothBattery device={device} />
				</box>
			</box>
		</box>
	)
}

				/* <box orientation={Gtk.Orientation.VERTICAL} class="bordered"> */
				/* 	<button> */
				/* 		Connect */
				/* 	</button> */
				/* 	<button> */
				/* 		Trust */
				/* 	</button> */
				/* 	<button> */
				/* 		Unpair */
				/* 	</button> */
				/* </box> */
