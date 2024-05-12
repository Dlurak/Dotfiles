return {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup({
		copy_sync = {
			redirect_to_clipboard = true
		}
	}) end
}
