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

mas install 1056643111 # Clocker - menu bar clock
open /Applications/Clocker.app/

# Dev stuff
brew install tldr
pip install howdoi
brew install python
brew cask install sequel-pro
brew cask install docker
brew cask install java
brew cask install gitify # github notifications
brew cask install alfred
brew install httpie
brew install awscli
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

brew install fzf

/usr/local/opt/fzf/install \
  --no-update-rc \
  --completion \
  --key-bindings \
  --no-fish \
  --no-zsh

yarn global add instant-markdown-d
yarn global add diff-so-fancy
yarn global add http-server
yarn global add standard
yarn global add http-server
yarn global add nodemon

git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Laravel Valet
mkdir -p ~/Sites
composer global require laravel/valet
export PATH=~/.composer/vendor/bin:$PATH
valet install
(cd ~/Sites && valet park)
valet start

composer global require tightenco/lambo

mysql_secure_installation

# Symlink all the things
ln -s ~/.dotfiles/npm/.npmrc ~/.npmrc
ln -s ~/.dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/git/.gitignore ~/.gitignore
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tern-project ~/.tern-project
ln -s ~/.dotfiles/.osx ~/.osx
ln -s ~/.dotfiles/.hushlogin ~/.hushlogin
# ln -s ~/.dotfiles/vlc/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc
ln -s ~/.dotfiles/transmission/org.m0k.transmission.plist \
  ~/Library/Preferences/org.m0k.transmission.plist
ln -s `ls -d ~/.dotfiles`/fonts/* ~/Library/Fonts
mkdir -p ~/Dropbox/.ssh
mkdir -p ~/Dropbox/.aws
rm -rf ~/.ssh; ln -s ~/Dropbox/.ssh ~/.ssh
rm -rf ~/.aws; ln -s ~/Dropbox/.aws ~/.aws
sudo chmod 600 ~/.ssh/*

source ~/.bash_profile

# Sublime
mkdir -p ~/Dropbox/Sublime/User
pushd .
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Sublime/User
rm -rf ~/Dropbox/Sublime/User
popd

# Vim
brew install vim
brew unlink vim && brew link vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim +PluginInstall +qall &>/dev/null
echo | echo | vim +PluginInstall +qall &>/dev/null
brew install cmake # for YCM
(cd ~/.vim/bundle/YouCompleteMe; ./install.py --tern-completer )

# Iterm
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm"
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

# Clean up
brew update
brew cleanup
brew cask cleanup
brew prune
printf "protocol=https\nhost=github.com\n" | git credential-osxkeychain erase

reboot
