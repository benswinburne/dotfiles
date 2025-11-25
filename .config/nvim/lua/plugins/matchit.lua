return {
	"andymass/vim-matchup",
	init = function()
		vim.g.matchup_treesitter_stopline = 500

		require("match-up").setup({
			---@type matchup.Config
			treesitter = {
				stopline = 500,
			},
		})
	end,
}
