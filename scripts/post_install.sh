#! /bin/sh
#
# post_install.sh
# Copyright (C) 2018 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.


##---------------------------------------------------------------
# linux packages
##

# TODO: ask for update, else skip
sudo apt update
sudo apt upgrade
sudo apt install --fix-missings
sudo apt install --fix-broken
sudo apt install vim-gnome zsh git xdotool

# TODO: only if mint or desktop env present
# sudo apt install evolution sublime-text3 xdotool


##---------------------------------------------------------------
# python
##

## env
#-----

cd ~/

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh

## python packages
#-----------------

pip install --upgrade pip
pip install pipenv flake8 black


##---------------------------------------------------------------
# shell
##

## oh-my-zsh
#-----------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## zsh-autosuggestions
#------------------
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

##---------------------------------------------------------------
# vim
##

## vundle
#--------
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## suan/vim-instant-markdown
# ---------------------------
sudo apt install npm xdg-utils curl nodejs
sudo npm -g install instant-markdown-d
git clone https://github.com/suan/vim-instant-markdown.git ~/.vim/vim-instant-markdown
mv ~/.vim/vim-instant-markdown/after ~/.vim/after


##---------------------------------------------------------------
# copy configurations files
##
cp -r ../backups/. ~/

. ~/.zshrc
echo "Configuration files copied successfully"
