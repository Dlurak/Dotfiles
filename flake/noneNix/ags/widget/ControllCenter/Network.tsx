import { Gtk } from "ags/gtk4";
import { MAIN_BUTTON_SIZE } from "./consts";
import { QsMainButton } from "./Wrapper/QsButton";
import Bluetooth from "gi://AstalBluetooth"
import AstalNetwork from "gi://AstalNetwork"
import { createBinding, createComputed, Setter } from "gnim";
import { Tab } from "./types";

const InternetIcon = () => {
	const network = AstalNetwork.get_default()
	const source = createBinding(network, "primary");
	const wiredIcon = createBinding(network.wired, "iconName");
	const wifiIcon = createBinding(network.wifi, "iconName");

	return (
		<image
			iconSize={Gtk.IconSize.LARGE}
			iconName={createComputed(() => {
				return source() == AstalNetwork.Primary.WIRED
					? wiredIcon()
					: wifiIcon();
			})}
		/>
	);
}

export function Network({ setSelected }: { setSelected: Setter<Tab> }) {
	const network = AstalNetwork.get_default()
	const source = createBinding(network, "primary");
	const wifiSubtitle = createBinding(network.wifi, "ssid");

	const bluetooth = Bluetooth.get_default();
	const bluetoothDeviceConnected = createComputed(
      [
         createBinding(bluetooth, "devices"),
         createBinding(bluetooth, "isConnected"),
      ],
      (d, _) => {
         for (const device of d) {
            if (device.connected) return device.alias;
         }
         return "None";
      },
   );

	return (
		<box
			orientation={Gtk.Orientation.VERTICAL}
			class="group"
			widthRequest={MAIN_BUTTON_SIZE}
			spacing={3}
			hexpand
			vexpand
		>
			<QsMainButton
				title="Network"
				image={<InternetIcon />}
				subtitle={createComputed(() => {
					return source() == AstalNetwork.Primary.WIRED
						? "Wired"
						: wifiSubtitle();
				})}
			/>
			<QsMainButton
				title="Bluetooth"
				subtitle={bluetoothDeviceConnected}
				image={
					<image
						iconSize={Gtk.IconSize.LARGE}
						iconName={createBinding(bluetooth, "isPowered")
							(on => `bluetooth-${on ? "active" : "disabled"}-symbolic`)
						}
					/>
				}
				onClicked={() => setSelected("bluetooth")}
			/>
		</box>
	);
}
