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
Plugin 'sirver/ultisnips'
" Plugin 'valloric/youcompleteme'
" Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ervandew/supertab'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'benmills/vimux'
Bundle 'matze/vim-move'

" Themes
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'

" Language Specific
" Plugin 'pangloss/vim-javascript'
Bundle 'vim-php/vim-composer'

" PHP
Bundle 'stephpy/vim-php-cs-fixer'
Bundle 'tobyS/pdv'
Bundle 'tobyS/vmustache'

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

" Prevent me quitting vim all the time!
" cnoreabbrev wq w<bar>bd
" cnoreabbrev q bd

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
let g:php_cs_fixer_config_file = '.php_cs'        " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

" Vimux
" ----------------------
map <leader>x :VimuxPromptCommand<CR>
map <leader>t :call VimuxRunCommand("clear; phpunit; echo;")<CR>

" Move line
" ----------------------
" let g:move_key_modifier = 'C'

" PHP Documenter
" ----------------------
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <leader>db :call pdv#DocumentWithSnip()<CR>

" Laravel Mappings
" ----------------------
nmap <Leader>lr :e app/Http/routes.php<CR>
nmap <Leader>lm :!php artisan make:

" Syntastic
" ----------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_html_tidy_exec = 'tidy5' " use tidy-html5

nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<cr>

" Airline
" ----------------------
let g:airline#extensions#whitespace#enabled = 1
let g:airline_theme='base16'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ctrlp - fuzzy search
" ----------------------
set wildignore+=*/node_modules/**
set wildignore+=*/.git/**
set wildignore+=*/vendor/**
let g:ctrlp_custom_ignore='dist'
let g:ctrlp_show_hidden = 1
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
" nnoremap <silent> <Leader>t :CtrlP<cr>
" nnoremap <silent> <leader>T :ClearCtrlPCache<cr>\|:CtrlP<cr>

" Statusline
" ----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" NERDTree
" ----------------------
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
map <leader>nt :NERDTreeToggle<CR>

" YouCompleteMe
" ----------------------
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
