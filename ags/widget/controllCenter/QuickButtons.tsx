import { Binding, execAsync, Variable } from "astal"

type QuickButtonProps = {
	content: Binding<string> | string
	command: string | string[]
	onClick?: () => void
}

const QuickButton = ({ content, command, onClick }: QuickButtonProps) => (
		<button
			vexpand
			hexpand
			className="bordered"
			onClick={() => {
				execAsync(command)
				if (onClick) {
					onClick
				}
			}}
		>
			{content}
		</button>
	)

export const QuickButtons = () => {
	const spacing = 6
	const isLockingActive = Variable(true).poll(
		7_500,
		["bash", "-c", 'pgrep -x "hypridle" > /dev/null && echo "true" || echo "false"'],
		(str) => str === "true"
	)

	return (
		<box hexpand vexpand vertical spacing={spacing}>
			<box hexpand vexpand spacing={spacing}>
				<QuickButton content="󰔎 " command={["bash", "-c", "pkill hyprsunset || hyprsunset -t 5000"]} />
				<QuickButton content=" " command={["bash", "-c", "hyprpicker | wl-copy"]} />
			</box>
			<box hexpand vexpand spacing={spacing}>
				<QuickButton content="󰹑 " command={["bash", "-c", 'grim -g "$(slurp)" - | wl-copy']} />
				<QuickButton
					content={isLockingActive((a) => a ? ' ' : " ")}
					command={["bash", "-c", "pkill hypridle || hypridle"]}
					onClick={() => isLockingActive.set(!isLockingActive.get())}
				/>
			</box>
		</box>
	)
}
