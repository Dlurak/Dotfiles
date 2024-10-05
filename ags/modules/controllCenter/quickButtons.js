const spacing = 8;

const QuickButton = ({ label, command }) =>
  Widget.Button({
    child: Widget.Label(label),
    className: "cc-group cc-quick-button",
    onPrimaryClick: () => {
      Utils.execAsync(command).catch(print);
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
            label: "",
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
              "/home/dlurak/Dotfiles/scripts/shell/change-theme.sh",
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
