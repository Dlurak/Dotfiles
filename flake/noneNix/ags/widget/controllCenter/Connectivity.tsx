import Network from "gi://AstalNetwork"
import Bluetooth from "gi://AstalBluetooth"
import { bind } from "astal"
import { shorten } from "../../utils/strings"

type ButtonProps = {
	onPrimary?: VoidFunction
}

const WiFiButton = ({ onPrimary }: ButtonProps) => {
	const network = Network.get_default()

	return (
		<button onClicked={onPrimary}>
			<box spacing={4}>
				<icon
					css="font-size: 24px"
					icon={bind(network.wifi, "icon_name")}
				/>
				<box vertical spacing={2}>
					<label className="title" xalign={0}>Wi-Fi</label>
					<label className="value" xalign={0}>
						{bind(network.wifi, "ssid")}
					</label>
				</box>
			</box>
		</button>
	);
}

const BluetoothButton = ({ onPrimary }: ButtonProps) => {
	const bluetooth = Bluetooth.get_default()

	return (
		<button onClick={onPrimary}>
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
	onWifi?: () => void
	onBluetooth?: () => void
}

export const Connectivity = ({ onWifi, onBluetooth }: ConnectivityProps) => {
	return (
		<box hexpand className="connectivity bordered" vertical>
			<WiFiButton onPrimary={onWifi} />
			<BluetoothButton onPrimary={onBluetooth} />
		</box>
	)
}
