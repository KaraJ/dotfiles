#!/bin/bash

# Link the files
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/ackrc ~/.ackrc

# Install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > neobundle-install.sh
sh ./neobundle-install.sh

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
