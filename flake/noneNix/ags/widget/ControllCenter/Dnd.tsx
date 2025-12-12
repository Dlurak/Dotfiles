import { createBinding } from "gnim";
import { QsMainButton } from "./Wrapper/QsButton";
import Notifd from "gi://AstalNotifd"

export function DndButton() {
	const notifd = Notifd.get_default()
	const dnd = createBinding(notifd, "dontDisturb");

	return (
		<QsMainButton
			standalone
			title={dnd(dnd => dnd ? "Don't disturb" : "Annoy me")}
			subtitle={dnd(dnd => (dnd ? '→ "Annoy me"' : `→ "Don't disturb"`))}
			image={
				<label
					label="  "
					css={dnd((dnd) => `
					   ${dnd ? "color: #BB9AF7;" : ""}
					   font-size: 1.7rem;
					   margin-left: -10px;
					   margin-right: -10px;
				   `)}
				/>
			}
			onClicked={() => {
				notifd.set_dont_disturb(
					!notifd.get_dont_disturb()
				);
			}}
		/>
	);
}
