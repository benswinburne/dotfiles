export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/usr/local/homebrew/opt/openjdk/bin:$PATH"
export PATH=$HOME/.dotfiles/scripts:$PATH
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH=~/.composer/vendor/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

export HOMEBREW_NO_AUTO_UPDATE=0
export HOMEBREW_NO_ENV_HINTS=1

alias axbrew='arch -x86_64 /usr/local/homebrew/bin/brew'

export GPG_TTY=$(tty)

. ~/.envtokens

export CLICOLOR=1
export TERM=xterm-256color

BLACK=$(tput setaf 0)
MAGENTA=$(tput setaf 1)
GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
TEAL=$(tput setaf 6)
LIGHT_GREY=$(tput setaf 7)
DARK_GREY=$(tput setaf 8)
RED=$(tput setaf 9)
LIME=$(tput setaf 10)
GOLD=$(tput setaf 11)
WHITE=$(tput setaf 15)

BOLD=$(tput bold)
RESET=$(tput sgr0)

alias ovim="command vim"
alias oldvim="command vim"
alias vim="nvim"
alias vi="nvim"

tinker()  { php artisan tinker; }
artisan() { php artisan "$@"; }
mrs()     { php artisan migrate:fresh --seed; }
phpunit() { vendor/bin/phpunit "$@"; }
# phpunit_watch() { vendor/bin/phpunit-watcher watch "$@"; }
phpunit_watch() { phpunit-watcher watch "$@"; }
pest()    { vendor/bin/pest "$@"; }
doc()     { docker-compose "$@"; }
alias phpunit-watch='phpunit_watch'
alias pbcopynl='xargs echo -n | pbcopy' # https://stackoverflow.com/a/3482322/769237
alias pbc='xargs echo -n | pbcopy' # https://stackoverflow.com/a/3482322/769237
# random_string() { openssl rand -hex "${@:-12}"; }
random_string() { pwgen "${@:-24}" 1; }
rdm() { pwgen "${@:-24}" 1; }
bitly() { bitly-client "$@"; }
shorturl() { bitly-client "$@"; }
tinyurl() { bitly-client "$@"; }

# PHP
export COMPOSER_MEMORY_LIMIT=-1

# Go
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# NodeJS
export PATH=${HOME}/.npm-packages/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
export NODE_NO_WARNINGS=1

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

bundlephobia() { bundle-phobia "$@"; }

# function tinker  { php artisan tinker; }
ace() { node ace "$@"; }
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
g()        { git "$@"; }
nah()      { git reset --hard && git clean -df; }
ip()       { curl 4.ident.me; echo; }
localip()  { ipconfig getifaddr en0 ; }
dict()     { open "dict://$*"; }
mkd()      { mkdir -p "$@" && cd "$@" || return; }
# function grep     { command grep --color=auto "$@" ; }
# function tunnel   { ssh -D 8080 -C -N $argv ; }

restartaudio() { sudo pkill coreaudiod; }
restartbluetooth() { sudo pkill bluetoothd; }
flushdns() { dscacheutil -flushcache; sudo killall -HUP mDNSResponder; }
restartdns() { dscacheutil -flushcache; sudo killall -HUP mDNSResponder; }


# Homebrew
function fix-brew { brew update; brew cleanup; brew cask cleanup; brew prune; }

# Git branch details
# parse_git_dirty() {
# 	[[ $(git status 2> /dev/null |\
# 	  tail -n1) != *"working tree clean"* ]] && echo " •"
# }
#
# parse_git_branch() {
#   git branch --no-color 2> /dev/null |\
#     sed -e '/^[^*]/d' -e "s/* \\(.*\\)/\\1$(parse_git_dirty)/"
# }
#
# prompt_prefix="λ"
# # prompt_user="\u"
# prompt_cwd="\\w"
# prompt_symbol=""
# prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && \
#   echo \"  \")\\[$BLUE\\]\$(parse_git_branch)"

# Git branch details
parse_git_dirty() {
	[[ $(git status 2> /dev/null |\
	  tail -n1) != *"working tree clean"* ]] && echo "true" || echo "false"
}

parse_git_branch() {
  git branch --no-color 2> /dev/null |\
    sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# prompt_prefix="λ"
prompt_prefix="󰘧"
# prompt_user="\u"
prompt_cwd="\\w"
prompt_symbol=""
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && \
  if [[ \$(parse_git_dirty) == \"true\" ]]; then \
    echo \"\\[$MAGENTA\\] \\[$RESET\\]\"; \
  else \
    echo \" \"; \
  fi) \\[$BLUE\\]\$(parse_git_branch)"

#   󰊢

# export PS1="\\[${BOLD}${LIGHT_GREY}\\]"
export PS1="\\[${LIGHT_GREY}\\]"
export PS1="$PS1\\[${ORANGE}\\]$prompt_prefix"
# export PS1="$PS1 \\[${GREY}\\]$prompt_user"
export PS1="$PS1 \\[$RESET\\]\\[${LIGHT_GREY}\\]$prompt_cwd"
export PS1="$PS1\\[$LIGHT_GREY\\]$prompt_git"
export PS1="$PS1 \\[$WHITE\\]$prompt_symbol\\[$RESET\\]"
export PS1="$PS1\\[$RESET\\]"
export PS2="\\[$ORANGE\\]→ \\[$RESET\\]"

# init bash completion
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

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
[ -f "$HOMEBREW_PREFIX/etc/profile.d/z.sh" ] && . "$HOMEBREW_PREFIX/etc/profile.d/z.sh"

# WTF
# WTF_OWM_API_KEY=$(cat ~/Dropbox/.wtf/weather)
# export WTF_OWM_API_KEY

# Typescript
# https://github.com/Realytics/fork-ts-checker-webpack-plugin/issues/236
# https://github.com/facebook/create-react-app/issues/6792
# https://github.com/microsoft/TypeScript/issues/31048
# export TSC_WATCHFILE='UseFsEventsWithFallbackDynamicPolling'

export BASH_SILENCE_DEPRECATION_WARNING=1

export no_proxy=127.0.0.1

. "$HOME/.local/bin/env"
