return {
	"flashcodes-themayankjha/fkthemes.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		-- Add your themes here
		"catppuccin/nvim",
		"folke/tokyonight.nvim",
		"neanias/everforest-nvim",
		"RRethy/base16-nvim",
	},
	config = function()
		require("fkthemes").setup({
			themes = { "tokyonight", "catppuccin", "everforest", "base16-eighties" },
			default_theme = "base16-eighties",
			transparent_background = true,
		})
	end,
}
