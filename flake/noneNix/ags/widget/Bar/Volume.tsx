import Wp from "gi://AstalWp"
import { createBinding } from "gnim"
import { attachHoverScroll } from "../../utils/scroll"

const CHANGE_SPEED = 0.01;

export function Volume() {
	const wp = Wp.get_default()
	const defaultSpeaker = wp.audio.default_speaker

	return (
		<menubutton>
			<box
				spacing={6}
				$={(self) => {
					attachHoverScroll(self, ({ dy }) => {
						defaultSpeaker.volume -= CHANGE_SPEED * dy;
					})
				}}
			>
				<image iconName={createBinding(defaultSpeaker, "volumeIcon")} />
				<label label={createBinding(defaultSpeaker, "volume")(volume => `${Math.round(volume * 100)}%`)} />
			</box>
			<popover>
				<box>
					<slider
						widthRequest={260}
						onChangeValue={({ value }) => defaultSpeaker.set_volume(value)}
						value={createBinding(defaultSpeaker, "volume")}
					/>
				</box>
			</popover>
		</menubutton>
	)
}
