import { bind } from "astal";
import BrightnessAstal from "../../../connectables/brightness"

export const Brightness = () => {
	const brightness = BrightnessAstal.get_default()
	const screen = bind(brightness, "screen")

	return (
		<box hexpand spacing={8} className="slider">
			<box spacing={4}>
				<label className="big-icon">
					󰃠
				</label>
				<label>
					{screen.as(v => `${Math.round(v * 100)}%`)}
				</label>
			</box>
			<slider
				hexpand
				vexpand={false}
				widthRequest={100}
				value={screen}
				onDragged={({ value }) => {
					brightness.screen = value
				}}
			/>
		</box>
	)
}
