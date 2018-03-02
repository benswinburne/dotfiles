set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Nerdtree related
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Lightline
Plugin 'itchyny/lightline.vim'
Plugin 'daviesjamie/vim-base16-lightline'

" Editor
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-obsession'
Plugin 'matchit.zip'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'benmills/vimux'
" Bundle 'matze/vim-move'
Plugin 'valloric/youcompleteme'
Plugin 'junegunn/fzf'
Plugin 'MattesGroeger/vim-bookmarks'

" Themes
Plugin 'chriskempson/base16-vim'

" Language Specific
Plugin 'pangloss/vim-javascript'
Plugin 'othree/jspc.vim'
Bundle 'vim-php/vim-composer'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'

" PHP
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'tobyS/pdv'
Bundle 'tobyS/vmustache'
Bundle 'arnaud-lb/vim-php-namespace'

" Syntax
Plugin 'w0rp/ale'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'kylef/apiblueprint.vim'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Frontend
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile
set hidden
set clipboard=unnamed

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

" set viminfo=%,<800,'10,/50,:100,h,f0,n~/.dotfiles/vim/cache/info
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list


" Offset scroll few lines before bottom
set scrolloff=3

" Remove the delay exiting insert mode
set ttimeoutlen=0

" Colors
" ----------------------
syntax enable           " enable syntax processing
let base16colorspace=256
set background=dark
colorscheme base16-eighties
set t_Co=256
set t_ut=
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
nnoremap <leader>bd :bufdo bd<CR>

" Redraw the window (force)
nnoremap <leader>rd :redraw!<CR>

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

" Vimux
" ----------------------
map <leader>x :VimuxPromptCommand<CR>
map <leader>t :call VimuxRunCommand("clear; phpunit; echo;")<CR>

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
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_format = '%linter%: %s'
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {
\   'javascript': ['standard'],
\}

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

" ctrlp - fuzzy search
" ----------------------
set wildignore+=*/node_modules/**
set wildignore+=*/.git/**
set wildignore+=*/vendor/**
nmap <C-p> :FZF .<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

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

" YouCompleteMe
" ----------------------
let g:ycm_filetype_blacklist = {
  \ 'html' : 1
  \}
let g:ycm_filetype_specific_completion_to_disable = {
  \ 'html': 1
  \}

" using supertab to allow YCM and UltiSnips to play nice
" Set shortcuts for ycm
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

" if tab doesn't expand snippet, its passed to supertab which calls YCM
" shortcut from above
let g:SuperTabDefaultCompletionType = '<C-Tab>'
let g:delimitMate_expand_cr=1

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Text wrapping
" -------------------
autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.txt setlocal textwidth=80

" Hardmode
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

" Things to do
" -------------------
"  Fix vim-move (closed issue about OSX)
"  bump method up shift command up
"  php code coverage ? https://github.com/joonty/vim-phpqa

" Move line
" ----------------------
" let g:move_key_modifier = 'C'

