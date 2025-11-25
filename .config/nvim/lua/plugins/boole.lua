return {
	"nat-418/boole.nvim",
	lazy = false,

	---@module "boole"
	---@type boole.Config
	opts = {
		mappings = {
			increment = "<C-a>",
			decrement = "<C-x>",
		},
		additions = {},
		allow_caps_additions = {},
	},
	config = function()
		local boole = require("boole")

		vim.keymap.set("n", "gs", function()
			boole.run("increment")
		end, { desc = "Increment under cursor" })
	end,
}
