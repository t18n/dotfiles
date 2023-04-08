#!/bin/bash

####################################################################################
# Install brew
####################################################################################
if test ! "$(command -v brew)"; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
  brew upgrade
  exit 1;
fi

HOMEBREW_PACKAGES_DUMP="$HOME/dotfiles/package_dump/brew_packages_dump"
brew bundle install --file="$HOMEBREW_PACKAGES_DUMP"
brew upgrade --cask && brew cleanup

####################################################################################
# Install runtimes
####################################################################################
if test ! "$(command -v mackup)"; then
  echo "Installing mackup..."
  brew install rtx
  exit 1;
fi

# Install runtimes with rtx
brew install rtx
rtx activate && rtx install


####################################################################################
# Install Npm packages
####################################################################################
NPM_GLOBAL_PACKAGES_DUMP="$PACKAGE_DUMP_DIR/npm_global_packages_dump"
xargs npm install --global < "$NPM_GLOBAL_PACKAGES_DUMP"


####################################################################################
# Set up links
####################################################################################
cp ~/dotfiles/mackup/.env.sample ~/dotfiles/mackup/.env && echo "✅ Copied env. Remember to double check the variables in it."
ln -s ~/dotfiles/mackup/.mackup.cfg ~/.mackup.cfg
ln -s ~/dotfiles/mackup/.mackup/ ~/.mackup
ln -s ~/dotfiles/mackup/packages ~/packages


####################################################################################
# Restore dotfiles
####################################################################################
mackup restore -f

# Start backup
./backup.sh
