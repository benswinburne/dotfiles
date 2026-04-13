return {
	"Exafunction/windsurf.nvim",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			detect_proxy = false,
			virtual_text = {
				enabled = true,
			},
		})
	end,
}

-- " Codeium
-- let g:codeium_disable_bindings = 1
-- let g:codeium_no_map_tab = 1
-- imap <script><silent><nowait><expr> <C-h> codeium#Accept()
-- imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
-- imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
