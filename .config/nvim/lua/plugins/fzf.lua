return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf_lua = require("fzf-lua")

		fzf_lua.setup({
			files = {},
			winopts = {
				split = "belowright new",
				preview = {
					hidden = true,
				},
			},
		})

		vim.keymap.set("n", "<c-p>", function()
			fzf_lua.files()
		end, { desc = "FZF File Finder" })
	end,
}
