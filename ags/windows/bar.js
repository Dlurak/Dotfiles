import {
  BatteryLabel,
  Volume,
  Workspaces,
  Clock,
  Media,
} from "../modules/index.js";
import { gotoWorkspace } from "../utils.js";

const spacing = 8;
const margin = 8;

export function Bar({ onIconClick = () => {}, monitor = 0 }) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    margins: [margin, margin, 0, margin],
    child: Widget.CenterBox({
      marginRight: 16,
      start_widget: Widget.Box({
        spacing,
        children: [
          Widget.Button({
            className: "system-button",
            onPrimaryClick: onIconClick,
            child: Widget.Label(" "),
          }),
          Workspaces(),
        ],
      }),
      center_widget: Widget.Box({
        spacing,
        children: [Media()],
      }),
      end_widget: Widget.Box({
        spacing,
        hpack: "end",
        children: [Volume(), BatteryLabel(), Clock()],
      }),
    }),
  });
}
