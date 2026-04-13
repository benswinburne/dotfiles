-- local global = vim.g
local o = vim.opt

-- Editor options

o.number = true -- Print the line number in front of each line
-- o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamed" -- uses the clipboard register for all operations except yank.
-- o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "UTF-8" -- Sets the character encoding used inside Vim.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
-- o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
-- o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.splitright = true
o.splitbelow = true -- When on, splitting a window will put the new window below the current one
o.colorcolumn = "80"
o.textwidth = 80
o.undofile = true
o.autoread = true -- If a file is changed outside of vim, automatically reload it without asking

-- o.joinspaces = false -- Don't insert multiple spaces when joining lines
o.backup = false -- disable backups
o.swapfile = false -- disable swap files
-- o.updatetime = 300 -- More frequent updates for, e.g. signs.
o.scrolloff = 3 -- Offset scroll few lines before bottom
-- o.shortmess:append("c") -- don't give |ins-completion-menu| messages.
-- o.completeopt:remove("preview") -- stop preview on autocomplete
-- o.lazyredraw = true -- redraw only when we need to.
-- o.showmode = false -- leave statusline to handle this
-- o.softtabstop = 2 -- number of spaces in tab when editing
-- o.shiftround = true -- use multiple of shiftwidth when indenting with < and >
o.copyindent = true -- copy the indentation on autoindenting
-- o.foldenable = true -- enable folding
-- o.foldlevelstart = 10 -- open most folds by default
-- o.foldnestmax = 10 -- 10 nested fold max
-- o.foldmethod = "indent" -- fold based on indent level

vim.g.editorconfig = true
-- vim.opt.laststatus = 3
vim.opt.cmdheight = 0

vim.opt.formatoptions:append("t")
