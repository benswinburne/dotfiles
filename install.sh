#!/bin/bash

# check not run by root
if [ "$(id -u)" == "0" ]; then
  echo "Do not run this script as root" 1>&2
  exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# xcode-select --install
mas install 497799835 # because the command line tools never works with node
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license accept

 # install homebrew if it's missing
if ! command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e \
  	"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# HOMEBREW_NO_AUTO_UPDATE=1
read -pr "Homebrew Bundle (any key)"
brew bundle
brew bundle cleanup --force
# HOMEBREW_NO_AUTO_UPDATE=0

# Sensible Mac Defaults
read -pr "Mac Defaults (any key)"
echo "Configuring MacOS defaults"
./.osx
echo "Finished MacOS defaults"

# Clean up the default dock programs
read -pr "Dock Cleanup (any key)"
dockutil --remove 'System Preferences' --allhomes
dockutil --remove 'Music' --allhomes
dockutil --remove 'iBooks' --allhomes
dockutil --remove 'App Store' --allhomes
dockutil --remove 'Photos' --allhomes
dockutil --remove 'Maps' --allhomes
dockutil --remove 'Messages' --allhomes
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
dockutil --remove 'News' --allhomes
dockutil --remove 'TV' --allhomes
dockutil --remove 'Podcasts' --allhomes
dockutil --add /Applications/Google\ Chrome.app --position 1
dockutil --add /Applications/iTerm.app --position 2
dockutil --add /Applications/Slack.app --position 4

# Bye itunes (hopefully?!)
# sudo chmod -x /Applications/Music.app

# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist # Disable spotlight
#(cd /System/Library/CoreServices/; sudo mv Search.bundle/ Search2.bundle)
# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# /usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c \
#   "Set AppleSymbolicHotKeys:64:enabled false"

read -pr "Restart Mac services (any key)"
killall Dock
killall Finder
killall SystemUIServer

# read -p "Open some apps for the first time (any key)"
open /Applications/Clocker.app/
open /Applications/Noizio.app/
open /Applications/Docker.app/
open /Applications/Flux.app/
open /Applications/KeepingYouAwake.app/
open /Applications/Dropbox.app/
open /Applications/Alfred\ 4.app/
open /Applications/Docker.app/
open /Applications/Muzzle.app/
open /Applications/Rectangle.app/

read -pr "Wait for dropbox"

# read -p "Pip installations"
# # pip install howdoi --user
# # pip install cfn-lint --user # cfn linting
# # pip install websocket-client

read -pr "PHP Setup (any key)"

echo '' | pecl install xdebug
echo '' | pecl install memcached

composer global require \
  phpstan/phpstan \
  phpunit/phpunit \
  dealerdirect/phpcodesniffer-composer-installer \
  phpcompatibility/php-compatibility \
  flickerleap/phpmd

read -pr "Certificate setup (any key)"
# Certificate
# https://blog.filippo.io/mkcert-valid-https-certificates-for-localhost/
brew install mkcert
mkdir -p ~/.localcert
pushd . || return
cd ~/.localcert || return
mkcert localhost 127.0.0.1 0.0.0.0 *.eu.ngrok.io *.ngrok.io
mkcert -install
mv localhost+4.pem localhost.pem
mv localhost+4-key.pem localhost-key.pem
popd || return

# FZF
read -pr "FZF Setup"
/usr/local/opt/fzf/install \
  --no-update-rc \
  --completion \
  --key-bindings \
  --no-fish \
  --no-zsh

read -pr "Yarn global packages"
yarn global add bundle-phobia-cli \
  eslint_d \
  package-size \
  fixjson \
  dynamodb-admin \
  htmlhint \
  dockerfile-language-server-nodejs \
  bash-language-server \
  bitly-cli-client \
  create-react-app \
  cubejs-cli \
  dynamodump \
  gzip-size-cli \
  hs \
  intelephense \
  package-size \
  remotedebug-ios-webkit-adapter \
  yahoo-stocks-cli \
  yalc \
  aws-cdk \
  zeromq \
  node-gyp

# english-dictionary-cli \
#zmq
# https://github.com/nodejs/node-gyp/blob/master/macOS_Catalina.md

# Laravel & Valet
read -pr "Valet (any key)"
mkdir -p ~/Sites
composer global require laravel/valet
export PATH=~/.composer/vendor/bin:$PATH
valet install
(cd ~/Sites && valet park)
valet start
composer global require tightenco/lambo

