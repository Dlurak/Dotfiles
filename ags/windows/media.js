import { MusicSection } from "../modules/controllCenter/musicSection.js";

const margin = 8;

export const MediaWindow = () =>
  Widget.Window({
    name: "media-window",
    className: "media-window",
    anchor: ["top"],
    visible: false,
    margins: [margin, margin, margin, margin],
    child: Widget.Box({
      margin: 8,
		css: "min-width: 400px",
      children: [MusicSection()],
    }),
  });
