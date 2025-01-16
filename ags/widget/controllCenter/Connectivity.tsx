import Network from "gi://AstalNetwork"
import Bluetooth from "gi://AstalBluetooth"
import { bind } from "astal"
import { shorten } from "../../utils/strings"
import { isPrimaryClick, isSecondaryClick } from "../../utils/astal"

type ButtonProps = {
	onPrimary?: VoidFunction
	onSecondary?: VoidFunction
}

const WiFiButton = ({ onPrimary, onSecondary }: ButtonProps) => {
	const network = Network.get_default()

	return (
		<button
			onClick={(_, e) => {
				if (isPrimaryClick(e) && onPrimary) {
					onPrimary()
				}
				if (isSecondaryClick(e) && onSecondary) {
					onSecondary()
				}
			}}
		>
			<box spacing={4}>
				<icon
					css="font-size: 24px"
					icon={bind(network, "wifi").as(({ icon_name }) => icon_name)}
				/>
				<box vertical spacing={2}>
					<label className="title" xalign={0}>Wi-Fi</label>
					<label className="value" xalign={0}>
						{bind(network, "wifi").as(({ ssid }) => ssid)}
					</label>
				</box>
			</box>
		</button>
	);
}

const BluetoothButton = ({ onPrimary, onSecondary }: ButtonProps) => {
	const bluetooth = Bluetooth.get_default()

	return (
		<button
			onClick={(_, e) => {
				if (isPrimaryClick(e) && onPrimary) {
					onPrimary()
				}
				if (isSecondaryClick(e) && onSecondary) {
					onSecondary()
				}
			}}
		>
			<box spacing={4}>
				<icon
					css="font-size: 24px"
					icon={bind(bluetooth, "is_powered").as((isPowered) => `bluetooth-${isPowered ? "active" : "disabled"}-symbolic`)}
				/>
				<box vertical spacing={2}>
					<label className="title" xalign={0}>Bluetooth</label>
					<label className="value" xalign={0}>
						{bind(bluetooth, "devices").as((allDevs) => {
							const devs = allDevs.filter(({ connected }) => connected)
							if (devs.length === 0) {
								return "No connections"
							}
							if (devs.length <= 3) {
								const names = devs.map(({ name }) => name)
								return shorten(names.join(', '), 20)
							}

                            return `${devs.length} connections`
                        })}
					</label>
				</box>
			</box>
		</button>
	);
}

type ConnectivityProps = {
	onWifiPrimary?: () => void
	onWifiSecondary?: () => void
	onBluetoothPrimary?: () => void
	onBluetoothSecondary?: () => void
}

export const Connectivity = ({ onWifiPrimary, onWifiSecondary, onBluetoothPrimary, onBluetoothSecondary }: ConnectivityProps) => {
	return (
		<box hexpand className="connectivity bordered" vertical>
			<WiFiButton onPrimary={onWifiPrimary} onSecondary={onWifiSecondary} />
			<BluetoothButton onPrimary={onBluetoothPrimary} onSecondary={onBluetoothSecondary} />
		</box>
	)
}
