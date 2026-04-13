return {
	"shortcuts/no-neck-pain.nvim",
	enabled = true,
	version = "*",
	config = function()
		require("no-neck-pain").setup({
			-- The width of the focused window that will be centered.
			-- When the terminal width is less than the `width` option, the side
			-- buffers won't be created.
			---@type integer|"textwidth"|"colorcolumn"
			-- width = "colorcolumn",
			width = 120,
			-- Creates mappings for you to easily interact with the exposed commands.
			---@type table
			mappings = {
				-- When `true`, creates all the mappings that are not set to `false`.
				---@type boolean
				enabled = true,
				-- Sets a global mapping to Neovim, which allows you to toggle the plugin.
				-- When `false`, the mapping is not created.
				---@type string
				toggle = "<Leader>np",
				-- Sets a global mapping to Neovim, which allows you to toggle the left side buffer.
				-- When `false`, the mapping is not created.
				---@type string
				toggleLeftSide = "<Leader>nql",
				-- Sets a global mapping to Neovim, which allows you to toggle the right side buffer.
				-- When `false`, the mapping is not created.
				---@type string
				toggleRightSide = "<Leader>nqr",
				-- Sets a global mapping to Neovim, which allows you to increase the width (+5) of the main window.
				-- When `false`, the mapping is not created.
				---@type string | { mapping: string, value: number }
				widthUp = "<Leader>n=",
				-- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
				-- When `false`, the mapping is not created.
				---@type string | { mapping: string, value: number }
				widthDown = "<Leader>n-",
				-- Sets a global mapping to Neovim, which allows you to toggle the scratchPad feature.
				-- When `false`, the mapping is not created.
				---@type string
				scratchPad = "<Leader>ns",
			},

			-- Supported integrations that might clash with `no-neck-pain.nvim`'s behavior.
			--
			-- The `position` is used when the plugin scans the layout in order to compute the width that should be added
			-- on each side. For example, if you were supposed to have a padding of 100 columns on each side, but an
			-- integration takes 42, only 58 will be added so your layout is still centered.
			--
			-- If `reopen` is set to `false`, we won't account the width but close the integration when encountered.
			---@type table
			integrations = {
				-- @link https://github.com/nvim-neo-tree/neo-tree.nvim
				NeoTree = {
					-- The position of the tree.
					---@type "left"|"right"
					position = "right",
					-- When `true`, if the tree was opened before enabling the plugin, we will reopen it.
					reopen = true,
				},
			},
		})

		-- vim.keymap.set("n", "<leader>np", function()
		-- end, { desc = "Toggle No Neck Pain", silent = true })
	end,
}
