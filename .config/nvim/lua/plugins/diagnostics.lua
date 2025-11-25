-- alternatively in gutter instead of floating window
-- https://github.com/TomDeneire/lsp-in-gutter.nvim
-- https://github.com/folke/trouble.nvim
-- corn.nvim

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	enabled = true,
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "simple", -- "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
			options = {
				multilines = {
					enabled = false,
				},
			},
		})

		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "✖",
					[vim.diagnostic.severity.WARN] = "⚠",
					[vim.diagnostic.severity.INFO] = "⚠",
					[vim.diagnostic.severity.HINT] = "⚠",
				},
				texthl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
					[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
					[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				},
			},
			severity_sort = true,
		})
	end,
}
