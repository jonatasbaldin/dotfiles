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
ln -f -s ".vimrc" "$HOME/.vimrc"
ln -f -s ".gitconfig" "$HOME/.gitconfig"
ln -f -s ".zshrc" "$HOME/.zshrc"
ln -f -s ".tmux.conf" "$HOME/.tmux.conf"
