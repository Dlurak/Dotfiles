import Bluetooth from "gi://AstalBluetooth?version=0.1";
import { createBinding } from "gnim";

export function BluetoothBattery({ device }: { device: Bluetooth.Device }) {
	const battery = createBinding(device, "batteryPercentage");
	return (
		<box class="bordered" vexpand hexpand css="padding: 9px;">
			<label
				label="Battery Not Available"
				visible={battery((bat) => bat === -1)}
			/>
			<box
				visible={battery((bat) => bat !== -1)}
			>
				<label
					label="  "
					css={`
					   font-size: 1.7rem;
					   margin: -7px 5px -7px -12px;
				   `}
				/>
				<label
					label={battery(bat => `${Math.round(bat*100)}%`)}
				/>
			</box>
		</box>
	)
}
