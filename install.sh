#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

HOMEBREW_NO_AUTO_UPDATE=1

brew tap homebrew/dupes
brew tap homebrew/services
brew tap wallix/awless

brew ls --versions dockutil || brew install dockutil
brew install mas
mas signin ben.swinburne@gmail.com

dockutil --remove 'System Preferences' --allhomes
dockutil --remove 'iTunes' --allhomes
dockutil --remove 'iBooks' --allhomes
dockutil --remove 'App Store' --allhomes
dockutil --remove 'Photos' --allhomes
dockutil --remove 'Maps' --allhomes
dockutil --remove 'Reminders' --allhomes
dockutil --remove 'Contacts' --allhomes
dockutil --remove 'Calendar' --allhomes
dockutil --remove 'Siri' --allhomes
dockutil --remove 'Safari' --allhomes
dockutil --remove 'Mail' --allhomes
dockutil --remove 'Launchpad' --allhomes
dockutil --remove 'Notes' --allhomes
dockutil --remove 'FaceTime' --allhomes
dockutil --remove 'Downloads' --allhomes
dockutil --remove 'Numbers' --allhomes
dockutil --remove 'Keynote' --allhomes
dockutil --remove 'Pages' --allhomes

brew cask install google-chrome
brew cask install iterm2
brew cask install sublime-text
brew cask install slack

dockutil --add /Applications/Google\ Chrome.app --position 1
dockutil --add /Applications/iTerm.app --position 2
dockutil --add /Applications/Sublime\ Text.app --position 3
dockutil --add /Applications/Slack.app --position 4

# Bye itunes
sudo chmod -x /Applications/iTunes.app

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

defaults write NSGlobalDomain AppleShowAllExtensions -bool true # show file extensions
defaults write NSGlobalDomain _HIHideMenuBar -bool true # Hide menu bar
defaults write NSGlobalDomain AppleInterfaceStyle Dark # Dark interface

# Disable emdash and smart quotes
defaults write 'Apple Global Domain' NSAutomaticDashSubstitutionEnabled 0
defaults write 'Apple Global Domain' NSAutomaticQuoteSubstitutionEnabled 0

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms) # Keyboard repeat rate
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms) # Keyboard repeat rate
defaults write -g ApplePressAndHoldEnabled -bool false # Don't hold key for other letters

#defaults write com.apple.dock workspaces-auto-swoosh -bool NO # Disable cmd+tab between spaces
#defaults write com.apple.dock mru-spaces -bool false # Don't rerrange spaces based on use
defaults write com.apple.dock autohide-time-modifier -float 0 # Dock hide delay
defaults write com.apple.dock autohide -bool true # Dock hide automatically
defaults write com.apple.dock tilesize -int 30 # Dock height
defaults write com.apple.dock minimize-to-application -bool true # minimise into application icoe
defaults write com.apple.finder AppleShowAllFiles true # show hidden files
defaults write com.apple.TextEdit RichText -int 0 # plain text in textedit
defaults write com.apple.ImageCapture disableHotPlug -bool true # don't open photos
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist # disable itunes buttons

# unhide user library folder
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist # Disable spotlight
#(cd /System/Library/CoreServices/; sudo mv Search.bundle/ Search2.bundle)
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c \
  "Set AppleSymbolicHotKeys:64:enabled false"

# Screensaver and timeout
brew cask install aerial
defaults write com.apple.dock wvous-bl-corner -int 10 # Lock hot corner
defaults write com.apple.dock wvous-br-corner -int 5 # Bottom right screensaver
defaults -currentHost write com.apple.screensaver idleTime 300
defaults -currentHost write com.apple.screensaver CleanExit -bool true
defaults -currentHost write com.apple.screensaver askForPasswordDelay 0
defaults -currentHost write com.apple.screensaver askForPassword -bool true
defaults -currentHost write com.apple.screensaver \
  moduleDict -dict moduleName Aerial path "~/Library/Screen Savers/Aerial.saver" type 0

killall Dock
killall Finder
killall SystemUIServer

brew install ansiweather
brew cask install dropbox
brew cask install caffeine
brew cask install flux
brew cask install spotify
brew cask install spectacle
brew cask install vlc
brew cask install transmission
brew cask install alfred
brew cask install postman
brew cask install gitify # github notifications

mas install 1006087419 # SnippetsLab
mas install 1056643111 # Clocker - menu bar clock
mas install 928871589 # noizio
open /Applications/Clocker.app/
open /Applications/Noizio.app/

# Terminal applications
brew install coreutils
brew install tldr
brew install z
pip install howdoi
brew install httpie
brew install git
brew install hub
brew install bash-completion
brew install the_silver_searcher
brew install siege
brew install shellcheck
brew install z

# Languages
brew install python
brew install python@2
# brew unlink python && brew link --overwrite python
# pip2 install --upgrade pip setuptools
# pip3 install --upgrade pip setuptools
brew cask install java
brew install node
brew intall golang

