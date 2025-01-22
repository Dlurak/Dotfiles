import { Variable } from "astal"
import AstalApps from "gi://AstalApps"
import { AppButton } from "./AppButton";

type AppProps = {
	reset: () => void
}

export const Apps = ({ reset }: AppProps) => {
	const apps = new AstalApps.Apps()
	const text = Variable("")
	const list = text(t => apps.fuzzy_query(t))
	const onEnter = () => {
		apps.fuzzy_query(text.get())?.[0].launch()
		reset()
	}

	return (
		<box hexpand vertical widthRequest={400} spacing={8}>
			<entry
				hexpand
				placeholderText="Search"
				text={text()}
				onChanged={self => text.set(self.text)}
				onActivate={onEnter}
			/>
				<scrollable heightRequest={500}>
					<box spacing={6} vertical>
						{list.as(list => list.map(app => (
							<AppButton app={app} reset={reset} />
						)))}
					</box>
				</scrollable>
		</box>
	)
}
