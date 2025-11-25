-- vim.g.mapleader = "," -- happens in lazy
-- vim.g.maplocalleader = "\\" -- happens in lazy

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>update<CR>", { silent = true })

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- -- New Windows
vim.keymap.set("n", "<leader>o", "<CMD>vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>p", "<CMD>split<CR>", { silent = true })

-- Window Navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })

-- -- Resize Windows
-- map("n", "<C-Left>", "<C-w><")
-- map("n", "<C-Right>", "<C-w>>")
-- map("n", "<C-Up>", "<C-w>+")
-- map("n", "<C-Down>", "<C-w>-")

-- tabs to spaces
vim.keymap.set("n", "<leader><tab>", ":retab<cr>", { silent = true })
vim.keymap.set("n", "<leader>ts", ":%s/\t/    /g", { silent = true })

-- select text that was just pasted
vim.keymap.set("n", "<leader>v", "V`]", { silent = true })

-- Buffer navigation
vim.keymap.set("n", "qq", ":bd<CR>", {}) -- close current buffer
vim.keymap.set("n", "<leader>bd", ":bufdo bd<CR>", {}) -- close all buffers
vim.keymap.set("n", "<tab>", ":bnext<CR>", { silent = true }) -- Use tab to move to next buffer
vim.keymap.set("n", "<s-tab>", ":bprevious<CR>", { silent = true }) -- use shift-tab to move to prev buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>", {}) -- Switch between last two files
vim.keymap.set("n", "<leader>fp", ":cd %:p:h<CR>", {}) -- set pwd to that of current file/buffer

-- Move by visual line
vim.keymap.set("n", "j", "gj", {})
vim.keymap.set("n", "k", "gk", {})

-- clipboard helpers
vim.keymap.set("v", "<leader>y", '"*y', {})
vim.keymap.set("v", "<leader>v", '"*p', {})
vim.keymap.set("n", "<leader>v", '"*p', {})
