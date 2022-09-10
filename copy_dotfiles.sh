#!/bin/sh

dotfiles=(
    .zshrc
    .fzf.zsh
    .gitconfig
    .tmux.conf
)

for dotfile in ${dotfiles[@]}; do
    rm ./$dotfile
    cp $HOME/$dotfile ./
done