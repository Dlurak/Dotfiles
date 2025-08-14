import { execAsync, exec, Variable } from "astal"
import Network from "gi://AstalNetwork"

const getConnections = () => 
	exec(`nmcli -t -f SSID,SIGNAL,BARS device wifi list`)
		.split("\n")
		.map((line) => line.split(':', 3))
		.filter(([ssid]) => ssid)
		.map(([ssid, signal, bars]) => {
			let barCount = bars.split("").filter(ch => ch !== "_").length;
			return [ssid, parseInt(signal), barCount] as const
		})

/** I'm not sure if this is right */
const barsToIcon = (bars: number) => {
	switch (bars) {
		case 0:
		case 1:
			return "network-wireless-signal-none-symbolic"
		case 2:
			return "network-wireless-signal-ok-symbolic"
		case 3:
			return "network-wireless-signal-good-symbolic"
		default:
			return "network-wireless-signal-excellent-symbolic"
	}
}

export const WiFi = ({ reset }: { reset: VoidFunction }) => {
	const network = Network.get_default()

	const connections = Variable(getConnections())

	return (
		<>
			<box className="subwindow-title-line" spacing={6}>
				<button className="padding-button" onClicked={() => reset()} label="" />
				<label className="subwindow-title" label="WiFi" />
				<box hexpand />
				<switch
					className="switch"
					active={network.wifi.enabled}
					setup={(self) => {
						self.connect('notify::active', () => {
							network.wifi.enabled = self.active
						});
					}}
				/>
				<button
					onClicked={() => {
						execAsync("nmcli device wifi rescan")
							.then(() => {
								connections.set(getConnections())
							})
					}}
					className="padding-button"
					label="󰑓 "
				/>
			</box>

			<scrollable heightRequest={250}>
				<box orientation={1} hexpand>
					{connections((connections) => {
						return connections
							.sort(([_, signalA], [__, signalB]) => signalA - signalB)
							.reverse()
							.map(([ssid, signal, bars]) => (
								<button
									hexpand
									onClicked={() => {
										execAsync(`nmcli device wifi connect "${ssid}"`).catch(err => console.log(err))
									}}
								>
									<box spacing={6} hexpand>
										<icon
											css="font-size: 22px"
											icon={barsToIcon(bars)}
										/>
										<box vertical hexpand>
											<label label={ssid} className="title" xalign={0} />
											<label label={`${signal}%`} xalign={0} />
										</box>
									</box>
								</button>
							))
					})}
				</box>
			</scrollable>
		</>
	)
}
