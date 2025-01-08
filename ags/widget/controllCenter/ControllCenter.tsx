import { App, Astal, Gdk } from "astal/gtk3"
import { PowerLine } from "./PowerLine"
import { Connectivity } from "./Connectivity"
import { QuickButtons } from "./QuickButtons"
import { PowerProfiles } from "./PowerProfiles"
import { Sliders } from "./Sliders/Sliders"
import { Media } from "./Media/Media"
import { DoNotDisturb } from "./DoNotDisturb"
import { Variable } from "astal"
import { WiFi } from "./WifiView"
import { Bluetooth } from "./BluetoothView"

type View = "controlls" | "wifi" | "bluetooth"

const Controlls = ({ setCurrentView }: { setCurrentView: (view: View) => void }) => (
	<>
		<box spacing={8} className="equal-wrapper">
			<Connectivity
				onWifiPrimary={() => setCurrentView("wifi")}
				onBluetoothPrimary={() => setCurrentView("bluetooth")}
			/>
			<QuickButtons />
		</box>
		<box spacing={8} className="equal-wrapper">
			<PowerProfiles />
			<DoNotDisturb />
		</box>
		<Sliders />
		{/*
		<Media />
			*/}
		<PowerLine />
	</>
)

export const ControllCenter = () => {
    const { TOP, LEFT  } = Astal.WindowAnchor

	const currentView = Variable<View>("controlls");

    return (
		<window
			name="controll-center"
			className="controll-center"
			exclusivity={Astal.Exclusivity.NORMAL}
			anchor={TOP | LEFT  }
			application={App}
			margin-top={8}
			margin-left={8}
			setup={self => App.add_window(self)}
			visible={false}
			keymode={Astal.Keymode.EXCLUSIVE}
			onKeyPressEvent={(self, event: Gdk.Event) => {
				if (event.get_keyval()[1] === Gdk.KEY_Escape) {
					self.hide()
				}
			}}
		>
			<box className="controll-center-wrapper" vertical spacing={8}>
				{currentView((view) => {
					switch (view) {
						case "controlls":
							return <Controlls setCurrentView={(view) => currentView.set(view)} />
						case "wifi":
							return <WiFi reset={() => currentView.set("controlls")} />
						case "bluetooth":
							return <Bluetooth reset={() => currentView.set("controlls")} />
					}
				})}
			</box>
		</window>
	)
}
