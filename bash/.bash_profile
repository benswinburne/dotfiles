export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

source ~/.dotfiles/bash/colours
source ~/.dotfiles/bash/php
source ~/.dotfiles/bash/ruby
source ~/.dotfiles/bash/osx
source ~/.dotfiles/bash/nodejs

alias sudo='sudo '          # Enable aliases to be sudo'ed
export EDITOR=$(which vim)  # Set up Editor
shopt -s nocaseglob					# Case-insensitive globbing (used in pathname expansion)
shopt -s histappend					# Append to the Bash history file, rather than overwriting it
shopt -s cdspell						# Autocorrect typos in path names when using `cd`

# Color LS
colorflag="-G"
alias ls="command ls $1 ${colorflag}"
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias ll="ls -lhA"

# Dotfiles & Sourcing
function sbp { source ~/.bash_profile ; }
function ebp { vim ~/.bash_profile ; }

# Navigation
function ..    { cd .. ; }
function ...   { cd ../.. ; }
function ....  { cd ../../.. ; }
function ..... { cd ../../../.. ; }

function sites      { cd ~/Sites ; }
function seedmedia  { cd ~/Sites/seedmedia ; }
function playground { cd ~/Sites/playground ; }
function dotfiles   { cd ~/.dotfiles ; }


# Utilities
function g        { git "$@"; }
# function grep     { command grep --color=auto "$@" ; }
function ip       { curl ident.me; echo; }
function localip  { ipconfig getifaddr en0 ; }
#function tunnel   { ssh -D 8080 -C -N $argv ; }

# Homebrew
function fix-brew { brew update; brew cleanup; brew cask cleanup; brew prune; }

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null |\
	  tail -n1) != *"working tree clean"* ]] && echo " •"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null |\
	  sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

prompt_prefix="λ"
prompt_user="\u"
prompt_cwd="\w"
prompt_symbol="$symbol"
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && \
  echo \"  \")\[$BLUE\]\$(parse_git_branch)"

export PS1="\[${BOLD}${GRAY}\]"
export PS1="$PS1\[${ORANGE}\]$prompt_prefix"
# export PS1="$PS1 \[${GRAY}\]$prompt_user"
export PS1="$PS1 \[$GRAY\]$prompt_cwd"
export PS1="$PS1\[$GRAY\]$prompt_git"
export PS1="$PS1 \[$WHITE\]$prompt_symbol\[$RESET\]"
export PS1="$PS1\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# init bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Lynx configuration
alias lynx="lynx -cfg=~/.lynx.conf $1"

# Replace cat with a syntax highlighted one
#alias cat='pygmentize -g $1'

# Use Hub
# https://hub.github.com/
alias git='hub'

# set -o vi
