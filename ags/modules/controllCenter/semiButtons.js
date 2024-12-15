const powerProfiles = await Service.import("powerprofiles");
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

export const PowerSaving = () =>
  semiButton(
    () => {
      switch (powerProfiles.active_profile) {
        case "power-saver":
          powerProfiles.active_profile = "balanced";
          break;
        case "balanced":
          powerProfiles.active_profile = "performance";
          break;
        case "performance":
          powerProfiles.active_profile = "power-saver";
          break;
      }
    },
    "",
    powerProfiles.bind("active_profile").as(profile => profile[0].toUpperCase() + profile.slice(1)),
    powerProfiles.bind("active_profile").as((profile) => {
      if (profile === "power-saver") {
        return `
		  background: @warning_color;
		  color: black;
		  `;
      }
      return `
		  background: transparent;
		  color: inherit;
		  `;
    }),
  );

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
