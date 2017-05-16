#!/bin/bash
#script for backup and restore vim configuration
#the repository is: git@github.com:vanabel/vim.git
if [ -z "$1" ]; then
	echo "Usage: $0 install|backup|restore"
	exit 1
fi

ROOTVIM='..'

if [ ! -f "$ROOTVIM/vim80/gvim.exe" ]; then
    echo "No gvim of version 8.0 found, please run"
    echo " git clone https://github.com/vanabel/vim.git"
    echo "at install directory of vim"
    exit 0
fi

if [ "$1" == "install" ]; then
    pushd $ROOTVIM >/dev/null
    echo "We will first install plug.vim ..."
    cp vim/myvim/downloads/plug.vim vim80/autoload/
    bash vim/install.sh restore
    echo "Now you need to run gvim and :PlugInstall"
    popd >/dev/null
fi

if [ "$1" == "backup" ]; then
    pushd $ROOTVIM >/dev/null
    ls
    cp _vimrc gvim myvim README.md vim/
    popd >/dev/null
fi

if [ "$1" == "restore" ]; then
    pushd $ROOTVIM/vim >/dev/null
    cp -r _vimrc _gvimrc myvim README.md ../
    popd >/dev/null
fi
