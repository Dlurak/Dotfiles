import { exec, execAsync, Variable } from "astal";

const minSunset = 3_000
const maxSunset = 6_500

export const Sunset = () => {
	const sunset = Variable(0)

	return (
		<box hexpand spacing={8} className="slider">
			<box spacing={4}>
				<label className="big-icon">
					󰃠
				</label>
				<label>
					{sunset((s) => `${Math.round(s * 100)}%`)}
				</label>
			</box>
			<slider
				hexpand
				vexpand={false}
				widthRequest={100}
				value={sunset.get()}
				onDragged={({ value }) => {
					if (value === 0) {
						exec("pkill hyprsunset")
						return
					}

					const temp = Math.round(minSunset + (maxSunset - minSunset) / 100 * ((1 - value) * 100));
					execAsync(`hyprsunset -t ${temp}`);

					exec("ps -eo pid,etime,cmd")
						.split('\n')
						.filter(l => l.includes("hyprsunset"))
						.filter(l => !l.includes('00:0'))
						.map(n => n.trim().split(/\s+/)[0])
						.forEach((pid) => exec(`kill ${pid}`))

					sunset.set(value)
				}}
			/>
		</box>
	)
}
