const audio = await Service.import("audio");

const AppVolume = (stream) =>
  Widget.EventBox({
    margin: 6,
    onScrollUp: () => {
      stream.volume += 0.01;
    },
    onScrollDown: () => {
      stream.volume -= 0.01;
    },
    child: Widget.Box({
      spacing: 6,
      children: [
        Widget.Icon({ icon: stream.iconName }),
        Widget.Label(stream.name),
        Widget.Slider({
          draw_value: false,
          hexpand: true,
          on_change: ({ value }) => {
            stream.volume = value;
          },
          setup: (self) =>
            self.hook(stream, (self) => (self.value = stream.volume)),
        }),
      ],
    }),
  });

export const Mixer = () =>
  Widget.Box({
    vertical: true,
    className: "cc-group",
    setup: (self) =>
      self.hook(audio, (self) => {
        self.children = audio.apps.map(AppVolume);
      }),
  });
