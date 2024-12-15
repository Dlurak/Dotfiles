import { NotificationCenter } from "../modules/notificationCenter/notificationCenter.js";
import { ConnectivityBox } from "../modules/controllCenter/connectivity.js";
import { MusicSection } from "../modules/controllCenter/musicSection.js";
import { PowerSection } from "../modules/controllCenter/powerSection.js";
import { QuickButtons } from "../modules/controllCenter/quickButtons.js";
import { SliderSection } from "../modules/controllCenter/sliderSection.js";
import { TabBar } from "../modules/controllCenter/tabBar.js";
import { Mixer } from "../modules/mixer/mixer.js";
import {
  DoNotDisturb,
  PowerSaving,
} from "../modules/controllCenter/semiButtons.js";

const WINDOW_NAME = "controll-center";

const close = () => App.closeWindow("controll-center");

function getChildren(focused) {
  return focused.bind("value").as((focused) => {
    switch (focused) {
      case "notifications":
        return [NotificationCenter()];
      case "audio":
        return [Mixer()];
      default:
        return [
          Widget.Box({
            spacing: 6,
            children: [ConnectivityBox(), QuickButtons()],
          }),
          Widget.Box({
            spacing: 6,
            children: [PowerSaving(), DoNotDisturb()],
          }),
          SliderSection(),
          MusicSection(),
          PowerSection(),
        ];
    }
  });
}

export function ControllCenter() {
  const focused = Variable("general");
  return Widget.Window({
    name: WINDOW_NAME,
    class_name: "controll-center",
    visible: false,
    anchor: ["top", "left"],
    margins: [8, 8],
    keymode: "exclusive",
    child: Widget.Box({
      vertical: true,
      margin: 12,
      spacing: 16,
      children: getChildren(focused).as((children) => [
        TabBar({
          General: () => (focused.value = "general"),
          Notifications: () => (focused.value = "notifications"),
          Mixer: () => (focused.value = "audio"),
        }),
        ...children,
      ]),
    }),
  })
    .keybind("Escape", close)
    .keybind("g", () => (focused.value = "general"))
    .keybind("n", () => (focused.value = "notifications"))
    .keybind("m", () => (focused.value = "audio"));
}
