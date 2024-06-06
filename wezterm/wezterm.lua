local wezterm = require "wezterm"

local THEME_PATH = '/home/dlurak/.config/THEME'

wezterm.add_to_config_reload_watch_list(THEME_PATH)

local theme_file = io.open(THEME_PATH, 'r')

--- @type 'dark' | 'light'
local theme = "dark"
if theme_file then
	theme = theme_file:read()
	theme_file:close()
end

local config = {}

local padding = 5

if theme == 'light' then
	config.color_scheme = 'Catppuccin Latte'
else
	config.color_scheme = 'Catppuccin Mocha'
end

config.enable_wayland = false
config.enable_tab_bar = false

config.window_padding = {
  left = padding,
  right = padding,
  top = padding,
  bottom = padding,
}

config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
}

config.font_size = 13.5

config.keys = {
	{key="N", mods="CTRL|SHIFT", action="DisableDefaultAssignment"},
}

return config
