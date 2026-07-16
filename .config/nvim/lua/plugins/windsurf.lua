-- https://windsurf.com/enterprise/account/login?redirect_uri=vim-show-auth-token
-- https://github.com/monkoose/neocodeium/issues/70#issuecomment-4667253418

return {
	"Exafunction/windsurf.nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = true,
			virtual_text = {
				enabled = true,
				idle_delay = 75,
				map_keys = false,
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
