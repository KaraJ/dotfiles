#!/bin/bash

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
git config --global alias.f "fetch -p --all"
git config --global alias.diffstat "diff --stat -r"
git config --global alias.g "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit --date=short --all"
git config --global alias.ignored "ls-files --others -i --exclude-standard"
git config --global alias.name "show --name-only"
git config --global alias.merged "branch -a --merged"
git config --global alias.no-merged "branch -a --no-merged"
