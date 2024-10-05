import { shortenString } from "../utils.js";

const PLAY_ICON = "media-playback-start-symbolic";
const PAUSE_ICON = "media-playback-pause-symbolic";
const PREV_ICON = "media-skip-backward-symbolic";
const NEXT_ICON = "media-skip-forward-symbolic";

const mpris = await Service.import("mpris");

export function Media({ onSecondaryClick }) {
  const label = Utils.watch("", mpris, "player-changed", () => {
    if (mpris.players[0]) {
      const { track_artists, track_title } = mpris.players[0];
      return `${track_artists.join(", ")} - ${shortenString(track_title)}`;
    } else {
      return " - ";
    }
  });

  return Widget.Box({
    children: mpris.bind("players").as((p) => {
      if (p.length === 0) {
        return [];
      }
      return [
        Widget.Button({
          on_primary_click: () => mpris.getPlayer("")?.previous(),
          child: Widget.Icon({ icon: PREV_ICON }),
        }),
        Widget.Button({
          class_name: "media",
          on_primary_click: () => mpris.getPlayer("")?.playPause(),
          on_secondary_click: () => {
            if (onSecondaryClick) onSecondaryClick();
          },
          child: Widget.Label({ label }),
        }),
        Widget.Button({
          on_primary_click: () => mpris.getPlayer("")?.next(),
          child: Widget.Icon({ icon: NEXT_ICON }),
        }),
      ];
    }),
  });
}
