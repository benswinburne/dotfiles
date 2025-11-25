-- https://github.com/tristone13th/lspmark.nvim
-- https://github.com/heilgar/bookmarks.nvim
-- https://github.com/LintaoAmons/bookmarks.nvim

return {
	"tomasky/bookmarks.nvim",
	event = "VimEnter",
	config = function()
		local bm = require("bookmarks")

		bm.setup({
			sign_priority = 8,
			on_attach = function(bufnr)
				vim.keymap.set("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
				vim.keymap.set("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
				vim.keymap.set("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
				vim.keymap.set("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
				vim.keymap.set("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
				vim.keymap.set("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
				vim.keymap.set("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
			end,
		})
	end,
}
