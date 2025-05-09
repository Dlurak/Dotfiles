$env.config.edit_mode = 'vi'

$env.config.show_banner = false

$env.config.history.max_size = 1000

$env.config.keybindings = [
	{
	  name: change_dir_with_fzf
	  modifier: CONTROL
	  keycode: Char_t
	  mode: [vi_insert vi_normal]
	  event:[
		  { edit: Clear }
		  { edit: InsertString,
			value: "cd (ls | where type == dir | each { |row| $row.name} | str join (char nl) | fzf | decode utf-8 | str trim)"
		  }
		  { send: Enter }
		]
	}
]

nitch
