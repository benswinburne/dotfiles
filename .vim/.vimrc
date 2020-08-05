source ~/.vim/.vimrc.plug

" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile
set hidden " Automatically set buffers as 'hidden' when navigating away
set clipboard=unnamed " unnunamedplus
set nocompatible              " be iMproved, required
set updatetime=300 " More frequent updates for, e.g. signs.
set ts=4 sw=4 et

" Mouse
" ----------------------
set mouse=a

" Set filetypes for unknown extensions
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.apib set filetype=apiblueprint
autocmd BufNewFile,BufReadPost *.*\(vim\)\@<!rc set filetype=json
autocmd FileType json syntax match Comment +\/\/.\+$+

set laststatus=2
set encoding=utf-8
set backspace=2

set nojoinspaces " Don't insert multiple spaces when joining lines
set autoread " If a file is changed outside of vim, automatically reload it without asking

" Trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

if has('persistent_undo')
  " Create an undodir if it doesn't exist
  silent !mkdir ~/.vim/undodir > /dev/null 2>&1

  " Set a directory to store the undo history
  set undodir=~/.vim/undodir

  " Maintain undo history between sessions
  set undofile
endif


" Set a directory to store vim state etc
set viminfo=<800,'10,/50,:100,h,f0,n~/.viminfo

" Offset scroll few lines before bottom
set scrolloff=3

" Remove the delay exiting insert mode
set ttimeoutlen=0

" don't give |ins-completion-menu| messages.
set shortmess+=c

" stop preview on autocomplete
" https://github.com/neoclide/coc.nvim/issues/377
set completeopt-=preview

" Colors
" ----------------------
" https://codeyarns.com/2011/07/29/vim-chart-of-color-names/
"
" This is only necessary if you use "set termguicolors".
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif

set t_Co=256
set t_ut=

let base16colorspace=256
set background=dark
" colorscheme forest-night
" colorscheme base16-eighties
:silent! colorscheme $VIM_COLORSCHEME

syntax enable " enable syntax processing

" hi ColorColumn guibg=NONE ctermbg=19 " columns like line limit
" hi Normal guibg=NONE ctermbg=NONE " No background
" hi VertSplit ctermbg=NONE guibg=NONE
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
" hi SignColumn guibg=NONE ctermbg=NONE " transparent gutter
hi LineNr guibg=NONE ctermbg=NONE " transparent line numbers
" hi CursorLine ctermbg=NONE " transparent cursor line

" Spaces & Tabs
" ----------------------
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=2        " indentation with << and >>
set shiftround          " use multiple of shitwidth when indenting with < and >
set autoindent          " autoindent lines
set copyindent          " copy the indentation on autoindenting

nmap <leader><tab> :retab<cr>
nmap <leader>ts :%s/\t/    /g

" UI Config
" ----------------------
set number                " show line numbers
set cursorline            " highlight current line
filetype indent plugin on " load filetype-specific indent files
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to.
set showmatch             " highlight matching [{()}]
set ruler                 " line/character numbers bottom right
set colorcolumn=81        " show line at 81 chars, stop before the line
set noshowmode            " leave statusline to handle this

" change cursor in different modes
" ----------------------
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Searching
" ----------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        " case-sensitive otherwise

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>
" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" Folding
" ----------------------
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" Movement
" ----------------------
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Window Management
" ----------------------
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open new panes to right and bottom
set splitbelow
set splitright

" Leader Shortcuts
" ----------------------
let mapleader=","      " leader is comma

nnoremap <leader>rd :redraw!<CR> " Redraw the window (force)

" toggle scrolloff between 999 and 0. 999 keeps line center screen
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" toggle paste mode
set pastetoggle=<leader>p

