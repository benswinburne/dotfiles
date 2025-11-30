-- https://github.com/wsdjeg/flygrep.nvim

local exclude = {
	".git",
	"package-lock.json",
	"yarn.lock",
	"Cargo.lock",
	"changelog.md",
	"CHANGELOG.md",
}

-- o.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- highlight matches
vim.opt.ignorecase = true
-- o.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise

local function load_gitignore()
	local gitignore_path = ".gitignore"
	local file = io.open(gitignore_path, "r")
	if not file then
		return {}
	end

	local patterns = {}
	for line in file:lines() do
		line = line:gsub("^%s+|%s+$", "")
		if line ~= "" and not line:match("^#") then
			table.insert(patterns, line)
		end
	end
	file:close()
	return patterns
end

local gitignore_patterns = load_gitignore()
for _, pattern in ipairs(gitignore_patterns) do
	table.insert(exclude, pattern)
end

local exclude_flags = table.concat(
	vim.tbl_map(function(pattern)
		return "--glob=!" .. pattern
	end, exclude),
	" "
)

vim.api.nvim_create_user_command("Rg", function(opts)
	vim.cmd("silent grep! " .. vim.fn.shellescape(opts.args))
end, { nargs = "*" })

-- vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case --glob-case-insensitive " .. exclude_flags
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

-- bind \ (backward slash) to grep shortcut
vim.keymap.set("n", "\\", ":Rg<space>", { silent = false })

-- automatically open the quickfix window when searching
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = "[^l]*",
	callback = function()
		local qf_list = vim.fn.getqflist()
		-- if #qf_list > 0 then
		vim.cmd("copen")
		-- end
	end,
})

-- e opens item under the cursor and closes the quickfix window
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "e", "<CR>:cclose<CR>", { buffer = true, silent = true })
	end,
})
