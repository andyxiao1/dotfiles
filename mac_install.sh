#!/bin/sh

## TODO: This is a WIP

#####################################
########## Install Tooling ##########
#####################################

# Prereq is to have brew installed
brew install tmux
brew install neovim

# Setup fzf
# brew install fzf
# $(brew --prefix)/opt/fzf/install
# rm ~/.bashrc ~/.fzf.bash

# Install vim plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# TODO: grab dotfiles from github and source them

#####################################
########## Oh-my-zsh setup ##########
#####################################

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

#####################################
########## Source Changes ###########
#####################################

source ~/.zshrc
tmux source-file ~/.tmux.conf