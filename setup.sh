#!/bin/bash

# Link the files
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/vimrc ~/.vimrc

# Install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > neobundle-install.sh
sh ./neobundle-install.sh
