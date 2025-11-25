return {
	"danymat/neogen",
	config = function()
		local neogen = require("neogen")

		neogen.setup({
			enabled = true,
		})

		vim.keymap.set("n", "<leader>nf", function()
			neogen.generate()
		end, { desc = "Generate Annotation", silent = true })
	end,
	version = "*",
}
