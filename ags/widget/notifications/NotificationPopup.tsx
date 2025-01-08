import { Astal, Gtk, Gdk } from "astal/gtk3"
import Notifd from "gi://AstalNotifd"
import { Subscribable } from "astal/binding"
import { Variable, bind } from "astal"
import { Notification } from "./Notification"

class NotifiationMap implements Subscribable {
    private map: Map<number, Gtk.Widget | null> = new Map()

    private var: Variable<Gtk.Widget[]> = Variable([])

    private notifiy() {
        this.var.set([...this.map.values()].filter((n): n is Gtk.Widget => !!n).reverse())
    }

    constructor() {
        const notifd = Notifd.get_default()

        /**
         * uncomment this if you want to
         * ignore timeout by senders and enforce our own timeout
         * note that if the notification has any actions
         * they might not work, since the sender already treats them as resolved
         */
        // notifd.ignoreTimeout = true

        notifd.connect("notified", (_, id) => {
            this.set(id, Notification({
                notification: notifd.get_notification(id)!,
                onHoverLost: () => this.delete(id),
                setup: () => {}
            }))
        })

        // notifications can be closed by the outside before
        // any user input, which have to be handled too
        notifd.connect("resolved", (_, id) => {
            this.delete(id)
        })
    }

    private set(key: number, value: Gtk.Widget | null) {
        this.map.get(key)?.destroy()
        this.map.set(key, value)
        this.notifiy()
    }

    private delete(key: number) {
        this.map.get(key)?.destroy()
        this.map.delete(key)
        this.notifiy()
    }

    get() {
        return this.var.get()
    }

    subscribe(callback: (list: Array<Gtk.Widget>) => void) {
        return this.var.subscribe(callback)
    }
}

export const NotificationPopup = (monitor: Gdk.Monitor) => {
	const { TOP, RIGHT } = Astal.WindowAnchor
	const notifs = new NotifiationMap()

	return (
		<window
			className="notifications-popup"
			gdkmonitor={monitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={TOP | RIGHT}
		>
			<box vertical>
				{bind(notifs)}
			</box>
		</window>
	)
}
