import { execAsync, exec, Variable } from "astal"

const getConnections = () => 
	exec("nmcli -t -f NAME,TYPE connection show")
		.split("\n")
		.map((line) => line.split(':', 2))
		.filter(([_, type]) => type === "802-11-wireless")
		.map(([name]) => name)

export const WiFi = ({ reset }: { reset: VoidFunction }) => {
	const connections = Variable(getConnections())

	return (
		<>
			<box className="subwindow-title-line" spacing={6}>
				<button onClick={() => reset()}></button>
				<label className="subwindow-title">WiFi</label>
				<box hexpand />
				<button onClick={() => connections.set(getConnections())}>
					󰑓
				</button>
			</box>

			<scrollable heightRequest={250}>
				<box orientation={1} hexpand>
					{connections((cons) => cons.map((connectionName) => (
						<box hexpand>
							<button
								hexpand
								onClick={() => execAsync(`nmcli connection up ${connectionName}`)}
							>
								<label label={connectionName} className="title" xalign={0} />
							</button>
						</box>
					)))}
				</box>
			</scrollable>
		</>
	)
}
