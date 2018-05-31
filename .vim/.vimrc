if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Themes
Plug 'chriskempson/base16-vim'

" Editor
Plug 'tpope/vim-obsession'
Plug 'sirver/ultisnips'
Plug 'universal-ctags/ctags'
" Plugin 'honza/vim-snippets'

Plug 'rking/ag.vim'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'editorconfig/editorconfig-vim'
Plug 'benmills/vimux'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf' ", { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'MattesGroeger/vim-bookmarks'
Plug 'w0rp/ale'
Plug 'sjl/gundo.vim'

" Completion
Plug 'maralla/completor.vim', { 'do': 'make js' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'

" Nerdtree related
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/matchit'
Plug 'Raimondi/delimitMate'
" Bundle 'matze/vim-move'

" Language Specific
" Plugin 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'jsx', 'javascript.jsx']}
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'jsx', 'javascript.jsx'], 'on': 'JsDoc' }
" Plug 'moll/vim-node', { 'for': ['javascript', 'jsx', 'javascript.jsx'] }
Plug 'leshill/vim-json', { 'for': ['json'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'kylef/apiblueprint.vim', { 'for': ['apib', 'apiblueprint'] }

" Markdown
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}

" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'stephpy/vim-php-cs-fixer'
" Plug 'arnaud-lb/vim-php-namespace'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'othree/jspc.vim'
" Plug 'mxw/vim-jsx'
call plug#end()

" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile
set hidden
set clipboard=unnamed
set nocompatible              " be iMproved, required

" Mouse
" ----------------------
set mouse=a

" Set filetypes for unknown extensions
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.apib set filetype=apiblueprint

set laststatus=2
set encoding=utf-8
set backspace=2

" Trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Tell it to use an undo file
set undofile

" Set a directory to store the undo history
set undodir=~/.dotfiles/vim/cache/undo

" Set a directory to store vim state etc
set viminfo=<800,'10,/50,:100,h,f0,n~/.viminfo

" Offset scroll few lines before bottom
set scrolloff=3

" Remove the delay exiting insert mode
set ttimeoutlen=0

" Colors
" ----------------------
" https://codeyarns.com/2011/07/29/vim-chart-of-color-names/
syntax enable " enable syntax processing
let base16colorspace=256
set background=dark
:silent! colorscheme $VIM_COLORSCHEME
set t_Co=256
set t_ut=
hi CursorLine ctermbg=NONE
" Needed for material but not eighties
hi ColorColumn guibg=NONE ctermbg=19
hi Normal guibg=NONE ctermbg=NONE
" hi LineNr ctermfg=NONE ctermbg=NONE
hi VertSplit ctermbg=NONE guibg=NONE
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE
" transparent gutter
hi SignColumn guibg=NONE ctermbg=NONE
" transparent line numbers
hi LineNr guibg=NONE ctermbg=NONE
hi def link jsObjectKey Label
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

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

" change cursor in different modes
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

" highlight last inserted text
"nnoremap gV `[v`]

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

" Switch between last two files
map <leader><leader> <c-^>

" Markdown preview
map <leader>md :InstantMarkdownPreview<CR>

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" toggle scrolloff between 999 and 0. 999 keeps line center screen
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" toggle paste mode
set pastetoggle=<leader>p

" select text that was just pasted
nnoremap <leader>v V`]

" Close all buffers
nmap qq :bd<cr>
nnoremap <leader>bd :bufdo bd<CR>

" Redraw the window (force)
nnoremap <leader>rd :redraw!<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" Quickly edit/reload the vimrc file
" ----------------------
nmap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Automatically source files named .vimrc when the buffer is written
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END

" PHP CS Fixer
" ----------------------
let g:php_cs_fixer_level = "psr2"                 " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_config_fire = ".php_cs"        " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

" JSDoc
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

" Laravel Mappings
" ----------------------
nmap <Leader>lr :e app/Http/routes.php<CR>
nmap <Leader>la :!php artisan
nmap <Leader>lmr :!php artisan migrate:refreh --seed
nmap <Leader>lm :!php artisan migrate

" Ale
" ----------------------
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s'
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <leader>af :ALEFix<cr>
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {
\   'javascript': ['standard'],
\}

" Tern
" let g:tern_show_argument_hints = 'on_hold'
" let g:tern_show_signature_in_pum = 1
" autocmd FileType javascript,javascript.jsx setlocal omnifunc=tern#Complete
" autocmd FileType javascript,javascript.jsx nnoremap <silent> <buffer> gb :TernDef<CR>

" Nerdtree
" ----------------------
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
  \ && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Tags
" ----------------------
nmap <leader>ct :TagbarToggle<CR>

" fzf
" ----------------------
nmap <C-p> :Files .<CR>
nnoremap <leader>P :Files <C-R>=expand('%:h')<CR><CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" NERDTree
" ----------------------
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
map <leader>nt :NERDTreeToggle<CR>
map <D-1> :NERDTreeToggle<CR>

" Lightline
" ----------------------
let g:lightline = {
\   'colorscheme': 'base16'
\ }

let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ }

autocmd User ALELint call lightline#update()

let g:SuperTabDefaultCompletionType = "<c-n>" " Cycle down the list
let g:SuperTabCrMapping = 1 "

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger = "<c-o>"

let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
      return pumvisible() ? "\<C-y>" : "\<CR>"
    endif
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-R>=ExpandSnippetOrCarriageReturn()\<CR>" : "\<CR>"

" map <buffer> <tab> <Plug>CompletorCppJumpToPlaceholder
" imap <buffer> <tab> <Plug>CompletorCppJumpToPlaceholder

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Text wrapping
" -------------------
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

" Movement
" -------------------
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Use tab and shift tab to switch between buffers
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR>
 \ :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR>
 \ :write<CR> :endif<CR>:bprevious<CR>

" Things to do
" -------------------
"  Fix vim-move (closed issue about OSX)
"  bump method up shift command up
"  php code coverage ? https://github.com/joonty/vim-phpqa
" make vim emmet work properly
" https://stackoverflow.com/a/3476411/769237

" Move line
" ----------------------
" let g:move_key_modifier = 'C'

