const spacing = 8;

const isRecording = Variable(false);

const QuickButton = ({
  label,
  command,
  callback = () => {},
  errorCallback = () => {},
  isRecordingButton = false,
}) =>
  Widget.Button({
    child: Widget.Label(label),
    className: isRecording.bind("value").as((records) => {
      const base = "cc-group cc-quick-button";
      if (!isRecordingButton) return base;

      return `${base} recording${records ? " active" : ""}`;
    }),
    onPrimaryClick: () => {
      callback();
      Utils.execAsync(command).catch(errorCallback);
      App.closeWindow("controll-center");
    },
  });

export const QuickButtons = () =>
  Widget.Box({
    spacing,
    vertical: true,
    className: "cc-row-1",
    children: [
      Widget.Box({
        spacing,
        children: [
          QuickButton({
            label: "󰹑",
            command: ["bash", "-c", 'grim -g "$(slurp)" - | wl-copy'],
          }),
          QuickButton({
            isRecordingButton: true,
            label: "",
            callback: () => (isRecording.value = !isRecording.value),
            errorCallback: () => {
              isRecording.value = false;
            },
            command: [
              "bash",
              "-c",
              'pkill -x wf-recorder || wf-recorder -g "$(slurp)" -f ~/Pictures/screenrecordings/$(date +"%y.%m.%d-%H:%M").mp4',
            ],
          }),
        ],
      }),
      Widget.Box({
        spacing,
        children: [
          QuickButton({
            label: "󰔎",
            command: [
              "bash",
              "-c",
              "hyprpicker | wl-copy",
            ],
          }),
          QuickButton({
            label: "",
            command: ["bash", "-c", "hyprpicker | wl-copy"],
          }),
        ],
      }),
    ],
  });