# MySQL
# ---------------
sudo /usr/local/opt/mysql/bin/mysql.server stop
# mysql_secure_installation
# mysql_upgrade -u root

# Symlink all the things
read -pr "Symlinks (any key)"
ln -sf ~/.dotfiles/.npmrc ~/.npmrc
ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/.gitignore ~/.gitignore
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.ansiweatherrc ~/.ansiweatherrc
ln -sf ~/.dotfiles/.hushlogin ~/.hushlogin
ln -sf ~/.dotfiles/.editorconfig ~/.editorconfig
ln -sf ~/.dotfiles/.agignore ~/.agignore
ln -sf ~/.dotfiles/phpcs.xml ~/phpcs.xml
ln -sf ~/.dotfiles/.prettierrc ~/.prettierrc
ln -sf ~/.dotfiles/.prettierignore ~/.prettierignore
ln -sf ~/.dotfiles/.tidyrc ~/.tidyrc

# AWS
# ----------------
mkdir -p ~/Dropbox/.aws
if ! [ -L ~/.aws ]; then rm -rf ~/.aws; ln -s ~/Dropbox/.aws ~/.aws; fi

# SSH
read -p "Vim Plugins (any key)"
mkdir -p ~/Dropbox/.ssh
if ! [ -L ~/.ssh ]; then rm -rf ~/.ssh; ln -s ~/Dropbox/.ssh ~/.ssh; fi
if ! [ -L ~/.siege ]; then rm -rf ~/.siege; ln -s ~/Dropbox/.siege ~/.siege; fi
sudo find ~/.ssh/* -type f -exec chmod 0600 {} \;

# Fonts
# cp ~/.dotfiles/fonts/* ~/Library/Fonts/.

source ~/.bash_profile

# Sublime
# mkdir -p ~/Dropbox/Sublime/User
# pushd . || return
# mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
# if ! [ -L ./User ]; then
  # rm -r User; ln -s ~/Dropbox/Sublime/User
  # rm -rf ~/Dropbox/Sublime/User
# fi
# popd || return

# Vim
read -pr "Vim Plugins (any key)"
mkdir -p ~/.vim
ln -sf ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.vim ~/.vim
vim -u ~/.vim/.vimrc.plug '+PlugUpdate' '+qall'

# Tmux
read -pr "Tmux Plugins (any key)"
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Docker
read -p "Docker (any key)"

ln -sf /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion \
	"$(brew --prefix)/etc/bash_completion.d/docker"
ln -sf /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion \
	"$(brew --prefix)/etc/bash_completion.d/docker-machine"
ln -sf /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion \
	"$(brew --prefix)/etc/bash_completion.d/docker-compose"

# ECR Credentials
# go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
mkdir -p ~/.docker/
ln -sf ~/Dropbox/.docker/config.json ~/.docker/config.json

read -pr "Default Applications (any key)"

# Default applications
sudo touch /usr/local/outset/login-every/duti.sh
sudo chmod +x /usr/local/outset/login-every/duti.sh
echo "duti ~/.dotfiles/duti/" | sudo tee /usr/local/outset/login-every/duti.sh
duti ~/.dotfiles/duti/

# This repo
echo "Setting remote URL for this dotfiles repo"
git remote set-url origin git@github.com:benswinburne/dotfiles.git

# Folders I inevitably make later
mkdir -p ~/Sites
mkdir -p ~/Sites/work
mkdir -p ~/Sites/playground
mkdir -p ~/Downloads/Torrents/Complete
mkdir -p ~/Downloads/Torrents/.pending

read -pr "Finder Shortcuts (any key)"

# Finder shortcuts
pushd . || return
git clone git@github.com:mosen/mysides.git /tmp/mysides
cd /tmp/mysides || return
make build
build/Release/mysides add Sites \
	"file:///Users/$(whoami)/Sites/"
build/Release/mysides add Torrents \
	"file:///Users/$(whoami)/Downloads/Torrents/Complete/"
popd || return
rm -rf /tmp/mysides

# Disable crash reporting service
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ReportCrash.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist

# Clean up
read -pr "Cleaning up Brew (any key)"
brew update
brew cleanup

printf "protocol=https\\nhost=github.com\\n" | git credential-osxkeychain erase

# Add the new shell to the list of allowed shells
# sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
_USER=$(whoami)
sudo chsh -s /usr/local/bin/bash "$_USER"
