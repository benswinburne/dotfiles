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
		local neotree_fs_command = require("neo-tree.sources.filesystem.commands")

		neotree.setup({
			close_if_last_window = true,
			enable_git_status = true,
			window = {
				position = "right",
				mappings = {
					["e"] = "open_nofocus",
				},
			},
			commands = {
				open_nofocus = function(state)
					neotree_fs_command.open(state)
					vim.schedule(function()
						vim.cmd([[Neotree focus]])
					end)
				end,
			},
			follow_current_file = {
				-- This will find and focus the file in the active buffer every time
				-- the current file is changed while the tree is open.
				enabled = false,
				leave_dirs_open = false,
			},
			filesystem = {
				window = {
					mappings = {
						["/"] = false,
					},
				},
				filtered_items = {
					visible = true,
					hide_gitignored = true,
				},
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
			},
		})

		vim.keymap.set("n", "<leader>nt", function()
			neotree_command.execute({ action = "focus", toggle = true })
		end, { desc = "Toggle NeoTree", silent = true })

		-- Ensure the neotree buffer is not left lingering when closing vim with
		-- commands like :q instead of :qa
		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				neotree_command.execute({ action = "close" })
			end,
		})
	end,
}
