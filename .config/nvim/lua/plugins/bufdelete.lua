-- https://github.com/orlp/vim-bunlink
-- https://github.com/famiu/bufdelete.nvim
-- https://github.com/ojroques/nvim-bufdel
-- https://github.com/moll/vim-bbye
-- https://github.com/folke/snacks.nvim/blob/main/docs/bufdelete.md
--
-- https://github.com/nvim-neo-tree/neo-tree.nvim/pull/1751
-- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1504
return {
	"famiu/bufdelete.nvim",
	config = function()
		local bd = require("bufdelete")

		-- Buffer navigation
		vim.keymap.set("n", "qq", function()
			bd.bufdelete(0, true)
		end, { desc = "Close buffer while retaining window layout" }) -- close current buffer

		vim.keymap.set("n", "<leader>bd", function()
			local buffers = vim.api.nvim_list_bufs()
			for _, buf in ipairs(buffers) do
				if vim.fn.buflisted(buf) == 1 then
					bd.bufdelete(buf, true)
				end
			end
		end, { desc = "Close all buffers while retaining window layout" })

		-- vim.keymap.set("n", "<leader>bd", function()
		--   local buffers = vim.api.nvim_list_bufs()
		--   local to_delete = {}
		--   for _, buf in ipairs(buffers) do
		--     if vim.fn.buflisted(buf) == 1 then
		--       table.insert(to_delete, buf)
		--     end
		--   end
		--   bd.bufdelete(to_delete, true) -- force = true
		-- end, {})

		vim.keymap.set("n", "<tab>", ":bnext<CR>", {
			silent = true,
			desc = "Move to next buffer",
		})

		vim.keymap.set("n", "<s-tab>", ":bprevious<CR>", {
			silent = true,
			desc = "Move to previous buffer",
		})

		vim.keymap.set("n", "<leader><leader>", "<c-^>", {
			silent = true,
			desc = "Switch between last two files",
		})

		vim.keymap.set(
			"n",
			"<leader>fp",
			":cd %:p:h<CR>",
			{ silent = true, desc = "Set pwd to that of current file/buffer" }
		)

		-- vim.keymap.set("n", "qq", ":bd<CR>", {}) -- close current buffer
		-- vim.keymap.set("n", "<leader>bd", ":bufdo bd<CR>", {}) -- close all buffers
		-- vim.keymap.set("n", "<tab>", ":bnext<CR>", { silent = true }) -- Use tab to move to next buffer
		-- vim.keymap.set("n", "<s-tab>", ":bprevious<CR>", { silent = true }) -- use shift-tab to move to prev buffer
		-- vim.keymap.set("n", "<leader><leader>", "<c-^>", {}) -- Switch between last two files
		-- vim.keymap.set("n", "<leader>fp", ":cd %:p:h<CR>", {}) -- set pwd to that of current file/buffer
	end,
}
