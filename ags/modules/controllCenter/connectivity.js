const network = await Service.import("network");
const bluetooth = await Service.import("bluetooth");

const wrapper = (onClick, children) =>
  Widget.Button({
    onPrimaryClick: onClick,
    hexpand: true,
    child: Widget.Box({
      children,
      hexpand: true,
      spacing: 8,
    }),
  });

const WifiBox = () =>
  wrapper(
    () => network.toggleWifi(),
    [
      Widget.Icon({
        size: 24,
        setup: (self) => {
          self.hook(network.wifi, () => {
            self.icon = network.wifi.icon_name;
          });
        },
      }),
      Widget.Box({
        spacing: 2,
        children: [
          Widget.Box({
            vertical: true,
            children: [
              Widget.Label({
                hpack: "start",
                label: "Wi-Fi",
              }),
              Widget.Label({
                className: "secondary",
                hpack: "start",
                setup: (self) => {
                  self.hook(network.wifi, () => {
                    self.label = network.wifi.ssid ?? "No Network";
                  });
                },
              }),
            ],
          }),
        ],
      }),
    ],
  );

const BluetoothBox = () =>
  wrapper(
    () => bluetooth.toggle(),
    [
      Widget.Icon({
        size: 24,
        icon: bluetooth
          .bind("enabled")
          .as((on) => `bluetooth-${on ? "active" : "disabled"}-symbolic`),
      }),
      Widget.Box({
        spacing: 2,
        children: [
          Widget.Box({
            vertical: true,
            children: [
              Widget.Label({
                label: "Bluetooth",
                hpack: "start",
              }),
              Widget.Label({
                hpack: "start",
                className: "secondary",
                setup: (self) => {
                  self.hook(bluetooth, () => {
                    const devices = bluetooth["connected_devices"];
                    self.label = `${devices.length} Connections`;
                  });
                },
              }),
            ],
          }),
        ],
      }),
    ],
  );

export const ConnectivityBox = () =>
  Widget.Box({
    vertical: true,
    hexpand: true,
    className: "Connectivity-box cc-row-1 cc-group",
    spacing: 8,
    children: [WifiBox(), BluetoothBox()],
  });
