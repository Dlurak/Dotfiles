import { bind, execAsync } from "astal"
import AstalBluetooth from "gi://AstalBluetooth"

export const Bluetooth = ({ reset }: { reset: VoidFunction }) => {
	const bluetooth = AstalBluetooth.get_default()

	return (
		<>
			<box className="subwindow-title-line" spacing={6}>
				<button onClick={() => reset()}></button>
				<label className="subwindow-title">Bluetooth</label>
				<box hexpand />
				<button onClick={() => execAsync("blueman-manager")}>
					
				</button>
			</box>

			<scrollable heightRequest={250}>
				<box orientation={1} hexpand>
					{bind(bluetooth, 'devices').as((devs) => devs.filter(({ name }) => name).map((dev) => (
                        <box hexpand>
                            <button
                                hexpand
                                onClick={() => {
									const connectedDevices = bluetooth
										.devices
										.filter(({ connected }) => connected)
										.map(({ address }) => address);

									if (connectedDevices.includes(dev.address)) {
										dev.disconnect_device(() => {})
										return
									}

									dev.connect_device(() => {})
                                }}
                            >
                                <box spacing={6} hexpand>
                                    <icon css="font-size: 22px" icon={bind(dev, "icon")} />
                                    <box vertical hexpand>
                                        <label label={bind(dev, "name")} className="title" xalign={0} />
                                        <label label={bind(dev, "address")} xalign={0} />
                                    </box>
                                </box>
                            </button>
                        </box>
                    )))}
				</box>
			</scrollable>
		</>
	)
}
