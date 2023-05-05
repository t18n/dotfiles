#
# Sourcing packages. Keep this at the top of the file so the packages are available to the rest of the file
##########################################################################################

# Activate homebrew first thing, as other packages may depend on it
eval $(/opt/homebrew/bin/brew shellenv)

# Activate rtx
eval "$(rtx activate zsh)"
eval "$(rtx hook-env)" # In case rtx doesn't work with tmux https://github.com/jdxcode/rtx#rtx-isnt-working-with-tmux

#
# Start up commands
##########################################################################################
# Auto generate fun quote on bash start up
COWS=($HOME/packages/cowsay-files/cows/*) # More: https://github.com/bkendzior/cowfiles
RAND_COW=$(($RANDOM % $(/bin/ls $HOME/packages/cowsay-files/cows/*.cow | wc -l)))
fortune | cowsay -f ${COWS[$RAND_COW]} | lolcat

##########################################################################################
#                                   Source stuff                                      #
##########################################################################################
source ~/.config/shell/.exports
source ~/.config/shell/.env
source ~/.config/shell/.aliases

# Source broot
source $HOME/.config/broot/launcher/bash/br

# Add Navi to ZSH completion, use as a widget to your shell
# This allow a Navi command to be edittable before execution
# as well as populating the history correctly
eval "$(navi widget zsh)"

# Activate zoxide
eval "$(zoxide init zsh)"

bindkey '^f' _navi_widget
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
bindkey -s "\C-u" "source ~/.zshrc \C-M"
bindkey -s "\C-e" "e \C-M"


# Activate sheldon package manager. List of plugins can be found in ~/.config/sheldon/plugins.toml
eval "$(sheldon source)"