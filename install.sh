#!/usr/bin/env bash

# Install dot files
# Run with path to dot files
# ./install.sh /path/to/dotfiles

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

# Some sym links
ln -f -s "$dir.vimrc" $HOME/.vimrc
ln -f -s "$dir.gitconfig" $HOME/.gitconfig
ln -f -s "$dir.bashrc" $HOME/.bashrc
ln -f -s "$dir.tmux.conf" $HOME/.tmux.conf

# Create terminator config
if [[ ! -d $HOME/.config/terminator/ ]] ; then
	mkdir -p $HOME/.config/terminator
	chown -Rf $USER $HOME/.config/terminator	
fi
ln -f -s "$dir.config/terminator/config" $HOME/.config/terminator/config

exit 0
