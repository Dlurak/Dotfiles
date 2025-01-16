import { Binding, execAsync, Variable } from "astal"

type QuickButtonProps = {
	content: Binding<string> | string
	command: string | string[]
}

const QuickButton = ({ content, command }: QuickButtonProps) => (
		<button
			vexpand
			hexpand
			className="bordered"
			onClick={() => {
				execAsync(command)
			}}
		>
			{content}
		</button>
	)

export const QuickButtons = () => {
	const spacing = 6
	const isLockingActive = Variable(true).poll(
		1_000,
		["bash", "-c", 'pgrep -x "wlinhibit" > /dev/null && echo "false" || echo "true"'],
		(str) => str === "true"
	)

	return (
		<box hexpand vexpand vertical spacing={spacing}>
			<box hexpand vexpand spacing={spacing}>
				<QuickButton content="󰔎 " command={["bash", "-c", "pkill hyprsunset || hyprsunset -t 5000"]} />
				<QuickButton content=" " command={["bash", "-c", "hyprpicker | wl-copy"]} />
			</box>
			<box hexpand vexpand spacing={spacing}>
				<QuickButton
					content="󰹑 "
					command={[
						"bash",
						"-c",
						'grim -g "$(slurp)" - | wl-copy && screenshot-notify'
					]}
				/>
				<QuickButton
					content={isLockingActive((a) => a ? ' ' : " ")}
					command={["bash", "-c", "pkill wlinhibit || wlinhibit"]}
				/>
			</box>
		</box>
	)
}
