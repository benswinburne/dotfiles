return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		vim.opt.winbar = " "

		bufferline.setup({
			options = {
				seprator_style = { "", "" },

				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.minimal, -- or bufferline.style_preset.default
				},

				show_buffer_close_icons = false,
			},
		})
	end,
}
