-- Automatically trims trailing whitespace from every line on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd("%s/\\s\\+$//e")
		vim.fn.setpos(".", save_cursor)
	end,
})

-- changelogs are massive and slow down when browsing
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = { "CHANGELOG.md", "changelog.md" },
	callback = function()
		vim.cmd("set syntax=off")
		-- vim.treesitter.stop()
	end,
})

-- wrap markdown at 80 automatically
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.md", "*.txt" },
	callback = function()
		vim.o.textwidth = 80
	end,
})

-- Enable autoread and set up checking triggers
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = "*",
})
