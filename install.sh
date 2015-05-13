#!/usr/bin/env bash

# Install dot files
# Run with path to dot files
# ./install.sh /path/to/dotfiles

if [[ -z "$1" ]] ; then
    echo "Need the dot files path!"
    exit 0
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

# Create terminator config
if [[ ! -d $HOME/.config/terminator/ ]] ; then
	mkdir -p $HOME/.config/terminator
	chown -Rf $USER $HOME/.config/terminator	
fi
ln -f -s "$dir.config/terminator/config" $HOME/.config/terminator/config
