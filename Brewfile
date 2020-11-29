# vi:syntax=ruby
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"
tap "wallix/awless"
tap "teamookla/speedtest"

# General programs
cask "bitwarden"
cask "aerial"
cask "alfred"
cask "keepingyouawake"
cask "dropbox"
cask "google-chrome"
cask "firefox"
cask "microsoft-edge"
cask "slack"
cask "rectangle" # window management app
cask "spotify"
cask "muzzle" # auto disable notifications
cask "fanny" # fan/cpu monitoring widget
cask "sublime-text"
cask "transmission"
cask "discord"
# cask "gimp"
# cask "vectr" # graphics
cask "flux"
cask "iterm2"
cask "private-internet-access"
cask "handbrake"

cask "vlc"
cask "now-tv-player"
cask "videostream"

# cask "qlstephen" # preview textfiles without extensions
# cask "qlmarkdown" # preview markdown
# cask "quicklook-json" # preview json

# Dev Stuff
brew "bash"
brew "coreutils"
cask "postman"
cask "tableplus"
brew "vim"
cask "visual-studio-code"
brew "tidy-html5"
brew "mkcert"
brew "nss" # for mkcert + firefox

cask "docker"
brew "docker-credential-helper-ecr"
brew "lazydocker" # docker cli
brew "dive" # docker layer cli
brew "pulumi"

# cask "sequel-pro"
# cask "homebrew/cask-versions/sequel-pro-nightly"
# cask "botframework-emulator"

# PHP
brew "php", restart_service: :changed
brew "mcrypt"
brew "composer"

# Linters
brew "hadolint" # docker
brew "shellcheck" # shell

# Terminal Utilities
brew "reattach-to-user-namespace"
brew "bash-completion"
brew "jq"
brew "ansiweather"
brew "duti"
cask "outset"
brew "fzf"
brew "hub"
brew "htop"
brew "mas"
brew "tldr"
brew "tmux"
brew "tree"
brew "cmake"
brew "dockutil"
brew "git"
brew "git-extras"
brew "git-recent"
brew "diff-so-fancy"
brew "the_silver_searcher"
brew "wget"
brew "z"
brew "watch"
cask "ngrok"
brew "yamllint"
brew "http-server"
brew "speedtest"
brew "bat"
brew "exa"
brew "dog"

# Aws
brew "awscli"
brew "aws-elasticbeanstalk"
brew "wallix/awless/awless"

# Networking
brew "netcat"
brew "nmap"

# Http utilities
brew "wrk"
brew "httpie"
brew "siege"
brew "tsung" # Load testing for http
brew "goaccess" # Http log viewer

# Java
cask "java"
# cask "java8"

# Node related
brew "node"
# brew "node@8", link: true
brew "yarn", args: ["ignore-dependencies"]
brew "yarn-completion"

# Python
brew "python"
# brew "python@2"

# Go
brew "go"

# Services
brew "memcached"
brew "redis", restart_service: :changed
brew "dnsmasq", restart_service: :changed
brew "mysql", restart_service: :changed
brew "nginx", restart_service: :changed


# Uncategorised
# -------------
#
# brew "weechat", args: ["with-aspell", "with-lua", "with-perl", "with-python@2"]
brew "zeromq" # ???
cask "flash-npapi" # Flashplayer

# Fonts
# cask "font-hack-nerd-font"
# cask "font-meslo-nerd-font"
# cask "font-meslo-for-powerline"
# cask "font-menlo-for-powerline"
cask "font-meslo-lg-nerd-font"


# This is at the bottom because if this exits because it's not signed in
# then brew bundle exits without installing anything below
mas "Clocker", id: 1056643111
mas "Keynote", id: 409183694
mas "Noizio", id: 928871589
mas "Numbers", id: 409203825
mas "Pages", id: 409201541
mas "Spark – Email App by Readdle", id: 1176895641

# mas "ColorSlurp", id: 1287239339
# mas "GarageBand", id: 682658836
# mas "iMovie", id: 408981434

