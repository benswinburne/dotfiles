-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#intelephense

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"folke/neodev.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- TypeScript / JavaScript (ts_ls)
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			settings = {
				completions = {
					completeFunctionCalls = true,
				},
			},
		})

		vim.lsp.config("intelephense", {
			init_options = {
				licenceKey = "~/Dropbox/.private/intelephense.txt",
			},
			settings = {
				intelephense = {
					environment = {
						-- phpVersion = "8.3.22",
					},
					files = {
						maxSize = 1000000,
					},
				},
			},
		})

		vim.lsp.enable({ "lua_ls", "ts_ls", "intelephense" })

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { noremap = true, silent = true, desc = "Go to definition" })

		vim.keymap.set("n", "gy", function()
			vim.lsp.buf.type_definition()
		end, { noremap = true, silent = true, desc = "Go to type definition" })

		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, { noremap = true, silent = true, desc = "Go to implementation" })

		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, { noremap = true, silent = true, desc = "Find references" })
	end,
}
