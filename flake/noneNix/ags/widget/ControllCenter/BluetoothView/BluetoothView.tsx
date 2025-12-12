import Adw from "gi://Adw?version=1";
import { SPACING } from "../consts";
import { Gtk } from "ags/gtk4";
import { createBinding, createComputed, For } from "gnim";
import Bluetooth from "gi://AstalBluetooth"
import { Device } from "./Device";

export function BluetoothView() {
	const bluetooth = Bluetooth.get_default();
	const { adapter } = bluetooth;

	return (
		<box
			name="bluetooth"
			spacing={SPACING}
			orientation={Gtk.Orientation.VERTICAL}
		>
			<Adw.SwitchRow
				title="Bluetooth"
				subtitle={createBinding(adapter, "name")}
				active={bluetooth.adapter.powered}
				onNotifyActive={({ active }) => {
					bluetooth.adapter.powered = active
				}}
			/>

			<Adw.StatusPage
				visible={createBinding(bluetooth, "isPowered")(x => !x)}
				vexpand
				hexpand
				title="Bluetooth is deactivitated"
				iconName="bluetooth-disabled-symbolic"
			/>

			<BluetoothContent />
		</box>
	)
}

function BluetoothContent() {
	const bluetooth = Bluetooth.get_default();
	const { adapter } = bluetooth;

	const sortedDevs = createBinding(bluetooth, "devices")(
		(devs) => devs.toSorted((a, b) => {
			if (a.connected) return -1;
			if (b.connected) return 1;
			return 0;
		})
	);

	return (
		<scrolledwindow
			visible={createBinding(adapter, "powered")}
		>
			<box
				orientation={Gtk.Orientation.VERTICAL}
				spacing={SPACING}
			>
				<For each={sortedDevs}>
					{(dev: Bluetooth.Device) => (<Device device={dev} />)}
				</For>
			</box>
		</scrolledwindow>
	);
}
