import Mpris from "gi://AstalMpris"
import { bind } from "astal"
import { shorten } from "../../utils/strings";

const PREV_ICON = "media-skip-backward-symbolic";
const NEXT_ICON = "media-skip-forward-symbolic";

function MediaInner(p: Mpris.Player) {
	return (
		<>
			<button onClicked={() => p.previous()}>
				<icon icon={PREV_ICON} />
			</button>
			<button onClicked={() => p.play_pause()} className="media-title">
				{bind(p, "title").as((title) => shorten(title, 20))}
			</button>
			<button onClicked={() => p.next()}>
				<icon icon={NEXT_ICON} />
			</button>
		</>
	)
}

export function Media() {
	const mpris = Mpris.get_default();
	const players = bind(mpris, "players");

	return (
		<box spacing={8}>
			{players.as((players) => {
				const player = players.find((p) => p.entry === "Spotify") ?? players.at(-1)
				return player ? MediaInner(player) : <></>;
            })}
		</box>
	)
}
