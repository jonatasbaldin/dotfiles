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

# Create SSH dir
if [[ ! -d $HOME/.ssh/ ]] ; then
	mkdir -p $HOME/.ssh
	chown -Rf $USER $HOME/.ssh	
    chmod 700 $HOME/.ssh
fi

# Some sym links
ln -f -s "$dir.vimrc" $HOME/.vimrc
ln -f -s "$dir.gitconfig" $HOME/.gitconfig
ln -f -s "$dir.bashrc" $HOME/.bashrc
ln -f -s "$dir.tmux.conf" $HOME/.tmux.conf
ln -f -s "$dir.PYTHONPATH" $HOME/.PYTHONPATH
ln -f -s "$dir.tmuxinator" $HOME/.tmuxinator
ln -f -s "$dir.ssh_config" $HOME/.ssh/config

# Create terminator config
if [[ ! -d $HOME/.config/terminator/ ]] ; then
	mkdir -p $HOME/.config/terminator
	chown -Rf $USER $HOME/.config/terminator	
fi
ln -f -s "$dir.config/terminator/config" $HOME/.config/terminator/config

exit 0
