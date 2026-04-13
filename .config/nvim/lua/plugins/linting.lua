return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			css = { "stylelint" },
			scss = { "stylelint" },
			less = { "stylelint" },
			javascript = { "biome", "eslint_d" },
			jsx = { "biome", "eslint_d", "stylelint" },
			-- typescript = { "biome", "eslint_d" },
			typescriptreact = { "biome", "eslint_d" },
			javascriptreact = { "biome", "eslint_d" },
			json = { "biome" },
			sh = { "shellcheck" },
			dockerfile = { "hadolint" },
			blade = { "htmlhint" },
			html = { "htmlhint" },
			markdown = { "write_good" },
			php = { "php" },
			yaml = { "yamllint" },
			go = { "gofmt", "golines" },
		}

		-- local linters_config = {
		-- json = { "biome" },
		-- html = { "biome", "htmlhint" },
		-- dockerfile = { "hadolint" },
		-- blade = { "htmlhint" },
		-- markdown = { "write-good" },
		-- php = { "php" },
		-- yaml = { "yamllint" },
		-- }

		-- -- Get first available linter for each filetype
		-- local function get_first_available_linter(linters)
		-- for _, linter in ipairs(linters) do
		-- if vim.fn.executable(linter) == 1 then
		-- return { linter }
		-- end
		-- end
		-- return {}
		-- end

		-- lint.linters_by_ft = {}
		-- for ft, linters in pairs(linters_config) do
		-- lint.linters_by_ft[ft] = get_first_available_linter(linters)
		-- end

		-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		-- vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
		-- 	callback = function()
		-- 		lint.try_lint(nil, { ignore_errors = true })
		-- 	end,
		-- })

		vim.keymap.set("n", "<leader>al", function()
			lint.try_lint(nil, { ignore_errors = true })
		end, { desc = "Trigger linting" })

		vim.keymap.set("n", "<leader>ad", function()
			vim.diagnostic.open_float()

			-- vim.cmd("copen")
		end, { desc = "Show diagnostics" })
	end,
}

-- let g:ale_linters = {
-- \   'Dockerfile': ['hadolint'],
-- \   'blade': ['htmlhint', 'prettier'],
-- \}
-- " \   'yaml-jinja': ['biome', 'yamllint'],

-- " \   'php': ['php', 'langserver', 'phpcs', 'phpmd'],
