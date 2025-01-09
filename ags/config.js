import {
  PowerMenu,
  ControllCenter,
  Bar,
  NotificationPopups,
  MediaWindow,
} from "./windows/index.js";

App.config({
  style: "./style.css",
  windows: [
    Bar({ onIconClick: () => App.ToggleWindow("controll-center") }),
    NotificationPopups(),
    ControllCenter(),
    PowerMenu(),
    MediaWindow(),
  ],
});

export {};
