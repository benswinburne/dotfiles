return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup()

		require("mason-tool-installer").setup({
			ensure_installed = {
				"shellcheck", -- shell
				"write-good", -- markdown
				"dotenv-linter", -- dotenv

				-- lua
				"lua_ls",
				"stylua",
				-- "luacheck",

				-- html/css
				"html",
				"htmlhint",
				"cssls",
				"tailwindcss",
				"stylelint",

				-- javascript/typescript
				-- "biome",
				-- "prettier",
				"eslint",
				"eslint_d",
				"typescript-language-server",

				-- php
				"intelephense",
				"phpcs",

				-- json
				"jsonls",
				"jsonlint",

				-- docker
				"hadolint",
				"docker-compose-language-service",
				"docker-language-server",
				"dockerfile-language-server",

				-- go
				"gopls",
				"golangci-lint",
				"golines",
			},
		})
	end,
}
