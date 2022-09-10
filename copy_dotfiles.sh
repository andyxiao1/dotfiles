#!/bin/sh

dotfiles=(
    .zshrc
    .fzf.zsh
    .p10k.zsh
    .gitconfig
    .tmux.conf
    # .config/init.vim
)

for dotfile in ${dotfiles[@]}; do
    rm ./$dotfile
    cp $HOME/$dotfile ./
done