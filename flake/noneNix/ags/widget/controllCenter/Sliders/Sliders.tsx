import { Brightness } from "./Brightness"
import { Volume } from "./Volume"

export const Sliders = () => {
	return (
		<box spacing={4} className="bordered" vertical>
			<Volume />
			<Brightness />
		</box>
	)
}
