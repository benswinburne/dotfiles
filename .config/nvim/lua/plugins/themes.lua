-- https://smarttech101.com/how-to-configure-colorscheme-in-vim-neovim
return {
	{
		"folke/tokyonight.nvim",
	},
	{
		"neanias/everforest-nvim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "frappe", -- latte, frappe, macchiato, mocha
				term_colors = true,
				transparent_background = false,
			})

			vim.opt.termguicolors = true
			vim.opt.background = "dark"
			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
	{
		"RRethy/base16-nvim",
	},
}
