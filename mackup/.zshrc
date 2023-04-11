#
# Sourcing packages. Keep this at the top of the file so the packages are available to the rest of the file
##########################################################################################

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

##########################################################################################
#                                   Theme & Plugins                                      #
##########################################################################################
export ZPLUG_HOME=~/packages/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"

zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/compleat", from:oh-my-zsh

zplug "paulirish/git-open", as:plugin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
zplug "romkatv/powerlevel10k", as:theme, depth:1
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    fi
fi

# Auto completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

# To manage zplug itself like other packages, write the following in your .zshrc.
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug load # source plugins and add commands to $PATH

# Source broot
source $HOME/.config/broot/launcher/bash/br

# Activate homebrew
eval $(/opt/homebrew/bin/brew shellenv)

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