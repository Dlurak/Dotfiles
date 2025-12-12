import app from "ags/gtk4/app"
import { Astal } from "ags/gtk4"
import { SideBar } from "./SideBar"
import { createState } from "gnim"
import { Tab } from "./types"
import { General } from "./General"
import { BluetoothView } from "./BluetoothView/BluetoothView"

const MARGIN = 8

export function ControllCenter() {
  const { TOP, LEFT } = Astal.WindowAnchor
  const [selected, setSelected] = createState<Tab>("general");

  return (
    <window
      name="controll-center"
      class="Controll-center"
      exclusivity={Astal.Exclusivity.NORMAL}
      anchor={TOP | LEFT}
      application={app}
	  marginTop={MARGIN}
	  marginLeft={MARGIN}
	  marginRight={0}
	  marginBottom={0}
    >
		<box spacing={3}>
			<SideBar selected={selected} setSelected={setSelected} />
			<stack visibleChildName={selected}>
				<General $type="named" setSelected={setSelected} />
				<BluetoothView $type="named" />
			</stack>
		</box>
    </window>
  )
}
