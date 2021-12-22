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
cask "dropbox"
cask "slack"
cask "spotify"
cask "transmission"
cask "discord"
cask "iterm2"
cask "private-internet-access"
# cask "private-internet-access", args: { no_quarantine: true }
cask "signal"
cask "alfred"
cask "rectangle" # window management app

# Video
cask "vlc"
cask "airflow" # cast anything to chromecast
cask "handbrake"

# Design tools
cask "affinity-designer"
cask "affinity-photo"

# Browsers
cask "google-chrome"
cask "firefox"
cask "microsoft-edge"

# Mac OS tools
cask "aerial" # screensaver
brew "duti" # Required for setting preferences
brew "tccutil" # Required for setting preferences
brew "trash" # CLI tool that moves files or folder to the trash
brew "wifi-password" # Show the current WiFi network password
cask "macmediakeyforwarder" # fix media keys / prioritise spotify
cask "keepingyouawake" # don't let screen sleep
cask "dozer" # Tool to hide status bar icons
cask "muzzle" # auto disable notifications
cask "flux" # brightness / yellowness by time/location

# QuickLook plugins
cask "qlcolorcode" # renders source code with syntax highlighting
cask "qlmarkdown" # preview markdown
cask "qlstephen" # preview textfiles without extensions
# cask "webpquicklook"
cask "quicklook-json" # preview json

# Color Picker plugins
cask "colorpicker-skalacolor"

# Shells
# Note: Don't forget to add shells to `/etc/shells` before running `chsh`.
brew "bash"
brew "bash-completion"

# Dev Stuff
cask "sublime-text"
brew "act" # local github actions runner
brew "coreutils"
cask "postman"
cask "tableplus"
brew "vim"
cask "visual-studio-code"
brew "tidy-html5"
brew "mkcert"
brew "nss" # for mkcert + firefox
brew "pulumi"
cask "pop" # remote pair programming
cask "gpg-suite" # gpg signing tools
brew "openjdk"
brew "ruby"
brew "terraform"

# Docker tools
cask "docker"
brew "docker-credential-helper-ecr"
brew "lazydocker" # docker cli
brew "dive" # docker layer cli

# Arduinotools
cask "arduino"
brew "arduino-cli"
brew "astyle" # formatter

# PHP
brew "php@7.4", restart_service: :changed
brew "mcrypt"
brew "composer"

# Linters
brew "hadolint" # docker
brew "shellcheck" # shell
brew "jsonlint" # json
brew "yamllint" # yaml
brew "xmlstarlet" # includes xmllint

# Terminal Utilities
brew "reattach-to-user-namespace"
brew "jq"
brew "ansiweather"
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

# Node related
brew "node@14"
brew "yarn", args: ["ignore-dependencies"]
brew "yarn-completion"

# Languages
brew "python@3.9"
brew "java"
brew "go"

# Services
brew "memcached"
brew "redis", restart_service: :changed
brew "dnsmasq", restart_service: :changed
brew "mysql", restart_service: :changed
brew "nginx", restart_service: :changed


# Uncategorised
# brew "weechat", args: ["with-aspell", "with-lua", "with-perl", "with-python@2"]

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
mas "Xcode", id: 497799835
mas "iMazing HEIC Converter", id: 1292198261
