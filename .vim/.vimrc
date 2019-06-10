if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Themes
Plug 'chriskempson/base16-vim'
Plug 'sainnhe/vim-color-forest-night'

" Editor
Plug 'tpope/vim-obsession' " continuously updated session files
Plug 'farmergreg/vim-lastplace' " reopen file last position
Plug 'djoshea/vim-autoread' " automatically load file changes into buffer
Plug 'tpope/vim-rsi' " readline style insertion
Plug 'romainl/vim-cool' " search highlighting tweaks
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-buftabline' " buffer list at top of window
Plug 'editorconfig/editorconfig-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis
" Plug 'unblevable/quick-scope' " hl unique chars per word/line for f, F etc 
" Plug 'ap/vim-css-color'

" Tmux
Plug 'benmills/vimux'
Plug 'whatyouhide/vim-tmux-syntax'
Plug 'christoomey/vim-tmux-navigator'
" vim-tmux-clipboard
" vim-tmux-resizer 

" Searching
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf' ", { 'dir': '~/.fzf', 'do': './install --all' }

" Linting
Plug 'w0rp/ale'

" COC
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
" Plug 'wix/import-cost', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-jest', {'do': 'yarn install --frozen-lockfile'}

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'maximbaz/lightline-ale'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync'

" Editing

" Languages
Plug 'leshill/vim-json', { 'for': ['json'] }
Plug 'kylef/apiblueprint.vim', { 'for': ['apib', 'apiblueprint'] }
Plug 'chr4/nginx.vim', { 'for': ['conf'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }

" Javascript / Typescript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'othree/javascript-libraries-syntax.vim',
  \ { 'for': ['javascript', 'jsx', 'javascript.jsx']}
Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc',
  \ { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'on': 'JsDoc' }
Plug 'styled-components/vim-styled-components',
  \ { 'branch': 'main', 'for': ['javascript', 'jsx', 'javascript.jsx']}

" PHP

Plug 'StanAngeloff/php.vim'
Plug '2072/vim-syntax-for-PHP', { 'for': ['php'] }
Plug '2072/PHP-Indenting-for-VIm', { 'for': ['php'] }
Plug 'jwalton512/vim-blade'

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Plug 'tmhedberg/matchit'
" Plug 'sirver/ultisnips'
" Plugin 'honza/vim-snippets'
" Plug 'karlbright/qfdo.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'mattn/emmet-vim', { 'for': ['blade.php', 'html', 'css', 'javascript.jsx'] }
" Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
" Plug 'flowtype/vim-flow', { 'for': ['javascript', 'js', 'jsx', 'javascript.jsx']}
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'othree/jspc.vim'
" Plug 'mxw/vim-jsx'
" Plug 'maralla/completor.vim', { 'do': 'make js' }
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" Plug 'ervandew/supertab'
" Plug 'godlygeek/tabular'

call plug#end()

" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile
set hidden
set clipboard=unnamed
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

" Colors
" ----------------------
" https://codeyarns.com/2011/07/29/vim-chart-of-color-names/
"
" This is only necessary if you use "set termguicolors".
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set t_Co=256
set t_ut=

let base16colorspace=256
set background=dark
" colorscheme forest-night
" colorscheme base16-eighties
:silent! colorscheme $VIM_COLORSCHEME

syntax enable " enable syntax processing

hi ColorColumn guibg=NONE ctermbg=19 " columns like line limit
hi Normal guibg=NONE ctermbg=NONE " No background
hi LineNr ctermfg=NONE ctermbg=NONE
" hi VertSplit ctermbg=NONE guibg=NONE
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE " transparent gutter
hi LineNr guibg=NONE ctermbg=NONE " transparent line numbers
hi CursorLine ctermbg=NONE " transparent cursor line

" hi Tag        ctermfg=04
" hi xmlTag     ctermfg=04
" hi xmlTagName ctermfg=04
" hi xmlEndTag  ctermfg=04
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" match OverLength /\%>80v.\+/

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

nnoremap <leader><space> :set hlsearch!<CR> " turn off search highlight
nnoremap \ :Ag<SPACE> " bind \ (backward slash) to grep shortcut

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

" Coc
" -------------------------------

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" vim-javascript
" ----------------------
hi def link jsObjectKey Label " https://git.io/fjg3M

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
map <leader>r :!refchrome<CR>

" Multiple cursors
" ----------------------
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 1

" Ale
" ----------------------
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%s [%severity%%/code%]'
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>af :ALEFix<cr>

let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

" let g:ale_php_langserver_use_global = 1
" let g:ale_php_langserver_executable = '~/.composer/vendor/bin/php-language-server.php'
" let g:ale_php_phpmd_ruleset = '~/.composer/vendor/flickerleap/phpmd/ruleset.xml'

" let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_linters = {
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'scss-lint', 'stylelint'],
\   'javascript': ['eslint', 'flow', 'standard', 'stylelint'],
\   'sh': ['shellcheck'],
\   'Dockerfile': ['hadolint'],
\   'blade': ['htmlhint', 'prettier'],
\   'html': ['htmlhint', 'prettier'],
\   'markdown': ['write-good'],
\}

" \   'php': ['php', 'langserver', 'phpcs', 'phpmd'],

let g:ale_fixers = {
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'javascript': ['prettier', 'eslint', 'standard'],
\   'typescript': ['prettier', 'tslint'],
\   'json': ['fixjson'],
\   '\.blade\.php$': ['prettier'],
\   'php': ['prettier'],
\}

" Nerdtree
" ----------------------
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode=2
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

map <leader>nt :NERDTreeToggle<CR>
map <D-1> :NERDTreeToggle<CR>

" fzf
" ----------------------
nmap <C-p> :Files .<CR>
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

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

let g:lightline.component_function = {
\  'cocstatus': 'coc#status'
\ }

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
\   [ 'readonly', 'cocstatus',
\       'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
\ ]

let g:lightline#ale#indicator_checking = '' " Linting/Loading Wheel etc
let g:lightline#ale#indicator_warnings = "⚠ "
let g:lightline#ale#indicator_errors = "✖ "
let g:lightline#ale#indicator_ok = ""

" Editorconfig
" -------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" vim-bookmarks
" -------------------
" Prevent clashes with keybindings when in NERDTree
let g:bookmark_no_default_key_mappings = 1

function! BookmarkMapKeys()
  nmap mm :BookmarkToggle<CR>
  nmap mn :BookmarkNext<CR>
  nmap mp :BookmarkPrev<CR>
  nmap mx :BookmarkClearAll<CR>
endfunction

function! BookmarkUnmapKeys()
  unmap mm
  unmap mn
  unmap mp
  unmap mx
endfunction

autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

" vim-indent-guides
" https://github.com/nathanaelkane/vim-indent-guides
" -----------------
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_guide_size = 1
