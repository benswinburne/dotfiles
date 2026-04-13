return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome", "prettier" },
				typescript = { "biome", "prettier" },
				javascriptreact = { "biome", "prettier" },
				typescriptreact = { "biome", "prettier" },
				css = { "prettier", "stylelint" },
				less = { "prettier", "stylelint" },
				scss = { "prettier", "stylelint" },
				html = { "tidy", "prettier" },
				json = { "fixjson" },
				jsonc = { "fixjson" },
				-- yaml = { "prettier" },
				php = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				-- yaml = { "yamlfix" },
				blade = { "blade-formatter" },
				arduino = { "astyle" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>af", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
