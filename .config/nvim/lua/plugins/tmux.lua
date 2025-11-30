-- https://github.com/christoomey/vim-tmux-navigator/issues/387
return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		require("nvim-tmux-navigation").setup({
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-Space>",
			},
		})
	end,
}

-- 	"numToStr/Navigator.nvim"
-- 	Does not handle fzf window etc well
-- return {
-- 	"numToStr/Navigator.nvim",
-- 	config = function()
-- 		require("Navigator").setup()
--
-- 		local navigator = require("Navigator")
--
-- 		vim.keymap.set({ "n", "t" }, "<C-h>", function()
-- 			navigator.left()
-- 		end, { desc = "Navigate to left pane (vim/tmux)" })
--
-- 		vim.keymap.set({ "n", "t" }, "<C-l>", function()
-- 			navigator.right()
-- 		end, { desc = "Navigate to right pane (vim/tmux)" })
--
-- 		-- vim.keymap.set({ "n", "t" }, "<C-k>", function()
-- 		-- 	navigator.up()
-- 		-- end, { desc = "Navigate to upper pane (vim/tmux)" })
-- 		--
-- 		-- vim.keymap.set({ "n", "t" }, "<C-j>", function()
-- 		-- 	navigator.down()
-- 		-- end, { desc = "Navigate to lower pane (vim/tmux)" })
--
-- 		-- vim.keymap.set({ "n", "t" }, "<C-p>", function()
-- 		-- 	navigator.previous()
-- 		-- end, { desc = "Navigate to previous pane (vim/tmux)" })
-- 	end,
-- }
