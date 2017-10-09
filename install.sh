#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/services
brew tap wallix/awless

brew install dockutil
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
dockutil --remove 'Terminal' --allhomes
dockutil --remove 'Launchpad' --allhomes
dockutil --remove 'Notes' --allhomes
dockutil --remove 'FaceTime' --allhomes
dockutil --remove 'Downloads' --allhomes

brew cask install google-chrome
brew cask install iterm2
brew cask install sublime-text
brew cask install slack

dockutil --add /Applications/Google\ Chrome.app --position 1
dockutil --add /Applications/iTerm.app --position 2
dockutil --add /Applications/Sublime\ Text.app --position 3
dockutil --add /Applications/Slack.app --position 4

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
defaults write com.apple.dock wvous-bl-corner -int 10 # Lock hot corner
defaults write com.apple.finder AppleShowAllFiles true # show hidden files
defaults write com.apple.TextEdit RichText -int 0 # plain text in textedit
defaults write com.apple.ImageCapture disableHotPlug -bool true # don't open photos
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist # disable itunes buttons

defaults write com.apple.screensaver askForPasswordDelay 0
defaults write com.apple.screensaver askForPassword -bool true


# unhide user library folder

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist # Disable spotlight
#(cd /System/Library/CoreServices/; sudo mv Search.bundle/ Search2.bundle)
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c \
  "Set AppleSymbolicHotKeys:64:enabled false"


killall Dock
killall Finder
killall SystemUIServer

brew install ansiweather
brew cask install caffeine
brew cask install flux
brew cask install spotify
brew cask install spectacle
brew cask install vlc
brew cask install timing

mas install 1056643111 # Clocker - menu bar clock
mas install 1225570693 # Ulysses

# Dev stuff
pip install howdoi
brew install python
brew cask install sequel-pro
brew cask install docker
brew cask install java
brew cask install gitify # github notifications
brew install awless
brew install git
brew install bash-completion
brew install the_silver_searcher
brew install tmux
brew install reattach-to-user-namespace --with-wrap-launchctl # Make sure LaunchCtl works inside Tmux
brew install node
brew install yarn --without-node
brew install php71 --with-fpm
brew install php71-xdebug
brew install php71-memcached
brew install phpunit
brew install php-code-sniffer
brew install php-cs-fixer
brew install phpmd
brew install composer
brew install memcached
brew install mysql
brew install redis
brew install elasticsearch
brew install hub
brew install coreutils

npm -g install instant-markdown-d
npm -g install diff-so-fancy
npm -g install http-server

git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

# Laravel Valet
mkdir -p ~/Sites
composer global require laravel/valet
export PATH=~/.composer/vendor/bin:$PATH
valet install
(cd ~/Sites && valet park)
valet start

# Symlink all the things
ln -s ~/.dotfiles/npm/.npmrc ~/.npmrc
ln -s ~/.dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/git/.gitignore ~/.gitignore
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tern-project ~/.tern-project
ln -s ~/.dotfiles/.osx ~/.osx
ln -s `ls -d ~/.dotfiles`/fonts/* ~/Library/Fonts

source ~/.bash_profile


# Vim

brew install vim
brew unlink vim && brew link vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


