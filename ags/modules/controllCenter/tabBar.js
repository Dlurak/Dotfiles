/** @param tabs {Record<string, () => void>} */
export const TabBar = (tabs) => {
  return Widget.Box({
    className: "cc-group tabs",
    children: Object.entries(tabs).map(([label, callback]) =>
      Widget.Button({
        hexpand: true,
        onClicked: callback,
        child: Widget.Label(label),
      }),
    ),
  });
};
