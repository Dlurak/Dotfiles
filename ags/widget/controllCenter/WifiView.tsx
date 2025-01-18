import { execAsync, exec, Variable } from "astal"
import { sortByReference } from "../../utils/sort"

const getConnections = (active = false) => 
	exec(`nmcli -t -f NAME,TYPE connection show ${active ? "--active" : ""}`)
		.split("\n")
		.map((line) => line.split(':', 2))
		.filter(([_, type]) => type === "802-11-wireless")
		.map(([name]) => name)

export const WiFi = ({ reset }: { reset: VoidFunction }) => {
	const connections = Variable(getConnections())
	const activeConnection = Variable(getConnections(true)[0])
	const total = Variable.derive([connections, activeConnection]);

	return (
		<>
			<box className="subwindow-title-line" spacing={6}>
				<button onClick={() => reset()}></button>
				<label className="subwindow-title">WiFi</label>
				<box hexpand />
				<button onClick={() => {
                    activeConnection.set(getConnections(true)[0])
                    connections.set(getConnections())
                }}>
					󰑓
				</button>
			</box>

			<scrollable heightRequest={250}>
				<box orientation={1} hexpand>
					{total(([connections, activeConnection]) => {
						return sortByReference(connections, [activeConnection], (x) => x).reverse().map((connectionName, i) => (
							<box hexpand>
								<button
									hexpand
									onClick={() => execAsync(`nmcli connection up ${connectionName}`)}
								>
									<box>
										{connectionName === activeConnection && <label label=" " />}
										<label label={connectionName} className="title" xalign={0} />
									</box>
								</button>
							</box>
						))
					})}
				</box>
			</scrollable>
		</>
	)
}
