# vi:syntax=ruby
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/dupes"
tap "homebrew/services"
tap "universal-ctags/universal-ctags"
tap "wallix/awless"
tap "rhysd/git-brws" "https://github.com/rhysd/git-brws"
tap "teamookla/speedtest"

# General programs
cask "aerial"
cask "alfred"
cask "keepingyouawake"
cask "dropbox"
cask "google-chrome"
cask "firefox"
cask "slack"
cask "rectangle" # window management app
cask "spotify"
cask "muzzle"
cask "sublime-text"
cask "transmission"
cask "gimp"
cask "vectr" # graphics
cask "vlc"
cask "flux"
cask "iterm2"
cask "qlstephen" # preview textfiles without extensions
cask "qlmarkdown" # preview markdown
cask "quicklook-json" # preview json
mas "Clocker", id: 1056643111
# mas "GarageBand", id: 682658836
# mas "iMovie", id: 408981434
mas "Keynote", id: 409183694
mas "Noizio", id: 928871589
mas "Numbers", id: 409203825
mas "Pages", id: 409201541

# Dev Stuff
brew "bash"
brew "coreutils"
cask "postman"
# cask "sequel-pro"
cask "homebrew/cask-versions/sequel-pro-nightly"
cask "tableplus"
cask "botframework-emulator"
brew "vim"
cask "visual-studio-code"
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD"]
brew "tidy-html5"
brew "mkcert"
brew "nss" # for mkcert + firefox
cask "docker"
brew "docker-credential-helper-ecr"
brew "lazydocker" # docker cli
brew "dive" # docker layer cli

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
cask "java8"

# Node related
brew "node"
brew "node@8", link: true
brew "yarn", args: ["without-node"]
brew "yarn-completion"

# Python
brew "python"
brew "python@2"

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
brew "weechat", args: ["with-aspell", "with-lua", "with-perl", "with-python@2"]
brew "zeromq" # ???
cask "flash-npapi" # ???

# Fonts
cask "font-hack-nerd-font"

