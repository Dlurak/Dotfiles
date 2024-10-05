export async function gotoWorkspace(id) {
  const hyprland = await Service.import("hyprland");
  return hyprland.messageAsync(`dispatch workspace ${id}`);
}

export function shortenString(string) {
  if (string.length < 20) return string;
  return string.slice(0, 18) + "...";
}

export function getVolumeIcon(audio) {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };
  const icon = audio.speaker.is_muted
    ? 0
    : [101, 67, 34, 1, 0].find(
        (threshold) => threshold <= audio.speaker.volume * 100,
      );

  return `audio-volume-${icons[icon]}-symbolic`;
}

export const clamp = (min, pref, max) => {
	if (pref < min) return min
	if (pref > max) return max
	return pref
}

/** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
export function NotificationIcon({ app_entry, app_icon, image }) {
  if (image) {
    return Widget.Box({
      css:
        `background-image: url("${image}");` +
        "background-size: contain;" +
        "background-repeat: no-repeat;" +
        "background-position: center;",
    });
  }

  let icon = "dialog-information-symbolic";
  if (Utils.lookUpIcon(app_icon)) icon = app_icon;

  if (app_entry && Utils.lookUpIcon(app_entry)) icon = app_entry;

  return Widget.Box({
    child: Widget.Icon(icon),
  });
}
