import { Variable } from "astal"

const time = Variable("").poll(1000, "date +%H:%M")

export const Clock = () => <label marginRight={12}>{time()}</label>
