#!/usr/bin/env bash

# Run this scripts using /path/to/cloned/repo as the first argument

# Verifies first argument
if [[ -z "$1" ]] ; then
    echo "Need the dot files path!"
    exit 1
fi

# Check if last chars is not a /
# To make the right substitution below
if [[ "${1: -1}" != / ]] ; then
    dir="$1/"
else
    dir="$1"
fi

# Create SSH folder
if [[ ! -d $HOME/.ssh/ ]] ; then
	mkdir -p $HOME/.ssh
	chown -Rf $USER $HOME/.ssh	
    chmod 700 $HOME/.ssh
fi

# Create symbolic links
ln -f -s "$dir.vimrc" $HOME/.vimrc
ln -f -s "$dir.gitconfig" $HOME/.gitconfig
ln -f -s "$dir.bashrc" $HOME/.bashrc
ln -f -s "$dir.bashrc" $HOME/.profile # OS X
ln -f -s "$dir.zshrc" $HOME/.zshrc
ln -f -s "$dir.tmux.conf" $HOME/.tmux.conf
ln -f -s "$dir.tmuxinator" $HOME/.tmuxinator
ln -f -s "$dir.vim/UltiSnips" $HOME/.vim/UltiSnips

exit 0
