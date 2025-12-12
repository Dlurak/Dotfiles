import { Gtk } from "ags/gtk4";
import { Accessor, Node } from "gnim";
import { MAIN_BUTTON_SIZE } from "../consts";

type MainProps = {
	title: Accessor<string> | string,
	subtitle?: Accessor<string> | string,
	image: Node,
	onClicked?: () => void,
	standalone?: boolean
}

export function QsMainButton({ title, image, subtitle, onClicked, standalone }: MainProps) {
	return (
		<box
			widthRequest={MAIN_BUTTON_SIZE}
			hexpand
			vexpand
			class={standalone ? "bordered" : ""}
		>
			<button hexpand onClicked={onClicked}>
				<box spacing={8}>
					{image}
					<box
						orientation={Gtk.Orientation.VERTICAL}
						valign={Gtk.Align.CENTER}
						spacing={3}
						hexpand
					>
						<label
							label={title}
							class="title"
							halign={Gtk.Align.START}
						/>
						{subtitle && (
							<label
								  label={subtitle}
								  class="subtitle"
								  halign={Gtk.Align.START}
							/>
						)}
					</box>
				</box>
			</button>
		</box>
	);
}

type SmallProps = {
	children: Node,
	onClicked?: (btn: Gtk.Button) => void
}

export function QsSmallButton({ children, onClicked }: SmallProps) {
	return (
		<box
			widthRequest={MAIN_BUTTON_SIZE / 2}
			class="small-button"
			hexpand
			vexpand
		>
			<button hexpand onClicked={onClicked}>
				{children}
			</button>
		</box>
	);
}
