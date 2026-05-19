# vi:syntax=ruby

# tap "hashicorp/tap"

# Asked for at the top because they require a password
# They're lower down too where they belong for organisational reasons
cask "nordvpn"
cask "gpg-suite" # gpg signing tools

# General programs
cask "bitwarden"
cask "dropbox"
cask "slack"
cask "spotify"
cask "transmission"
cask "discord"
# cask "iterm2"
# cask "private-internet-access"
# cask "private-internet-access", args: { no_quarantine: true }
cask "signal"
cask "alfred"
cask "rectangle" # window management app

# Video
cask "vlc"
cask "airflow" # cast anything to chromecast
cask "handbrake-app"

# Design tools
cask "affinity"
cask "bambu-studio"

# Browsers
cask "google-chrome"
cask "firefox"
cask "microsoft-edge"

# Mac OS tools
cask "aerial" # screensaver
brew "tccutil" # Required for setting preferences
brew "trash" # CLI tool that moves files or folder to the trash
# cask "macmediakeyforwarder" # fix media keys / prioritise spotify
cask "keepingyouawake" # don't let screen sleep
# cask "dozer" # Tool to hide status bar icons
cask "muzzle" # auto disable notifications
cask "flux-app" # brightness / yellowness by time/location
cask "imazing-converter" # HEIC converter
# brew "clocker" # taskbar clock
cask "tripmode"
cask "obs" # streaming software
cask "nordvpn" # vpn
cask "kap" # screenshoter
cask "balenaetcher" # iso writer
cask "beardedspice" # media key forwarder
cask "jordanbaird-ice" # taskbar manager
cask "topnotch" # black bar for the notch

# QuickLook plugins
cask "qlcolorcode" # renders source code with syntax highlighting
cask "qlmarkdown" # preview markdown
cask "qlstephen" # preview textfiles without extensions
# cask "webpquicklook"
cask "quickjson" # preview json

# Color Picker plugins
# cask "colorpicker-skalacolor"

# Shells
# Note: Don't forget to add shells to `/etc/shells` before running `chsh`.
brew "bash"
brew "bash-completion@2"

# Dev Stuff
cask "sublime-text"
brew "act" # local github actions runner
brew "coreutils"
cask "postman"
cask "tableplus"
brew "vim"
brew "neovim"
cask "visual-studio-code"
brew "tidy-html5"
brew "mkcert"
brew "nss" # for mkcert + firefox
brew "pulumi"
# cask "pop-app"
cask "gpg-suite" # gpg signing tools
brew "gnupg" # gpg https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/
brew "openjdk"
brew "ruby"
# brew "hashicorp/tap/terraform"
brew "opentofu"
brew "pwgen"
brew "lazygit"
brew "sem-cli"

# Docker tools
cask "docker-desktop"
brew "docker-credential-helper-ecr"
brew "lazydocker" # docker cli
brew "dive" # docker layer cli

# Arduinotools
cask "arduino-ide"
brew "arduino-cli"
brew "astyle" # formatter

# PHP
brew "php@8.3", restart_service: :changed
brew "autoconf" # for pecl extension compilation
brew "composer"

# Linters
brew "hadolint" # docker
brew "shellcheck" # shell
brew "jsonlint" # json
brew "yamllint" # yaml
brew "xmlstarlet" # includes xmllint
brew "cfn-lint" # cloudformation

# Terminal Utilities
# brew "reattach-to-user-namespace"
brew "jq"
# brew "ansiweather"
# cask "outset"
brew "fzf"
brew "hub"
brew "htop"
brew "mas"
brew "tldr"
brew "tmux"
brew "tree"
brew "cmake"
brew "git"
brew "git-extras"
brew "git-recent"
brew "diff-so-fancy"
# brew "the_silver_searcher" # maybe don't need any more
brew "ripgrep"
brew "wget"
brew "z"
brew "watch"
cask "ngrok"
brew "http-server"
brew "bat"
brew "eza" # modern ls
brew "doge" # dig but better (was dog/dog-community)

# Aws
brew "awscli"
brew "aws-elasticbeanstalk"
# brew "wallix/awless/awless"

# Networking
brew "netcat"
brew "nmap"

# Http utilities
brew "wrk"
brew "httpie"
brew "siege"
# brew "tsung" # Load testing for http
brew "goaccess" # Http log viewer

# Node related
brew "node", link: true
# brew "node@22", link: true
brew "yarn", args: ["ignore-dependencies"]
brew "yarn-completion"
brew "watchman" # makes node watcher (jest watch) work well

# Languages
brew "python@3.9"
brew "pipx"
# brew "java" # installed manually in x86 arch
brew "go"

# Services
brew "memcached"
brew "redis", restart_service: :changed
# brew "dnsmasq", restart_service: :changed
# brew "mysql", restart_service: :changed
# brew "nginx", restart_service: :changed


# Uncategorised
# brew "weechat", args: ["with-aspell", "with-lua", "with-perl", "with-python@2"]

# Fonts
# cask "font-hack-nerd-font"
# cask "font-meslo-nerd-font"
# cask "font-meslo-for-powerline"
# cask "font-menlo-for-powerline"
cask "font-meslo-lg-nerd-font"
