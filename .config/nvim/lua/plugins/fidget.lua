return {
	"j-hui/fidget.nvim",
	opts = {
		progress = {
			ignore_done_already = true,
			ignore_empty_message = true,
			display = {
				done_ttl = 3,
			},
		},
		notification = {
			window = {
				winblend = 0, -- Background color opacity in the notification window
				x_padding = 0, -- Padding from right edge of window boundary
				y_padding = 2, -- Padding from bottom edge of window boundary
			},
		},
	},
}
