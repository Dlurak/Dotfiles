import { Gtk } from "ags/gtk4";
import { SPACING } from "./consts";
import { Network } from "./Network";
import { QuickButtons } from "./QuickButtons";
import { PowerProfilesButton } from "./PowerProfiles";
import Adw from "gi://Adw?version=1";
import { createBinding, createState, For, Setter, With } from "gnim";
import AstalMpris from "gi://AstalMpris?version=0.1";
import { MediaPlayer } from "../MediaPlayer/MediaPlayer";
import { BottomLine } from "./BottomLine";
import { DndButton } from "./Dnd";
import { Tab } from "./types";
import { Slider } from "./Slider";

export function General({ setSelected }: { setSelected: Setter<Tab> }) {
	const mpris = AstalMpris.get_default()
	const players = createBinding(mpris, "players");

	const [carousel, setCarousel] = createState<Adw.Carousel | undefined>(undefined)

	return (
		<box
			$type="named"
			class="general"
			name="general"
			spacing={SPACING}
			orientation={Gtk.Orientation.VERTICAL}
		>
			<box spacing={SPACING}>
				<Network setSelected={setSelected} />
				<QuickButtons />
			</box>
			<box spacing={SPACING}>
				<PowerProfilesButton />
				<DndButton />
			</box>
			<Slider />
			<box
				visible={players(pl => pl.length > 0)}
				spacing={SPACING / 2}
				orientation={Gtk.Orientation.VERTICAL}
			>
				<Adw.Carousel
					spacing={SPACING}
					$={(self) => setCarousel(self)}
				>
					<For each={players}>
						{(player: AstalMpris.Player) => <MediaPlayer player={player} />}
					</For>
				</Adw.Carousel>
				<With value={carousel}>
					{(carousel: Adw.Carousel | undefined) => carousel && (
						<Adw.CarouselIndicatorLines
							visible={players(pl => pl.length >= 2)}
							carousel={carousel}
						/>
					)}
				</With>
			</box>
			<BottomLine />
		</box>
	);

}
