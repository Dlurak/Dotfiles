import { getVolumeIcon } from "../utils.js";

const hyprland = await Service.import("hyprland");
const audio = await Service.import("audio");
const battery = await Service.import("battery");

const spacing = 6;

const dispatch = (ws) => hyprland.messageAsync(`dispatch workspace ${ws}`);
export function Workspaces() {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland
    .bind("workspaces")
    .as((ws) => ws.sort(({ id: a }, { id: b }) => a - b));

  return Widget.EventBox({
    class_name: "workspaces",
    onScrollUp: () => dispatch("+1"),
    onScrollDown: () => dispatch("-1"),
    child: Widget.Box({
      children: workspaces.as((ws) =>
        ws.map(({ id }) => {
          const isFocused = activeId.as((i) => i === id);
          const label = isFocused.as((focused) => (focused ? "" : `${id}`));
          return Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label({ label }),
            class_name: isFocused.as(
              (focused) => `${focused ? "focused" : ""}`,
            ),
          });
        }),
      ),
    }),
  });
}

export function Volume() {
  const icon = Widget.Icon({
    icon: Utils.watch(getVolumeIcon(audio), audio.speaker, () =>
      getVolumeIcon(audio),
    ),
  });

  const label = Widget.Label({
    setup: (self) => {
      self.hook(audio.speaker, () => {
        const volume = audio.speaker.volume || 0;
        self.label = `${Math.round(volume * 100)}%`;
      });
    },
  });

  const slider = Widget.Slider({
    hexpand: true,
    draw_value: false,
    on_change: ({ value }) => (audio.speaker.volume = value),
    setup: (self) =>
      self.hook(audio.speaker, () => {
        self.value = audio.speaker.volume || 0;
      }),
  });

  return Widget.Button({
    cursor: "pointer",
    on_primary_click: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
    on_scroll_up: () => (audio.speaker.volume += 0.01),
    on_scroll_down: () => (audio.speaker.volume -= 0.01),
    child: Widget.Box({
      class_name: "volume",
      css: "min-width: 180px",
      spacing,
      children: [icon, label, slider],
    }),
  });
}

export function BatteryLabel() {
  const value = battery.bind("percent").as((p) => (p > 0 ? p / 100 : 0));
  const icon = battery
    .bind("percent")
    .as((p) => `battery-level-${Math.floor(p / 10) * 10}-symbolic`);
  const state = battery.bind("percent").as((p) => {
    if (p <= 20) {
      return "red";
    }
    return "green";
  });

  return Widget.Box({
    spacing,
    class_name: state,
    visible: battery.bind("available"),
    children: [
      Widget.Icon({ icon }),
      Widget.Label({
        label: battery.bind("percent").as((p) => `${p}%`),
      }),
      Widget.LevelBar({
        widthRequest: 140,
        vpack: "center",
        value,
      }),
    ],
  });
}

const date = Variable("", {
  poll: [1000, 'date "+%H:%M"'],
});

export function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
}

export { Media } from "./media.js";
