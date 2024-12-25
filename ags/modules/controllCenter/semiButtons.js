//const powerProfiles = await Service.import("powerprofiles");
const notifications = await Service.import("notifications");

const semiButton = (callback, icon, secondaryLabel, css) =>
  Widget.Button({
    className: "cc-group semi-button",
    onClicked: callback,
    child: Widget.Box({
      spacing: 12,
      margin: 8,
      children: [
        Widget.Label({
          className: "semi-button-icon",
          css,
          label: `${icon} `,
        }),
		Widget.Label({
		  hpack: "start",
		  className: "secondary",
		  label: secondaryLabel,
		}),
      ],
    }),
  });


export const DoNotDisturb = () =>
  semiButton(
    () => {
      notifications.dnd = !notifications.dnd;
    },
    "",
    notifications
      .bind("dnd")
      .as((dnd) => (dnd ? "Do Not Disturb" : "Please Disturb")),
    notifications
      .bind("dnd")
      .as((dnd) => (dnd ? "background: #b4befe;" : "background: transparent;")),
  );

export const PowerSaving = DoNotDisturb
