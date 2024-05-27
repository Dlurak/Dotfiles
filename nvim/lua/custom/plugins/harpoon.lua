local keymap = require("custom.utils.namespaces").keymap
local namespace = require("custom.utils.namespaces").namespaces.harpoon

local km = keymap(namespace)

return {
		"ThePrimeagen/harpoon",
		keys = {
			{km('h'), function() require("harpoon.ui").toggle_quick_menu() end},
			{km('s'), function() require("harpoon.ui").toggle_quick_menu() end},
			{km('a'), function() require("harpoon.mark").add_file() end},
			{km("t"), "<cmd>Telescope harpoon marks<cr>"},
			{km("p"), function() require("harpoon.ui").nav_prev() end},
			{km("n"), function() require("harpoon.ui").nav_next() end},
			{km("1"), function() require("harpoon.ui").nav_file(1) end},
			{km("2"), function() require("harpoon.ui").nav_file(2) end},
			{km("3"), function() require("harpoon.ui").nav_file(3) end},
			{km("4"), function() require("harpoon.ui").nav_file(4) end},
			{km("5"), function() require("harpoon.ui").nav_file(5) end},
			{km("6"), function() require("harpoon.ui").nav_file(6) end},
			{km("7"), function() require("harpoon.ui").nav_file(7) end},
			{km("8"), function() require("harpoon.ui").nav_file(8) end},
			{km("9"), function() require("harpoon.ui").nav_file(9) end},
		}
	}
