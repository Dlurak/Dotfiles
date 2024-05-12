return {
		"ThePrimeagen/harpoon",
		keys = {
			{'<leader>hh', function() require("harpoon.ui").toggle_quick_menu() end},
			{'<leader>hs', function() require("harpoon.ui").toggle_quick_menu() end},
			{'<leader>ha', function() require("harpoon.mark").add_file() end},
			{"<leader>ht", "<cmd>Telescope harpoon marks<cr>"},
			{"<leader>hp", function() require("harpoon.ui").nav_prev() end},
			{"<leader>hn", function() require("harpoon.ui").nav_next() end},
			{"<leader>h1", function() require("harpoon.ui").nav_file(1) end},
			{"<leader>h2", function() require("harpoon.ui").nav_file(2) end},
			{"<leader>h3", function() require("harpoon.ui").nav_file(3) end},
			{"<leader>h4", function() require("harpoon.ui").nav_file(4) end},
			{"<leader>h5", function() require("harpoon.ui").nav_file(5) end},
			{"<leader>h6", function() require("harpoon.ui").nav_file(6) end},
			{"<leader>h7", function() require("harpoon.ui").nav_file(7) end},
			{"<leader>h8", function() require("harpoon.ui").nav_file(8) end},
			{"<leader>h9", function() require("harpoon.ui").nav_file(9) end},
		}
	}
