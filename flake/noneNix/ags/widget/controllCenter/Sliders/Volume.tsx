import { bind } from "astal";
import Wp from "gi://AstalWp"

export const Volume = () => {
	const speaker = Wp.get_default()?.audio.defaultSpeaker!;
	const volume = bind(speaker, "volume")

	return (
		<box hexpand spacing={8} className="slider">
			<box spacing={4}>
				<label className="big-icon">
					󰖀
				</label>
				<label>
					{volume.as(v => `${Math.round(v * 100)}%`)}
				</label>
			</box>
			<slider
				hexpand
				vexpand={false}
				widthRequest={100}
				value={volume}
				onDragged={({ value }) => {
					speaker.volume = value
				}}
			/>
		</box>
	)
}