" select text that was just pasted
nnoremap <leader>v V`]

" Buffer navigation
" ----------------------
nmap qq :bd<cr> " close current buffer
nnoremap <leader>bd :bufdo bd<CR> " close all buffers
nnoremap <silent> <tab> :bnext<CR> " Use tab to move to next buffer
nnoremap <silent> <s-tab> :bprevious<CR> " use shift-tab to move to prev buffer
map <leader><leader> <c-^> " Switch between last two files

nnoremap <leader>fp :cd %:p:h<CR> " set pwd to that of current file/buffer

" Quickly edit/reload the vimrc file
" ----------------------
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Automatically source files named .vimrc when the buffer is written
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }

" Text wrapping
" -------------------
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

" Movement
" -------------------
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Zoom
" -------------------
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
        \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" vim-jsx / vim-jsx-pretty
" -------------------------------
" let g:vim_jsx_pretty_colorful_config = 1
let g:jsx_ext_required = 1

" vim-gitgutter
"--------------------------------
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif
" let g:gitgutter_sign_allow_clobber = 1

" Coc
" -------------------------------

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <silent><expr> <C-o>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" restart when tsserver gets wonky
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>

" https://github.com/marlonfan/coc-phpls/issues/46
nmap <leader>ri :CocCommand intelephense.index.workspace<CR>

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

call coc#config('diagnostic.displayByAle', 1)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" vim-javascript
" ----------------------
" https://git.io/fjg3M
hi def link jsObjectKey Label

" JSDoc
" ----------------------
nmap <leader>jd :JsDoc<cr>
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1

" Vimux
" ----------------------
map <leader>X :VimuxPromptCommand<CR>
map <leader>x :VimuxRunLastCommand<CR>
map <leader>t :call VimuxRunCommand("!!")<CR>
" map <leader>r :!refchrome<CR>

" Multiple cursors
" ----------------------
" let g:multi_cursor_exit_from_insert_mode = 0
" let g:multi_cursor_exit_from_visual_mode = 1

" Ale
" ----------------------
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%s [%severity%%/code%]'
nnoremap <leader>af :ALEFix<cr>
nnoremap <leader>ad :ALEDetail<cr>
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_php_phpstan_executable = './vendor/bin/phpstan'

let g:ale_linters = {
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'scss-lint', 'stylelint'],
\   'less': ['prettier', 'stylelint'],
\   'javascript': ['eslint', 'stylelint'],
\   'jsx': ['eslint', 'stylelint'],
\   'sh': ['shellcheck'],
\   'Dockerfile': ['hadolint'],
\   'blade': ['htmlhint', 'prettier'],
\   'html': ['htmlhint', 'prettier'],
\   'markdown': ['write-good'],
\   'php': ['php'],
\}

" \   'php': ['php', 'langserver', 'phpcs', 'phpmd'],

let g:ale_fixers = {
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'less': ['prettier', 'stylelint'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'json': ['fixjson'],
\   'blade': ['prettier'],
\   'yaml': ['prettier'],
\   'html': ['tidy', 'prettier'],
\   'php': ['prettier'],
\}

let g:ale_linter_aliases = {
\ 'javascript': ['css'],
\ 'typescriptreact': ['typescript'],
\ 'jsx': ['css']
\}
" \   'php': ['prettier'],

" Nerdtree
" ----------------------
" How can I close vim if the only window left open is a NERDTree?
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
"   \ && b:NERDTree.isTabTree()) | q | endif

" let NERDTreeShowHidden=1
" let NERDTreeMinimalUI = 1
" let NERDTreeAutoDeleteBuffer = 1
" let g:NERDTreeChDirMode=2
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" let g:explorer.file.showHiddenFiles

" map <leader>nt :NERDTreeToggle<CR>
nmap <leader>nt :CocCommand explorer<CR>
map <D-1> :NERDTreeToggle<CR>

" explorer.vim
" let g:coc_explorer = {
" \   "explorer.icon.enableNerdfont": v:true,
" \   "explorer.file.showHiddenFiles": v:true,
" \ }

" let g:coc_user_config = g:coc_explorer

" fzf
" ----------------------
nmap <C-p> :Files .<CR>
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

" Goyo
" ----------------------
nmap <leader>Z :Goyo<cr>


" Lightline
" ----------------------
" \  'colorscheme': 'forest_night',
let g:lightline = {
\  'colorscheme': 'base16',
\ }

let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ],
\ }

" let g:lightline.component_function = {
" \  'cocstatus': 'coc#status'
" \ }

let g:lightline.component_expand = {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
\  'readonly': 'error',
\  'linter_warnings': 'warning',
\  'linter_errors': 'error',
\ }

let g:lightline.active = {}
let g:lightline.active.right = [
\ ['lineinfo'], ['percent'], ['filetype'],
\   [ 'readonly',
\       'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
\ ]

let g:lightline#ale#indicator_checking = '' " Linting/Loading Wheel etc
let g:lightline#ale#indicator_warnings = "⚠ "
let g:lightline#ale#indicator_errors = "✖ "
let g:lightline#ale#indicator_ok = ""

" Editorconfig
" -------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

nmap <silent> mn <Plug>(coc-bookmark-next)
nmap <silent> mp <Plug>(coc-bookmark-prev)
nmap <silent> mm <Plug>(coc-bookmark-toggle)

" vim-bookmarks
" -------------------
" Prevent clashes with keybindings when in NERDTree
" let g:bookmark_no_default_key_mappings = 1

" function! BookmarkMapKeys()
"   nmap mm :BookmarkToggle<CR>
"   nmap mn :BookmarkNext<CR>
"   nmap mp :BookmarkPrev<CR>
"   nmap mx :BookmarkClearAll<CR>
" endfunction

" function! BookmarkUnmapKeys()
"   unmap mm
"   unmap mn
"   unmap mp
"   unmap mx
" endfunction

" autocmd BufEnter * :call BookmarkMapKeys()
" autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" vim-indent-guides
" https://github.com/nathanaelkane/vim-indent-guides
" -----------------
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1

let g:echodoc_enable_at_startup = 1


let g:phpcd_autoload_path = 'vendor/autoload.php'

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" let g:context#commentstring#table['typescriptreact'] = {
" \ 'jsComment' : '// %s',
" \ 'jsImport' : '// %s',
" \ 'jsxStatment' : '// %s',
" \ 'jsxRegion' : '{/*%s*/}',
" \ 'jsxTag' : '{/*%s*/}',
" \}

" This prevents syntax hilighting breaking on templatte strings
" when part of bigger files. Can slow vim down quite a bit though
autocmd BufEnter *.{js,ts,jsx,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,ts,jsx,tsx} :syntax sync clear

" nmap <silent> <C-c> <Plug>(coc-cursors-position)
" nmap <silent> <C-d> <Plug>(coc-cursors-word)
" xmap <silent> <C-d> <Plug>(coc-cursors-range)
" " use normal command like `<leader>xi(`
" nmap <leader>x  <Plug>(coc-cursors-operator)
" nmap <silent> <C-d> <Plug>(coc-cursors-word)*
" xmap <silent> <C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

" nmap <expr> <silent> <C-d> <SID>select_current_word()
" function! s:select_current_word()
"   if !get(g:, 'coc_cursors_activated', 0)
"     return "\<Plug>(coc-cursors-word)"
"   endif
"   return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
