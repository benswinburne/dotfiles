export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

source ~/.dotfiles/bash/colours
source ~/.dotfiles/bash/php
source ~/.dotfiles/bash/ruby
source ~/.dotfiles/bash/osx
source ~/.dotfiles/bash/golang
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
	[[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

prompt_user="\[${BOLD}${MAGENTA}\]\u$host"
prompt_cwd="\[$WHITE\]in \[$GREEN\]\w"
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"  \")\[$PURPLE\]\$(parse_git_branch)"
prompt_symbol="\[$WHITE\] $symbol"

export PS1="$prompt_user $prompt_cwd\[$WHITE\]$prompt_git$prompt_symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# init bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#   . `brew --prefix`/etc/bash_completion
# fi

# Lynx configuration
alias lynx="lynx -cfg=~/.lynx.conf $1"

# Add support for z
# https://github.com/rupa/z
#source ~/.dotfiles/scripts/z/z.sh

# Replace cat with a syntax highlighted one
#alias cat='pygmentize -g $1'

# Use Hub
# https://hub.github.com/
alias git='hub'

# set -o vi
