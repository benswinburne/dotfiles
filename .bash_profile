export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.dotfiles/scripts:$PATH

BREW_PREFIX=$(brew --prefix)

source ~/.dotfiles/bash/colours

# PHP
export PATH=~/.composer/vendor/bin:$PATH

function tinker  { php artisan tinker; }
function artisan { php artisan "$@"; }
function mrs     { php artisan migrate:refresh --seed; }

# Go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# NodeJS
export PATH=${HOME}/.npm-packages/bin:$PATH
export PATH=./node_modules/.bin:$PATH

__ORIG_PATH=$PATH
function cd {
  NPMBIN=$(realpath "$@")/node_modules/.bin
  if [ -d "$NPMBIN" ]; then
   export PATH=$NPMBIN:$__ORIG_PATH
  fi

  command cd "$@";
}

# Add Python bin directories to path
python3.7 -m site &> /dev/null && PATH="$PATH:$(python3.7 -m site --user-base)/bin"
python2.7 -m site &> /dev/null && PATH="$PATH:$(python2.7 -m site --user-base)/bin"

alias sudo='sudo '          # Enable aliases to be sudo'ed
shopt -s nocaseglob					# Case-insensitive globbing (used in pathname expansion)
shopt -s histappend					# Append to the Bash history file, rather than overwriting it
shopt -s cdspell						# Autocorrect typos in path names when using `cd`

EDITOR=$(command -v vim)  # Set up Editor
export EDITOR

# Prevent duplicates and items beginning with a space in history
export HISTCONTROL=ignoreboth:erasedups

# Prevent duplicates across sessions
# PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Color LS
colorflag="-G"
# function ls() { command ls "$1" ${colorflag}; }
# alias ls="ls -"
alias la="ls -laF \${colorflag}" # all files inc dotfiles, in long format
alias ll="ls -lhA"
alias rs="fc -s"

# Dotfiles & Sourcing
function sbp { source ~/.bash_profile ; }
function ebp { vim ~/.bash_profile ; }

# Navigation
function ..    { cd .. || return; }
function ...   { cd ../.. || return; }
function ....  { cd ../../.. || return; }
function ..... { cd ../../../.. || return; }

function sites      { cd ~/Sites || return;  }
function octaive    { cd ~/Sites/octaive || return; }
function work       { cd ~/Sites/octaive || return; }
function playground { cd ~/Sites/playground || return; }
function dotfiles   { cd ~/.dotfiles || return; }

# Utilities
function g        { git "$@"; }
function nah      { git reset --hard && git clean -df; }
function ip       { curl ident.me; echo; }
function localip  { ipconfig getifaddr en0 ; }
function dict     { open "dict://$*"; }
function mkd      { mkdir -p "$@" && cd "$@" || return; }
# function grep     { command grep --color=auto "$@" ; }
# function tunnel   { ssh -D 8080 -C -N $argv ; }

# Homebrew
function fix-brew { brew update; brew cleanup; brew cask cleanup; brew prune; }

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null |\
	  tail -n1) != *"working tree clean"* ]] && echo " •"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null |\
	  sed -e '/^[^*]/d' -e "s/* \\(.*\\)/\\1$(parse_git_dirty)/"
}

prompt_prefix="λ"
# prompt_user="\u"
prompt_cwd="\\w"
prompt_symbol=""
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && \
  echo \"  \")\\[$BLUE\\]\$(parse_git_branch)"

export PS1="\\[${BOLD}${GRAY}\\]"
export PS1="$PS1\\[${ORANGE}\\]$prompt_prefix"
# export PS1="$PS1 \\[${GRAY}\\]$prompt_user"
export PS1="$PS1 \\[$GRAY\\]$prompt_cwd"
export PS1="$PS1\\[$GRAY\\]$prompt_git"
export PS1="$PS1 \\[$WHITE\\]$prompt_symbol\\[$RESET\\]"
export PS1="$PS1\\[$RESET\\]"
export PS2="\\[$ORANGE\\]→ \\[$RESET\\]"

# init bash completion
# shellcheck source=/dev/null
[ -f "$BREW_PREFIX/etc/bash_completion" ] && . "$BREW_PREFIX/etc/bash_completion"

# Lynx configuration
# alias lynx="lynx -cfg=~/.lynx.conf \$1"

# Replace cat with a syntax highlighted one
#alias cat='pygmentize -g $1'

# Use Hub https://hub.github.com/
alias git='hub'

# Enable fuzzy search etc
# shellcheck source=/dev/null
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore *.map -g ""'

# Itunes stuff
alias disable_itunes="sudo chmod -x /Applications/iTunes.app/"
alias enable_itunes="sudo chmod -x /Applications/iTunes.app/"

# Refresh chrome
alias refchrome="osascript -e 'tell application \"Google Chrome\" to tell the active tab of its first window to reload'"


# Load rupa's z if installed
# shellcheck source=/dev/null
[ -f "$BREW_PREFIX/etc/profile.d/z.sh" ] && . "$BREW_PREFIX/etc/profile.d/z.sh"

# WTF
WTF_OWM_API_KEY=$(cat ~/Dropbox/.wtf/weather)
export WTF_OWM_API_KEY
