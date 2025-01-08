import { Brightness } from "./Brightness"
import { Sunset } from "./Sunset"
import { Volume } from "./Volume"

export const Sliders = () => {
	return (
		<box spacing={4} className="bordered" vertical>
			<Volume />
			<Brightness />
			<Sunset />
		</box>
	)
}
