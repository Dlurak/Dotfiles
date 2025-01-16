import { App, Gdk, Gtk } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widget/bar/Bar"
import { ControllCenter } from "./widget/controllCenter/ControllCenter"
import { NotificationPopup } from "./widget/notifications/NotificationPopup"
import { Power } from "./widget/power/Power"

const multimonitorWidgets = (widget: (monitor: Gdk.Monitor) => Gtk.Widget) => {
	const widgets = new Map<Gdk.Monitor, Gtk.Widget>()
    for (const gdkmonitor of App.get_monitors()) {
        widgets.set(gdkmonitor, widget(gdkmonitor))
    }

    App.connect("monitor-added", (_, gdkmonitor) => {
        widgets.set(gdkmonitor, widget(gdkmonitor))
    })

    App.connect("monitor-removed", (_, gdkmonitor) => {
        widgets.get(gdkmonitor)?.destroy()
        widgets.delete(gdkmonitor)
    });

	return widgets
}

App.start({
    css: style,
    main() {
		ControllCenter();
		Power();
		multimonitorWidgets(Bar);
		multimonitorWidgets(NotificationPopup);
    },
})
