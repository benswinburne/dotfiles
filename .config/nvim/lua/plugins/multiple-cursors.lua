return {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*",
	enabled = true,
	pre_hook = function()
		require("nvim-autopairs").disable()
	end,
	post_hook = function()
		require("nvim-autopairs").enable()
	end,
	config = function()
		require("multiple-cursors").setup()

		local mc = require("multiple-cursors")

		vim.keymap.set({ "n", "x" }, "<C-n>", function()
			mc.add_cursor_and_jump_to_next_match()
		end, { desc = "Add cursor to word under cursor and jump to next match" })

		vim.keymap.set({ "n", "x" }, "<C-b>", function()
			mc.jump_to_previous_match()
		end, { desc = "Jump to previous match" })

		vim.keymap.set({ "n", "x" }, "<C-x>", function()
			mc.jump_to_next_match()
		end, { desc = "Jump to next match" })
	end,
}
-- jake-stewart/multicursor.nvim actually seems like the better plugin, but it
-- doesn't support live editing so you can visually see all the changes
-- happening at once. Ultimately it's probably way more performant when making
-- many edits but my brain likes to see it happening everywhere. nvim allegedly
-- will support multi cursor natively soon(tm).

-- return {
-- 	"jake-stewart/multicursor.nvim",
-- 	branch = "1.0",
-- 	enabled = false,
-- 	config = function()
-- 		local mc = require("multicursor-nvim")
-- 		mc.setup()

-- 		-- Add or skip cursor above/below the main cursor.
-- 		vim.keymap.set({ "n", "x" }, "<up>", function()
-- 			mc.lineAddCursor(-1)
-- 		end)
-- 		vim.keymap.set({ "n", "x" }, "<down>", function()
-- 			mc.lineAddCursor(1)
-- 		end)
-- 		vim.keymap.set({ "n", "x" }, "<leader><up>", function()
-- 			mc.lineSkipCursor(-1)
-- 		end)
-- 		vim.keymap.set({ "n", "x" }, "<leader><down>", function()
-- 			mc.lineSkipCursor(1)
-- 		end)

-- 		-- Add or skip adding a new cursor by matching word/selection
-- 		vim.keymap.set({ "n", "x" }, "<c-n>", function()
-- 			mc.matchAddCursor(1)
-- 		end)
-- 		vim.keymap.set({ "n", "x" }, "<leader>s", function()
-- 			mc.matchSkipCursor(1)
-- 		end)
-- 		vim.keymap.set({ "n", "x" }, "<c-p>", function()
-- 			mc.matchAddCursor(-1)
-- 		end)
-- 		vim.keymap.set({ "n", "x" }, "<leader>S", function()
-- 			mc.matchSkipCursor(-1)
-- 		end)

-- 		-- Add and remove cursors with control + left click.
-- 		-- vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)
-- 		-- vim.keymap.set("n", "<c-leftdrag>", mc.handleMouseDrag)
-- 		-- vim.keymap.set("n", "<c-leftrelease>", mc.handleMouseRelease)

-- 		-- Disable and enable cursors.
-- 		vim.keymap.set({ "n", "x" }, "<c-q>", mc.toggleCursor)

-- 		-- Mappings defined in a keymap layer only apply when there are
-- 		-- multiple cursors. This lets you have overlapping mappings.
-- 		mc.addKeymapLayer(function(layerSet)
-- 			-- Select a different cursor as the main one.
-- 			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
-- 			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

-- 			-- Delete the main cursor.
-- 			layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

-- 			-- Enable and clear cursors using escape.
-- 			layerSet("n", "<esc>", function()
-- 				if not mc.cursorsEnabled() then
-- 					mc.enableCursors()
-- 				else
-- 					mc.clearCursors()
-- 				end
-- 			end)
-- 		end)

-- 		-- Customize how cursors look.
-- 		local hl = vim.api.nvim_set_hl
-- 		hl(0, "MultiCursorCursor", { reverse = true })
-- 		hl(0, "MultiCursorVisual", { link = "Visual" })
-- 		hl(0, "MultiCursorSign", { link = "SignColumn" })
-- 		hl(0, "MultiCursorMatchPreview", { link = "Search" })
-- 		hl(0, "MultiCursorDisabledCursor", { reverse = true })
-- 		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
-- 		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
-- 	end,
-- }
