return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip", -- set up properly in snippets.lua
		"onsails/lspkind.nvim",
		"davidsierradz/cmp-conventionalcommits",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			enabled = function()
				local disabled = false
				disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
				disabled = disabled or (vim.fn.reg_recording() ~= "")
				disabled = disabled or (vim.fn.reg_executing() ~= "")

				-- don't autocomplete if in a comment
				disabled = disabled or require("cmp.config.context").in_treesitter_capture("comment")

				return not disabled
			end,

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				-- completeopt = "menuone,noinsert,noselect",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				format = lspkind.cmp_format({
					-- mode = "symbol_text",
					-- mode = "text",
					-- maxwidth = 100,
					-- ellipsis_char = "...",
					-- menu = {
					-- 	buffer = "[Buffer]",
					-- 	nvim_lsp = "[LSP]",
					-- 	luasnip = "[LuaSnip]",
					-- 	nvim_lua = "[Lua]",
					-- 	latex_symbols = "[Latex]",
					-- },
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping.confirm({
					-- behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "conventionalcommits" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		-- already doing this with ts_ls and intelephense already does it
		-- https://bit.ly/43QjYUK
		-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		-- local cmp = require('cmp')
		-- cmp.event:on(
		--   'confirm_done',
		--   cmp_autopairs.on_confirm_done()
		-- )

		-- vim.cmd([[
		--     highlight! default link CmpItemKind CmpItemMenuDefault
		--   ]])
	end,
}
