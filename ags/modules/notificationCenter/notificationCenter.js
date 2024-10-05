import { Notification } from "./notification.js";

const notifications = await Service.import("notifications");

const getChild = () =>
  Widget.Scrollable({
    setup: (self) => {
      self.hook(notifications, (self) => {
        const hasNotifications = notifications.notifications.length > 0;
        self.hscroll = "never";
        if (hasNotifications) {
          self.vscroll = "automatic";
          self.css = "min-height: 400px;";
          self.child = Widget.Box({
            vertical: true,
            children: notifications.notifications.map(Notification),
          });
        } else {
          self.vscroll = "never";
          self.child = Widget.Label({
            margin: 6,
            className: "secondary",
            label: "No notifications",
          });
        }
      });
    },
  });

const NotificationLabel = () =>
  Widget.Label({
    setup: (self) =>
      self.hook(notifications, (self) => {
        const notificationCount = notifications.notifications.length;
        switch (notificationCount) {
          case 0:
            self.label = `No Notifications`;
            break;
          case 1:
            self.label = `1 Notification`;
            break;
          default:
            self.label = `${notificationCount} Notifications`;
        }
      }),
  });

export const NotificationCenter = () => {
  return Widget.Box({
    vertical: true,
    children: [
      Widget.Box({
        hexpand: true,
        children: [
          NotificationLabel(),
          Widget.Box({ hexpand: true }),
          Widget.Button({
            onClicked: () => notifications.clear(),
            child: Widget.Label("Clear"),
          }),
        ],
      }),
      getChild(),
    ],
  });
};
