#!/usr/bin/env bash

# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

pushd $PWD

# ============= Install Xcode Tools ====================

# create the placeholder file that's checked by CLI updates' .dist code
# in Apple's SUS catalog
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
# find the CLI Tools update
PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
# install it
softwareupdate -i "$PROD" -v

# ============= End Xcode tools ========================


# ============= Install brew ====================

if [[ "$OSTYPE" =~ ^darwin ]] && [[ ! "$(type -P brew)" ]]; then
    echo "Installing Homebrew"

    #Skip the "Press enter to continue‚Äö√Ñ¬∂" prompt.
    true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
fi

# ============= End brew ========================

# ============= Setup Git ========================

brew install git

git config --global user.name "bjorndjurner"
git config --global user.email bjorn@djurner.net
git config --global credential.helper osxkeychain
git config --global core.editor "nano"

git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.d diff
# Unstage any files that have been added to the staging area
git config --global alias.unstage "reset HEAD --"
# Get the current branch name (not so useful in itself, but used in
# other aliases)
git config --global alias.branch-name = "!git rev-parse --abbrev-ref HEAD"
# Push the current branch to the remote "origin", and set it to track
# the upstream branch
git config --global alias.publish = "!git push -u origin $(git branch-name)"
# Delete the remote version of the current branch
git config --global alias.unpublish = "!git push origin :$(git branch-name)"
# Delete a branch and recreate it from master — useful if you have, say,
# a development branch and a master branch and they could conceivably go
# out of sync
# Pull the latest of the current branch from remote
git config --global alias.pol = "!git pull origin $(git branch-name)"
git config --global alias.recreate = "!f() { [[ -n $@ ]] && git checkout \"$@\" && git unpublish && git checkout master && git branch -D \"$@\" && git checkout -b \"$@\" && git publish; }; f"

# ============= Setup Git ========================

# ============= Clone scaffold ==================

git clone https://github.com/bjorndjurner/scaffold.git $HOME/Developer/scaffold

cd $HOME/Developer/scaffold/

git remote remove origin
git remote add origin git@github.com:bjorndjurner/scaffold.git

# ============= End Clone scaffold ==================

popd
