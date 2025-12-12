import Wp from "gi://AstalWp"
import { createBinding } from "gnim"
import { attachHoverScroll } from "../../utils/scroll"
import { Gtk } from "ags/gtk4";
import { SPACING } from "./consts";
import Brightness from "../../gobject/brightness";

const VOLUME_CHANGE_SPEED = 0.01;

const perc = (perc: number) => {
	return `${Math.round(perc * 100)}%`.padStart(4, ' ');
}

export function Slider() {
	const wp = Wp.get_default()
	const defaultSpeaker = wp.audio.default_speaker

	const brightness = Brightness.get_default();

	return (
		<box
			class="bordered"
			css="padding: 4px 10px;"
			hexpand
			vexpand
			orientation={Gtk.Orientation.VERTICAL}
			spacing={SPACING}
		>
			<box spacing={SPACING}>
				<box
					spacing={6}
					$={(self) => {
						attachHoverScroll(self, ({ dy }) => {
							defaultSpeaker.volume -= VOLUME_CHANGE_SPEED * dy;
						})
					}}
				>
					<image iconName={createBinding(defaultSpeaker, "volumeIcon")} />
					<label label={createBinding(defaultSpeaker, "volume")(perc)} />
				</box>
				<slider
					hexpand
					onChangeValue={({ value }) => defaultSpeaker.set_volume(value)}
					value={createBinding(defaultSpeaker, "volume")}
				/>
			</box>
			{/* Kinda Buggy */}
			{/* <box spacing={SPACING}> */}
			{/* 	<box */}
			{/* 		spacing={6} */}
			{/* 		$={(self) => { */}
			{/* 			attachHoverScroll(self, ({ dy }) => { */}
			{/* 				brightness.screen -= 1/brightness.screenMax * VOLUME_CHANGE_SPEED * dy; */}
			{/* 			}) */}
			{/* 		}} */}
			{/* 	> */}
			{/* 		<image iconName={createBinding(defaultSpeaker, "volumeIcon")} /> */}
			{/* 		<label label={createBinding(brightness, "screen")(screen => perc(screen/brightness.screenMax))} /> */}
			{/* 	</box> */}
			{/* 	<slider */}
			{/* 		hexpand */}
			{/* 		onChangeValue={({ value }) => {brightness.screen = value;}} */}
			{/* 		value={createBinding(brightness, "screen")} */}
			{/* 		max={brightness.screenMax} */}
			{/* 	/> */}
			{/* </box> */}
		</box>
	);
}
