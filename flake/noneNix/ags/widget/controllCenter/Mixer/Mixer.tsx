import { bind } from "astal"
import { Astal } from "astal/gtk3"
import Wp from "gi://AstalWp"

type Props = {
	reset: VoidFunction
}

export const Mixer = ({ reset }: Props) => {
	const t = Wp.get_default()?.audio.get_streams() ?? null
	if (!t) {
		return null
	}

	return (
		<box>
			{t.map((stream) => (<StreamVolume stream={stream} />))}
		</box>
	)
}

const StreamVolume = ({ stream }: { stream: Wp.Endpoint }) => {
	const volume = bind(stream, "volume")
    return (
		<box vertical>
			<box spacing={4}>
				<label label={bind(stream, "name")} />	
			</box>
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
						stream.volume = value
					}} />
			</box>
		</box>
    )
}
