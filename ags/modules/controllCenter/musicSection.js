import { shortenString } from "../../utils.js";

const mpris = await Service.import("mpris");
const players = mpris.bind("players");
const hasMultiplePlayers = players.as((p) => p.length > 1);

const PLAY_ICON = "media-playback-start-symbolic";
const PAUSE_ICON = "media-playback-pause-symbolic";
const PREV_ICON = "media-skip-backward-symbolic";
const NEXT_ICON = "media-skip-forward-symbolic";

function lengthStr(length) {
  const min = Math.floor(length / 60);
  const sec = Math.floor(length % 60);
  const sec0 = sec < 10 ? "0" : "";
  return `${min}:${sec0}${sec}`;
}

function Player(player) {
  return Widget.Box({
    hexpand: true,
    margin: hasMultiplePlayers.as((p) => (p ? 6 : 0)),
    className: "cc-group",
    child: Widget.Box({
      spacing: 12,
      marginRight: 5,
      marginLeft: 5,
      marginTop: 2,
      marginBottom: 2,
      children: [
        Widget.Box({
          class_name: "img",
          vpack: "center",
          css: player
            .bind("cover_path")
            .transform((p) => `background-image: url('${p}');`),
        }),
        Widget.Box({
          vertical: true,
          children: [
            Widget.Label({
              hpack: "start",
              label: player.bind("track_title").as(shortenString),
            }),
            Widget.Label({
              hpack: "start",
              className: "secondary",
              label: player.bind("track_artists").as((a) => a.join(", ")),
            }),
            Widget.Box({ vexpand: true }),
            Widget.Slider({
              draw_value: false,
              hexpand: true,
              on_change: ({ value }) =>
                (player.position = value * player.length),
              visible: player.bind("length").as((l) => l > 0),
              setup: (self) => {
                function update() {
                  const value = player.position / player.length;
                  self.value = value > 0 ? value : 0;
                }
                self.hook(player, update);
                self.hook(player, update, "position");
                self.poll(1000, update);
              },
            }),
            Widget.CenterBox({
              start_widget: Widget.Box({
                children: [
                  Widget.Label({
                    class_name: "secondary",
                    hpack: "start",
                    setup: (self) => {
                      const update = (_, time) => {
                        self.label = lengthStr(time || player.position);
                        self.visible = player.length > 0;
                      };

                      self.hook(player, update, "position");
                      self.poll(1000, update);
                    },
                  }),
                ],
              }),
              center_widget: Widget.Box({
                children: [
                  Widget.Button({
                    className: "player-control",
                    on_clicked: () => player.previous(),
                    visible: player.bind("can_go_prev"),
                    child: Widget.Icon(PREV_ICON),
                  }),
                  Widget.Button({
                    className: "player-control",
                    on_clicked: () => player.playPause(),
                    visible: player.bind("can_play"),
                    child: Widget.Icon({
                      icon: player.bind("play_back_status").transform((s) => {
                        switch (s) {
                          case "Playing":
                            return PAUSE_ICON;
                          case "Paused":
                          case "Stopped":
                            return PLAY_ICON;
                        }
                      }),
                    }),
                  }),
                  Widget.Button({
                    className: "player-control",
                    on_clicked: () => player.next(),
                    visible: player.bind("can_go_next"),
                    child: Widget.Icon(NEXT_ICON),
                  }),
                ],
              }),
              end_widget: Widget.Box({
                hexpand: true,
                hpack: "end",
                visible: player.bind("length").transform((l) => l > 0),
                children: [
                  Widget.Label({
                    class_name: "secondary",
                    label: player.bind("length").transform(lengthStr),
                  }),
                ],
              }),
            }),
          ],
        }),
      ],
    }),
  });
}

export const MusicSection = () => {
  return Widget.Box({
    className: hasMultiplePlayers.as((mp) => (mp ? "cc-group" : "")),
    visible: players.as((p) => p.length >= 1),
    vertical: true,
    spacing: 2,
    children: players.as((p) => p.map(Player)),
  });
};
