#!/bin/bash

# Install some packages
if command -v apt-get 2>/dev/null >/dev/null
then
    sudo apt-get update -qq
    sudo apt-get install vim curl git -y -qq
fi

# Setup the custom command prompt
CONFIG_LINE="source `pwd`/custom_prompt"
BASH_CONFIG="$HOME/.bash_profile"
if ! test -f $BASH_CONFIG
then
    BASH_CONFIG="$HOME/.bashrc"
fi

if ! grep -Fxq "$CONFIG_LINE" $BASH_CONFIG 2>/dev/null
then
    echo "$CONFIG_LINE" >> $BASH_CONFIG
    source $BASH_CONFIG
fi

# Link the files
ln -fs `pwd`/tmux.conf ~/.tmux.conf
ln -fs `pwd`/vimrc ~/.vimrc
ln -fs `pwd`/ackrc ~/.ackrc

mkdir -p ~/.vim/tmp/
mkdir -p ~/.vim/history/

# Install Vim-Plug
if ! test -f $HOME/.vim/autoload/plug.vim
then
    curl -sfLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Setup git config
git config --global rerere.enabled true
git config --global merge.ff false
git config --global merge.log true
git config --global color.ui true

# Setup git aliases
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.b branch
git config --global alias.f "fetch --prune --all --tags"
git config --global alias.diffstat "diff --stat -r"
git config --global alias.g "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all"
git config --global alias.ignored "ls-files --others -i --exclude-standard"
git config --global alias.name "show --name-only"
git config --global alias.merged "branch -a --merged"
git config --global alias.no-merged "branch -a --no-merged"
