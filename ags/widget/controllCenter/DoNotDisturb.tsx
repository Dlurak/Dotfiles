import { bind } from "astal"
import Notifd from "gi://AstalNotifd"

export const DoNotDisturb = () => {
	const notifs = Notifd.get_default()

	return (
		<button
			hexpand
			className="bordered big-button"
			onClick={() => {
				notifs.dontDisturb = !notifs.dontDisturb
			}}
		>
			<box hexpand spacing={6}>
				<label className="big-icon">
					
				</label>
				<box vertical hexpand>
					<label className="title" xalign={0}>Notifications</label>
					<label className="value" xalign={0}>{bind(notifs, "dontDisturb").as(p => p ? "Do not disturb" : "Please disturb")}</label>
				</box>
			</box>
		</button>
	)
}
