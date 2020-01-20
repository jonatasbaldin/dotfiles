#!/usr/bin/env bash

cd $HOME

if [[ ! -d dotfiles ]] ; then
    echo "Clonning repository..."
    git clone git@github.com:jonatasbaldin/dotfiles.git
fi

echo "Updating repository..."
cd dotfiles
git pull origin master

echo "Installing dotfiles as symbolic links..."
DIR="$HOME/dotfiles/"
ln -f -s "$DIR/.vimrc" "$HOME/.vimrc"
ln -f -s "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -f -s "$DIR/.zshrc" "$HOME/.zshrc"
ln -f -s "$DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -f -s "$DIR/init.vim" "$HOME/.config/nvim"
