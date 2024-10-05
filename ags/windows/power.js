import {
  PowerButton,
  LockButton,
  SuspendButton,
  RebootButton,
} from "../modules/power/button.js";

const WINDOW_NAME = "power";

const close = () => App.closeWindow(WINDOW_NAME);

export const PowerMenu = () => {
  return Widget.Window({
    name: WINDOW_NAME,
    className: "power-window",
    exclusivity: "ignore",
    visible: false,
    anchor: ["top", "bottom", "left", "right"],
    keymode: "exclusive",
    child: Widget.Box({
      vpack: "center",
      hpack: "center",
      child: Widget.Box({
        className: "power-button-wrapper",
        child: Widget.Box({
          margin: 12,
          spacing: 6,
          children: [
            PowerButton(),
            LockButton(),
            SuspendButton(),
            RebootButton(),
          ],
        }),
      }),
    }),
  }).keybind("Escape", close);
};
