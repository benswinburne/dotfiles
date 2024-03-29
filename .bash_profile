export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/homebrew/opt/openjdk/bin:$PATH"
export PATH=$HOME/.dotfiles/scripts:$PATH

BREW_PREFIX=$(brew --prefix)

alias axbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

export GPG_TTY=$(tty)

. ~/.envtokens
. ~/.dotfiles/bash/colours

# PHP
# export PATH=~/.composer/vendor/bin:$PATH

export COMPOSER_MEMORY_LIMIT=-1

tinker()  { php artisan tinker; }
artisan() { php artisan "$@"; }
mrs()     { php artisan migrate:fresh --seed; }
phpunit() { vendor/bin/phpunit "$@"; }
phpunit_watch() { vendor/bin/phpunit-watcher watch "$@"; }
pest()    { vendor/bin/pest "$@"; }
doc()     { docker-compose "$@"; }
alias phpunit-watch='phpunit_watch'

# Go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# NodeJS
export PATH=${HOME}/.npm-packages/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Python
export PATH=${HOME}/Library/Python/3.9/bin:$PATH

__ORIG_PATH=$PATH
function cd {
  NPMBIN=$(realpath "$@")/node_modules/.bin
  if [ -d "$NPMBIN" ]; then
   export PATH=$NPMBIN:$__ORIG_PATH
  fi

  command cd "$@";
}

function bundlephobia { bundle-phobia "$@"; }

# function tinker  { php artisan tinker; }
function ace { node ace "$@"; }
# function mrs {
#   ace migration:rollback --batch 0;
#   ace migration:run;
# }

# Add Python bin directories to path
python3.7 -m site &> /dev/null && PATH="$PATH:$(python3.7 -m site --user-base)/bin"
python2.7 -m site &> /dev/null && PATH="$PATH:$(python2.7 -m site --user-base)/bin"

alias sudo='sudo '          # Enable aliases to be sudo'ed
shopt -s nocaseglob					# Case-insensitive globbing (used in pathname expansion)
shopt -s histappend					# Append to the Bash history file, rather than overwriting it
shopt -s cdspell						# Autocorrect typos in path names when using `cd`

set -o vi
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
function octaive    { cd ~/Sites/work || return; }
function work       { cd ~/Sites/work || return; }
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

function restartaudio { sudo pkill coreaudiod; }

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

# Use Hub https://hub.github.com/
alias git='hub'

# Enable fuzzy search etc
# shellcheck source=/dev/null
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore *.map -g ""'

# Itunes stuff
alias disable_itunes="sudo chmod -x /Applications/iTunes.app/"
alias enable_itunes="sudo chmod -x /Applications/iTunes.app/"


# Load rupa's z if installed
# shellcheck source=/dev/null
[ -f "$BREW_PREFIX/etc/profile.d/z.sh" ] && . "$BREW_PREFIX/etc/profile.d/z.sh"

# WTF
WTF_OWM_API_KEY=$(cat ~/Dropbox/.wtf/weather)
export WTF_OWM_API_KEY

# Typescript
# https://github.com/Realytics/fork-ts-checker-webpack-plugin/issues/236
# https://github.com/facebook/create-react-app/issues/6792
# https://github.com/microsoft/TypeScript/issues/31048
export TSC_WATCHFILE='UseFsEventsWithFallbackDynamicPolling'

export PULUMI_CONFIG_PASSPHRASE="pulumi"

function covid { curl -s -L http://covid19.trackercli.com/"${*:-uk}"; }

export BASH_SILENCE_DEPRECATION_WARNING=1
