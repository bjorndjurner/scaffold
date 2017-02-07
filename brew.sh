#!/bin/sh

## INSTALL HOMEBREW WITH THE FOLLOWING LINE
## First you need to install XCode and agree
## to the terms and service
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew tap homebrew/dupes
brew tap homebrew/services
brew tap caskroom/versions

brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install android-studio
brew cask install android-file-transfer
brew cask install appcleaner
brew cask install atom
brew cask install cyberduck
brew cask install docker
brew cask install docker-toolbox
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install google-drive
brew cask install handbrake
brew cask install handbrakecli
brew cask install iterm2
brew cask install macvim
brew cask install onyx
brew cask install poedit
brew cask install slack
brew cask install skyfonts
brew cask install skype
brew cask install skype-for-business
brew cask install spotify
brew cask install the-unarchiver
brew cask install toggldesktop
brew cask install torbrowser
brew cask install transmission
brew cask install transmit
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install vlc
brew cask install zeplin

#!/bin/

    # PATH
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    export EDITOR='atom -w'

    # Owner
    export USER_NAME="Bjorn Djurner"

    # FileSearch
    function f() { find . -iname "*$1*" ${@:2} }
    function r() { grep "$1" ${@:2} -R . }

    #mkdir and cd
    function mkcd() { mkdir -p "$@" && cd "$_"; }
