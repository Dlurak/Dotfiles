import { exec } from "ags/process";

export function BottomLine() {
	const genDateFull = exec("stat -c %y /nix/var/nix/profiles/system");
	const genDate = exec(`date -d "${genDateFull}" +%d.%m.%y`);

	return (
		<centerbox
			class="bordered"
			css={`
				padding-left: 8px;
				padding-right: 8px;

				padding-top: 4px;
				padding-bottom: 4px;
			`}
		>
			<label $type="start" label={exec("whoami")} />
			<label $type="end" label={`Generation: ${genDate}`} />
		</centerbox>
	);
}