# PHP
brew install php
echo '' | pecl install xdebug
echo '' | pecl install memcached
brew install phpunit
brew install php-code-sniffer
brew install php-cs-fixer
# brew install phpmd
brew install composer

# Servers
brew cask install docker
brew install memcached
brew install redis
brew install elasticsearch

# Yarn
# ----------------
brew install yarn --without-node
curl -L https://goo.gl/unNQvE > `brew --prefix`/etc/bash_completion.d/yarn

# FZF
brew install fzf
/usr/local/opt/fzf/install \
  --no-update-rc \
  --completion \
  --key-bindings \
  --no-fish \
  --no-zsh

yarn global add diff-so-fancy
yarn global add http-server
yarn global add standard
yarn global add http-server
yarn global add nodemon
yarn global add serverless
yarn global add ngrok
yarn global add yaml-lint
yarn global add fusuma
yarn global add eslint_d

# AWS
# ----------------
mkdir -p ~/Dropbox/.aws

if ! [ -L ~/.aws ]; then rm -rf ~/.aws; ln -s ~/Dropbox/.aws ~/.aws; fi

brew install awscli
brew install awsebcli
brew install awless

# Tmux
# ----------------
brew install tmux
# Make sure LaunchCtl works inside Tmux
brew install reattach-to-user-namespace --with-wrap-launchctl
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Mutt
# ----------------
# brew install mutt
# mkdir -p ~/.mutt/cache/headers
# mkdir -p ~/.mutt/cache/bodies
# touch ~/.mutt/certificates

# Weechat
# ----------------
brew install weechat --with-aspell --with-perl --with-python@2
pip install websocket-client

# Laravel Valet
# ----------------
mkdir -p ~/Sites
composer global require laravel/valet
export PATH=~/.composer/vendor/bin:$PATH
valet install
(cd ~/Sites && valet park)
valet start

composer global require tightenco/lambo

# MySQL
# ----------------
brew install mysql
brew cask install sequel-pro
mysql_secure_installation

# Symlink all the things
ln -s ~/.dotfiles/npm/.npmrc ~/.npmrc
ln -s ~/.dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/git/.gitignore ~/.gitignore
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.tern-project ~/.tern-project
ln -s ~/.dotfiles/.osx ~/.osx
ln -s ~/.dotfiles/.hushlogin ~/.hushlogin
# ln -s ~/.dotfiles/vlc/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc
ln -s ~/.dotfiles/transmission/org.m0k.transmission.plist \
  ~/Library/Preferences/org.m0k.transmission.plist

mkdir -p ~/Dropbox/.ssh
if ! [ -L ~/.ssh ]; then rm -rf ~/.ssh; ln -s ~/Dropbox/.ssh ~/.ssh; fi
if ! [ -L ~/.siege ]; then rm -rf ~/.siege; ln -s ~/Dropbox/.siege ~/.siege; fi
sudo find ~/.ssh -type f -exec chmod 600 -- {} +

# Fonts
ln -s `ls -d ~/.dotfiles`/fonts/* ~/Library/Fonts
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

source ~/.bash_profile

# Sublime
mkdir -p ~/Dropbox/Sublime/User
pushd . || return
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/

# if ! [ -L ./User ]; then
  # rm -r User; ln -s ~/Dropbox/Sublime/User
  # rm -rf ~/Dropbox/Sublime/User
# fi
popd || return

# Vim
brew install vim
# brew ls --versions vim > /dev/null 2>&1 || brew install vim
brew ls --versions vim && brew upgrade vim || brew install vim
brew unlink vim && brew link vim
ln -s ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -s `ls -d ~/.dotfiles`/.vim/* ~/.vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# echo | echo | vim +PluginInstall +qall &>/dev/null
# (cd ~/.vim/bundle/completor.vim; make js; )
yarn global add instant-markdown-d

# WTF
ln -s ~/.dotfiles/.wtf ~/.wtf

# Iterm
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.dotfiles/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Default applications
brew install duti
brew cask install outset
sudo touch /usr/local/outset/login-every/duti.sh
sudo chmod +x /usr/local/outset/login-every/duti.sh
echo "duti ~/.dotfiles/duti/" | sudo tee /usr/local/outset/login-every/duti.sh
duti ~/.dotfiles/duti/

# This repo
git remote set-url origin git@github.com:benswinburne/dotfiles.git

# Folders I inevitably make later
mkdir -p ~/Sites
mkdir -p ~/Sites/octaive
mkdir -p ~/Downloads/Torrents/Complete
mkdir -p ~/Downloads/Torrents/.pending

# Clean up
brew update
brew cleanup
brew cask cleanup
brew prune
export HOMEBREW_NO_AUTO_UPDATE=0

printf "protocol=https\\nhost=github.com\\n" | git credential-osxkeychain erase

