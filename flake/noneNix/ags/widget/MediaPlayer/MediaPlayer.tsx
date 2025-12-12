import Mpris from "gi://AstalMpris";
import { MAIN_BUTTON_SIZE, SPACING } from "../ControllCenter/consts";
import { createBinding, With } from "gnim";
import { getAppInfo } from "../../utils/apps";
import { Gtk } from "ags/gtk4";
import Gio from "gi://Gio?version=2.0";
import Adw from "gi://Adw?version=1";
import Pango from "gi://Pango?version=1.0";
import { formatMusicTime } from "../../utils/time";

const SHADOW = "0 0 3px rgba(0,0,0,0.8), 0 0 6px rgba(0,0,0,0.6)"
const HEIGHT = Math.round(MAIN_BUTTON_SIZE * 4/5);
const PADDING = 10;

const shorten = (trheshold = 20) => (str: string) => str.length < trheshold
	? str
	: str.slice(0, trheshold - 3) + "...";

type PlayerProps = {
	player: Mpris.Player
}

type Props = {
	player: Mpris.Player
}

const Art = ({ player }: PlayerProps) => {
	const coverArt = createBinding(player, "coverArt")(c => Gio.file_new_for_path(c))
	return (
		<Adw.Clamp
			$type="overlay"
			css="border-radius: 6px;"
			overflow={Gtk.Overflow.HIDDEN}
		>
			<Gtk.Picture
				css="filter: blur(3px); transform: scale(1.1);"
				file={coverArt}
				contentFit={Gtk.ContentFit.COVER}
			/>
		</Adw.Clamp>
	);
}

const AppLabel = ({ player }: PlayerProps) => (
	<box
		spacing={5}
		css={`
			background: #1A1B26;
			border-radius: 6px;
			padding: 8px;
		`}
		valign={Gtk.Align.START}
	>
		<image
			iconName={createBinding(player, "entry")(getAppInfo)((a) => a?.iconName || "")}
			pixelSize={22}
		/>
		<label label={createBinding(player, "identity")(app => {
			switch (app) {
				case "Mozilla firefox":
					return "Feuerfuchs"
				default:
					return shorten(20)(app)
			}
		})} />
	</box>
)

const Title = ({ player }: PlayerProps) => (
	<box
		$type="start"
		orientation={Gtk.Orientation.VERTICAL}
	>
		<label
			wrap
			wrapMode={Pango.WrapMode.WORD_CHAR}
			maxWidthChars={22}
			label={createBinding(player, "title")(shorten(30))}
			halign={Gtk.Align.START}
			css={`
				font-size: 1.4rem;
				font-weight: 800;
				color: white;
				text-shadow: ${SHADOW};
			`}
		/>
		<label
			wrap
			wrapMode={Pango.WrapMode.WORD_CHAR}
			maxWidthChars={40}
			label={createBinding(player, "artist")(shorten(35))}
			halign={Gtk.Align.START}
			css={`
				font-size: 1.1rem;
				font-weight: 600;
				color: white;
				text-shadow: ${SHADOW};
			`}
		/>
	</box>
)

function Content({ player }: PlayerProps) {
	return (
		<box
			$type="overlay"
			class="player"
			vexpand
			hexpand
			orientation={Gtk.Orientation.VERTICAL}
			css={`padding: ${PADDING}px;`}
		>
			<box
				heightRequest={HEIGHT * 2/3 - PADDING}
				spacing={7}
			>
				<Title player={player} />
				<box hexpand />
				<AppLabel player={player} />
			</box>

			<centerbox
				hexpand
				heightRequest={HEIGHT * 1/3 - PADDING}
				valign={Gtk.Align.END}
			>
				<With  value={createBinding(player, "position")}>
					{(pos: number) => pos !== -1 && (
						<label
							valign={Gtk.Align.END}
							label={createBinding(player, "length")(length => 
								formatMusicTime(pos) + "/" + formatMusicTime(length)
							)}
							$type="start"
							css={`
								font-size: 1.1rem;
								font-weight: 600;
								color: white;
								text-shadow: ${SHADOW};
							`}
						/>
					)}
				</With>

				<box
					spacing={3}
					$type="end"
					class="controlls"
					valign={Gtk.Align.END}
				>
					<button
						visible={createBinding(player, "canGoPrevious")}
						onClicked={() => player.previous()}
					>
						<image iconName="media-skip-backward-symbolic"/>
					</button>
					<button
						visible={createBinding(player, "can_control")}
						onClicked={() => player.play_pause()}
					>
						<image
							iconName={
								createBinding(player, "playbackStatus")((st) => st == Mpris.PlaybackStatus.PLAYING 
									? "media-playback-pause-symbolic"
									: "media-playback-start-symbolic"
								)
							}
						/>
					</button>
					<button
						visible={createBinding(player, "canGoNext")}
						onClicked={() => player.next()}
					>
						<image iconName="media-skip-forward-symbolic" />
					</button>
				</box>
			</centerbox>
		</box>
	);
}

export function MediaPlayer({ player }: Props) {
	return (
		<overlay
			heightRequest={HEIGHT}
			widthRequest={MAIN_BUTTON_SIZE * 2 + SPACING}
		>
			<Art player={player} $type="overlay" />
			<Content player={player} $type="overlay" />
		</overlay>
	)
}
