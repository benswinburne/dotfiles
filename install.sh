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

xcode-select --install

 # install homebrew if it's missing
if ! command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e \
  	"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# HOMEBREW_NO_AUTO_UPDATE=1
brew bundle
brew bundle cleanup --force
# HOMEBREW_NO_AUTO_UPDATE=0

# Sensible Mac Defaults
echo "Configuring MacOS defaults"
./.osx
echo "Finished MacOS defaults"

# https://github.com/mas-cli/mas/issues/164
# mas signin ben.swinburne@gmail.com

# Clean up the default dock programs
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
dockutil --remove 'News' --allhomes
dockutil --remove 'TV' --allhomes
dockutil --remove 'Podcasts' --allhomes
dockutil --add /Applications/Google\ Chrome.app --position 1
dockutil --add /Applications/iTerm.app --position 2
dockutil --add /Applications/Slack.app --position 4

# Bye itunes (hopefully?!)
sudo chmod -x /Applications/iTunes.app

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist # Disable spotlight
#(cd /System/Library/CoreServices/; sudo mv Search.bundle/ Search2.bundle)
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist -c \
  "Set AppleSymbolicHotKeys:64:enabled false"

killall Dock
killall Finder
killall SystemUIServer

open /Applications/Clocker.app/
open /Applications/Noizio.app/
open /Applications/Docker.app/

pip install howdoi --user
pip install cfn-lint --user # cfn linting
pip install websocket-client

# PHP
echo '' | pecl install xdebug
echo '' | pecl install memcached
composer global require phpstan/phpstan
composer global require phpunit/phpunit
composer global require jetbrains/phpstorm-stubs:dev-master # needed for langserv
composer global require felixfbecker/language-server
composer global require dealerdirect/phpcodesniffer-composer-installer
composer global require phpcompatibility/php-compatibility
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
composer global require flickerleap/phpmd

# Certificate
# https://blog.filippo.io/mkcert-valid-https-certificates-for-localhost/
brew install mkcert
mkdir -p ~/.localcert
pushd . || return
cd ~/.localcert
mkcert localhost 127.0.0.1 0.0.0.0 *.eu.ngrok.io *.ngrok.io
mkcert -install
mv localhost+4.pem localhost.pem
mv localhost+4-key.pem localhost-key.pem
popd || return

# FZF
/usr/local/opt/fzf/install \
  --no-update-rc \
  --completion \
  --key-bindings \
  --no-fish \
  --no-zsh

# yarn global add write-good # Naive linter for English prose. With ALE Vim
# yarn global add botpress
# yarn global add svgr
yarn global add bundle-phobia-cli \
  eslint_d \
  package-size \
  fixjson \ # JSON Linter and fixer. With Ale Vim
  dynamodb-admin \
  htmlhint \ # HTML Hinter. With ALE Vim \
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
  remotedebug-ios-webkiit-adapter \
  yahoo-stocks-cli \
  yalc \
  aws-cdk \
  english-dictionary-cli \
  zmq \
  node-gyp

# https://github.com/nodejs/node-gyp/blob/master/macOS_Catalina.md

# AWS
# ----------------
mkdir -p ~/Dropbox/.aws
if ! [ -L ~/.aws ]; then rm -rf ~/.aws; ln -s ~/Dropbox/.aws ~/.aws; fi

# Tmux
# ----------------
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Laravel & Valet
# ----------------
mkdir -p ~/Sites
composer global require laravel/valet
export PATH=~/.composer/vendor/bin:$PATH
valet install
(cd ~/Sites && valet park)
valet start
composer global require tightenco/lambo

# MySQL
# ---------------
mysql_secure_installation
mysql_upgrade -u root

# Symlink all the things
ln -sf ~/.dotfiles/.npmrc ~/.npmrc
ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/.gitignore ~/.gitignore
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.ansiweatherrc ~/.ansiweatherrc
ln -sf ~/.dotfiles/.osx ~/.osx
ln -sf ~/.dotfiles/.hushlogin ~/.hushlogin
ln -sf ~/.dotfiles/.editorconfig ~/.editorconfig
ln -sf ~/.dotfiles/.agignore ~/.agignore
ln -sf ~/.dotfiles/.ctags ~/.ctags
ln -sf ~/.dotfiles/phpcs.xml ~/phpcs.xml
ln -sf ~/.dotfiles/.prettierrc ~/.prettierrc
ln -sf ~/.dotfiles/.prettierignore ~/.prettierignore
ln -sf ~/.dotfiles/.tidyrc ~/.tidyrc
# ln -s ~/.dotfiles/vlc/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc

mkdir -p ~/Dropbox/.ssh
if ! [ -L ~/.ssh ]; then rm -rf ~/.ssh; ln -s ~/Dropbox/.ssh ~/.ssh; fi
if ! [ -L ~/.siege ]; then rm -rf ~/.siege; ln -s ~/Dropbox/.siege ~/.siege; fi
sudo find ~/.ssh -type f -exec chmod 600 -- {} +

# Fonts
# ln -s `ls -d ~/.dotfiles`/fonts/* ~/Library/Fonts
cp ~/.dotfiles/fonts/* ~/Library/Fonts/.

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
# brew install vim
# brew ls --versions vim && brew upgrade vim || brew install vim
# brew unlink vim && brew link vim
ln -s ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -s `ls -d ~/.dotfiles`/.vim/* ~/.vim
# vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
vim '+PlugUpdate' '+qall'

# Docker
# ------
# Completion
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion \
	"$(brew --prefix)/etc/bash_completion.d/docker"
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion \
	"$(brew --prefix)/etc/bash_completion.d/docker-machine"
ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion \
	"$(brew --prefix)/etc/bash_completion.d/docker-compose"

# ECR Credentials
# go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
mkdir -p ~/.docker/
ln -s ~/Dropbox/.docker/config.json ~/.docker/config.json


# WTF
ln -s ~/.dotfiles/.wtf ~/.wtf

# Default applications
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

# Finder shortcuts
pushd . || return
git clone mosen/mysides /tmp/mysides
cd /tmp/mysides || return
make build
build/Release/mysides add Sites \
	"file:///Users/$(whoami)/Sites/"
build/Release/mysides add Torrents \
	"file:///Users/$(whoami)/Downloads/Torrents/Complete/"
popd || return
rm -rf /tmp/mysides

# Disable crash reporting service
launchctl unload -w /System/Library/LaunchAgents/com.apple.ReportCrash.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist

# Clean up
brew update
brew cleanup
brew prune

printf "protocol=https\\nhost=github.com\\n" | git credential-osxkeychain erase

# Add the new shell to the list of allowed shells
# sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
# chsh -s /usr/local/bin/bash
