const Button = (icon, label, callback) =>
  Widget.Button({
    className: "power-button",
    onClicked: () => {
      App.closeWindow("power");
      callback();
    },
    child: Widget.Box({
      vertical: true,
      vexpand: true,
      hexpand: true,
      children: [
        Widget.Box({ vexpand: true }),
        Widget.Label({
          vpack: "center",
          hpack: "center",
          label: icon,
          className: "power-icon",
        }),
        Widget.Box({ vexpand: true }),
        Widget.Label({ label, hpack: "center", vpack: "center", margin: 4 }),
      ],
    }),
  });

export const PowerButton = () =>
  Button("", "Shutdown", () => Utils.exec("shutdown 0"));
export const LockButton = () =>
  Button("", "Lock", () => Utils.exec("hyprlock"));
export const SuspendButton = () =>
  Button("", "Suspend", () => Utils.exec("systemctl suspend"));
export const RebootButton = () =>
  Button("", "Reboot", () => Utils.exec("reboot"));
