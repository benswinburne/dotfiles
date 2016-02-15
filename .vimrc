set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Editor
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'matchit.zip'
" Plugin 'sirver/ultisnips'
" Plugin 'valloric/youcompleteme'
" Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'

" Themes
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'

" ??
" Plugin 'pangloss/vim-javascript'
Bundle 'vim-php/vim-composer'

" Syntax
Plugin 'scrooloose/syntastic'
" Plugin 'jelera/vim-javascript-syntax'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Frontend
" Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let base16colorspace=256

" General
" ----------------------
" disable auto backups and swap files
set nobackup
set noswapfile

" markdown formatting for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set laststatus=2
set encoding=utf-8
set backspace=2

" trim whitespace
autocmd BufWritePre * :%s/\s\+$//e

" tell it to use an undo file
set undofile

" " set a directory to store the undo history
set undodir=~/.vimundo/

" offset scroll few lines before bottom
set scrolloff=3

" Plugin Settings
" ----------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_html_tidy_exec = 'tidy5' " use tidy-html5

" ctrlp - fuzzy search
set wildignore+=*/node_modules/**
set wildignore+=*/.git/**
let g:ctrlp_custom_ignore='dist'

" Disable auto markdown preview. Use :InstantMarkdownPreview instead
let g:instant_markdown_autostart = 0
let b:javascript_fold = 0
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1

" Airline configuration
let g:airline#extensions#whitespace#enabled = 1
let g:airline_theme='base16'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" YouCompleteMe
" let g:ycm_filetype_blacklist = {
"   \ 'html' : 1
"   \}
" let g:ycm_filetype_specific_completion_to_disable = {
"   \ 'html': 1
"   \}

" using supertab to allow YCM and UltiSnips to play nice
" Set shortcuts for ycm
" let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

" if tab doesn't expand snippet, its passed to supertab which calls YCM
" shortcut from above
let g:SuperTabDefaultCompletionType = '<C-Tab>'
let g:delimitMate_expand_cr=1

" Colors
" ----------------------
syntax enable           " enable syntax processing
let base16colorspace=256
set background=dark
colorscheme base16-eighties
set t_ut=

" Spaces & Tabs
" ----------------------
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=2        " indentation with << and >>
set shiftround          " use multiple of shitwidth when indenting with < and >
set autoindent          " autoindent lines
set copyindent          " copy the indentation on autoindenting

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
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Searching
" ----------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,
                        "   case-sensitive otherwise

" Folding
" ----------------------
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" Movement
" ----------------------
" move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" highlight last inserted text
"nnoremap gV `[v`]

" Window Management
" ----------------------
" Easy window navigation
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
" Open new panes to right and bottom
" set splitbelow
" set splitright

" Leader Shortcuts
" ----------------------
let mapleader=","      " leader is comma

" Switch between last two files
map <leader><leader> <c-^>

" Markdown preview
map <leader>md :InstantMarkdownPreview<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" turn off search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" toggle scrolloff between 999 and 0. 999 keeps line center screen
:nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" toggle paste mode
set pastetoggle=<leader>p

" Nerdtree toggle
map <leader>nt :NERDTreeToggle<CR>

" select text that was jsut pasted
nnoremap <leader>v V`]

