const date = Variable("", {
  poll: [1000, 'date "+%H:%M:%S"'],
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
        Widget.Label({ label: date.bind() }),
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
