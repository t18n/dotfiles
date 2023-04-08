#!/bin/bash

# Make sure the DOTFILE_PROFILE is set
if [ ! -z "$DOTFILE_PROFILE" ]; then
  echo "Please set DOTFILE_PROFILE to the name of the profile you want to use."
  echo "You can run 'echo DOTFILE_PROFILE=name_of_profile_from_package_dump > ~/.bash_env' to set it."
  exit 1;
fi

# Install Brew
if test ! "$(command -v brew)"; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
  brew upgrade
  exit 1;
fi

if test ! "$(command -v mackup)"; then
  echo "Installing mackup..."
  brew install rtx
  exit 1;
fi

# Link mackup
cp ~/dotfiles/mackup/.bash_env.sample ~/.bash_env && echo "✅ Copied bash_env. Remember to double check the variaables in it."
ln -s ~/dotfiles/mackup/.mackup.cfg ~/.mackup.cfg
ln -s ~/dotfiles/mackup/.mackup/ ~/.mackup
ln -s ~/dotfiles/mackup/packages ~/packages

# Restore the shit
mackup restore -f

# Install runtimes with rtx
brew install rtx
rtx activate && rtx install

# Install Brew packages from file
BACKUP_DIR="$HOME/dotfiles"
PACKAGE_DUMP_DIR="$BACKUP_DIR/package_dump"

HOMEBREW_PACKAGES_DUMP="$PACKAGE_DUMP_DIR/brew_packages_dump"
brew bundle install --file="$HOMEBREW_PACKAGES_DUMP"
brew upgrade --cask && brew cleanup

# Install Node packages from file
NPM_GLOBAL_PACKAGES_DUMP="$PACKAGE_DUMP_DIR/npm_global_packages_dump"
xargs npm install --global < "$NPM_GLOBAL_PACKAGES_DUMP"

# Start auto backup
~/dotfiles/scripts/automate-backup.sh

# Check cron tab
crontab -l
