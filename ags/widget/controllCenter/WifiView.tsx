import { bind, execAsync, Variable } from "astal"
import Network from "gi://AstalNetwork"

export const WiFi = ({ reset }: { reset: VoidFunction }) => {
	const network = Network.get_default()

	return (
		<>
			<box className="subwindow-title-line" spacing={6}>
				<button onClick={() => reset()}></button>
				<label className="subwindow-title">WiFi</label>
				<box hexpand />
				<button onClick={() => network.wifi.scan()}>
					󰑓
				</button>
			</box>

			<scrollable heightRequest={250}>
				<box orientation={1} hexpand>
					{bind(network.wifi, 'accessPoints').as((acps) => acps.filter(({ ssid }) => ssid).map((acp) => (
                        <box hexpand>
                            <button
                                hexpand
                                onClick={() => {
                                    execAsync(`nmcli device wifi connect ${acp.bssid}`)
                                } }
                            >
                                <box spacing={6} hexpand>
                                    <icon css="font-size: 22px" icon={bind(acp, "iconName")} />
                                    <box vertical hexpand>
                                        <label label={bind(acp, "ssid")} className="title" xalign={0} />
                                        <label label={bind(acp, "bssid")} xalign={0} />
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
