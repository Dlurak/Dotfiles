import { NotificationIcon } from "../../utils.js";

/**
 * @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification}
 *     n
 */
export function Notification(n) {
  const icon = Widget.Box({
    vpack: "start",
    class_name: "icon",
    child: NotificationIcon(n),
  });

  const title = Widget.Label({
    class_name: "title",
    xalign: 0,
    justification: "left",
    hexpand: true,
    max_width_chars: 24,
    truncate: "end",
    wrap: true,
    label: n.summary,
    use_markup: true,
  });

  const body = Widget.Label({
    class_name: "body",
    hexpand: true,
    use_markup: true,
    xalign: 0,
    justification: "left",
    label: n.body,
    wrap: true,
  });

  const actions = Widget.Box({
    class_name: "actions",
    children: n.actions.map(({ id, label }) =>
      Widget.Button({
        class_name: "action-button",
        on_clicked: () => {
          n.invoke(id);
          n.dismiss();
        },
        hexpand: true,
        child: Widget.Label(label),
      }),
    ),
  });

  const remove = Widget.Button({
    vpack: "start",
    onClicked: n.close,
    child: Widget.Label(""),
  });

  return Widget.EventBox({
    attribute: { id: n.id },
    on_primary_click: n.dismiss,
    child: Widget.Box({
      class_name: `notification ${n.urgency}`,
      vertical: true,
      children: [
        Widget.Box([
          icon,
          Widget.Box({ vertical: true, children: [title, body] }),
          remove,
        ]),
        actions,
      ],
    }),
  });
}
