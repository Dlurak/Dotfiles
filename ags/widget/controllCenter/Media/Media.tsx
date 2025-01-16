import Mpris from "gi://AstalMpris"
import { bind } from "astal"
import { Astal, Gtk } from "astal/gtk3"
import { sortByReference } from "../../../utils/sort"
import { length } from "../../../utils/length"

const Actions = ({ player }: { player: Mpris.Player }) => (
	<centerbox>
		<label
			hexpand
			className="position"
			halign={Gtk.Align.START}
			visible={bind(player, "length").as(l => l > 0)}
			label={bind(player, "position").as((pos) => length("second")(pos))}
		/>
		<box className="actions">
			<button
				onClicked={() => player.previous()}
				visible={bind(player, "canGoPrevious")}
			>
				<icon icon="media-skip-backward-symbolic" />
			</button>
			<button
				onClicked={() => player.play_pause()}
				visible={bind(player, "canControl")}
			>
				<icon
					icon={bind(player, "playbackStatus").as(s =>
						s === Mpris.PlaybackStatus.PLAYING
							? "media-playback-pause-symbolic"
							: "media-playback-start-symbolic"
					)}
				/>
			</button>
			<button
				onClicked={() => player.next()}
				visible={bind(player, "canGoNext")}
			>
				<icon icon="media-skip-forward-symbolic" />
			</button>
		</box>
		<label
			className="length"
			hexpand
			halign={Gtk.Align.END}
			visible={bind(player, "length").as(l => l > 0)}
			label={bind(player, "length").as(l => l > 0 ? length("second")(l) : "0:00")}
		/>
	</centerbox>
)

const MediaPlayer = ({ player }: { player: Mpris.Player }) => {
	const title = bind(player, "title").as(t => t || "Unknown Track")
	const artist = bind(player, "artist").as(a => a || "Unknown Artist")
	const coverArt = bind(player, "coverArt").as(c => `background-image: url('${c}')`)
	const playerIcon = bind(player, "entry").as(e => Astal.Icon.lookup_icon(e) ? e : "audio-x-generic-symbolic")
	const position = bind(player, "position").as(p => player.length > 0 ? p / player.length : 0)

	return (
		<box className="bordered media-player" spacing={6}>
			<box className="media-player-cover" css={coverArt} />
			<box vertical className="media-player-meta">
				<box vertical>
					<box spacing={2}>
						<label truncate hexpand halign={Gtk.Align.START} className="title" label={title} />
						{playerIcon && (
							<icon icon={playerIcon} />
						)}
					</box>
					<label halign={Gtk.Align.START} valign={Gtk.Align.START} vexpand wrap label={artist} />
				</box>
				<box vexpand />

				<box vertical>
					<slider
						visible={bind(player, "length").as(l => l > 0)}
						onDragged={({ value }) => player.position = value * player.length}
						value={position}
					/>
					<Actions player={player} />
				</box>
			</box>
		</box>
	)
}

export const Media = () => {
	const mpris = Mpris.get_default();

	return (
		<box>
			{bind(mpris, "players").as((p) => {
				if (p.length === 0) {
					return <></>
				}

				return (
					<box className="bordered" vertical>
						{sortByReference(p, ["spotify", "mpv"], ({ entry }) => entry)
							.map((player) => <MediaPlayer player={player} />)
						}
					</box>
				)
			})}	
		</box>
	)
}
