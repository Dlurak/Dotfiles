const uptime = Variable("", {
  poll: [10_000, `awk '{printf "%02d:%02d", $1/3600, ($1%3600)/60}' /proc/uptime`],
});

export const PowerSection = () =>
  Widget.Box({
    className: "cc-group",
    child: Widget.Box({
      margin: 8,
      spacing: 8,
      children: [
        Widget.Label({ label: Utils.exec("whoami") }),
        Widget.Box({ hexpand: true }),
        Widget.Label({ label: uptime.bind() }),
        Widget.Button({
          onPrimaryClick: () => {
            App.toggleWindow("power");
            App.closeWindow("controll-center");
          },
          onSecondaryClick: () => {
            Utils.exec("hyprlock");
            App.closeWindow("controll-center");
          },
          child: Widget.Label(""),
        }),
      ],
    }),
  });
