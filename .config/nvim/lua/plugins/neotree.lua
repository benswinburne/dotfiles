return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")
		local neotree_command = require("neo-tree.command")

		neotree.setup({
			close_if_last_window = true,
			enable_git_status = true,
			window = {
				position = "right",
			},
			follow_current_file = {
				-- This will find and focus the file in the active buffer every time
				-- the current file is changed while the tree is open.
				enabled = false,
				leave_dirs_open = false,
			},
		})

		vim.keymap.set("n", "<leader>nt", function()
			neotree_command.execute({ action = "show", toggle = true })
		end, { desc = "Toggle NeoTree", silent = true })
	end,
}
