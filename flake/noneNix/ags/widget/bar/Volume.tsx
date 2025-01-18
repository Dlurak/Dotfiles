import { bind } from "astal";
import Wp from "gi://AstalWp"

export const Volume = () => {
	const speaker = Wp.get_default()?.audio.defaultSpeaker!;
	const volume = bind(speaker, "volume")

	return (
		<eventbox
			onScroll={(_, e) => {
				speaker.volume += e.delta_y < 0 ? 0.01 : -0.01
			}}
			onClick={() => {
				speaker.mute = !speaker.mute
			}}
		>
			<box spacing={6}>
				<icon icon={bind(speaker, "volumeIcon")} />
				<label>
					{volume.as(v => `${Math.round(v * 100)}%`)}
				</label>
				<slider
					vexpand={false}
					hexpand={false}
					widthRequest={100}
					value={volume}
				/>
			</box>
		</eventbox>
	);
}
