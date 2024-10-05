import brightness from "../../services/brightness.js";

const audio = await Service.import("audio");

const volumeSlider = () => {
  return Widget.EventBox({
    on_scroll_up: () => (audio.speaker.volume += 0.01),
    on_scroll_down: () => (audio.speaker.volume -= 0.01),
    child: Widget.Box({
      children: [
        Widget.Button({
          cursor: "pointer",
          on_primary_click: () => {
            audio.speaker.is_muted = !audio.speaker.is_muted;
          },
          child: Widget.Box({
            spacing: 6,
            children: [
              Widget.Label({
                marginRight: 9,
                marginLeft: 9,
                // TODO: dynamic label  + sync with bar
                label: "󰕾",
              }),
              Widget.Label({
                setup: (self) => {
                  self.hook(audio.speaker, () => {
                    const volume = audio.speaker.volume || 0;
                    self.label = `${Math.round(volume * 100)}%`;
                  });
                },
              }),
            ],
          }),
        }),
        Widget.Slider({
          hexpand: true,
          draw_value: false,
          on_change: ({ value }) => (audio.speaker.volume = value),
          setup: (self) => {
            self.hook(audio.speaker, () => {
              self.value = audio.speaker.volume || 0;
            });
          },
        }),
      ],
    }),
  });
};

const brightnessSlider = () =>
  Widget.Box({
    children: [
      Widget.Box({
        spacing: 6,
        marginRight: 9,
        marginLeft: 9,
        children: [
          Widget.Label({
            marginRight: 9,
            marginLeft: 9,
            label: "󰃞",
          }),
          Widget.Label({
            label: brightness
              .bind("screen_value")
              .as((v) => `${Math.round(v * 100)}%`),
          }),
        ],
      }),
      Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => (brightness.screen_value = value),
        value: brightness.bind("screen_value"),
      }),
    ],
  });

export const SliderSection = () =>
  Widget.Box({
    className: "cc-group",
    vertical: true,
    children: [volumeSlider(), brightnessSlider()],
  });
