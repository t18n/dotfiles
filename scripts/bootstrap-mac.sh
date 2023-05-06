#!/bin/bash

####################################################################################
# Set up links
####################################################################################
cp ~/dotfiles/mackup/.env.sample ~/dotfiles/mackup/.env && echo "✅ Copied env. Remember to double check the variables in it."
ln -s ~/dotfiles/mackup/.mackup.cfg ~/.mackup.cfg
ln -s ~/dotfiles/mackup/.mackup/ ~/.mackup
ln -s ~/dotfiles/mackup/packages ~/packages

# Install Homebrew
if test ! "$(command -v brew)"; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
  brew upgrade
  exit 1;
fi

# Install runtimes
if test ! "$(command -v mackup)"; then
  echo "Installing mackup..."
     brew install rtx
  exit 1;
fi

# Install runtimes with rtx
brew install rtx
rtx activate && rtx install

# Install packages
./sync-packages.sh

# Restore backup
mackup restore -f

# Start backup
./backup.sh
