-- Automatically turn of hlsearch when not in use
-- Tooling to jump around search results more easily
return {
	"kevinhwang91/nvim-hlslens",
	config = function()
		require("hlslens").setup({
			enable_incsearch = false,
			calm_down = true,
			nearest_float_when = "never",
		})

		-- turn off search highlight
		vim.keymap.set("n", "<leader><space>", ":set hlsearch!<cr>", { silent = true })
	end,
}
