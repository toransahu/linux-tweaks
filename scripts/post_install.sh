#! /bin/sh
#
# post_install.sh
# Copyright (C) 2018 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#


##
# packages
##
sudo apt install vim zsh git 

# TODO: only if mint or desktop env present
# sudo apt install evolution sublime-text3 xdotool


##
# python env
##

cd ~/

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash Miniconda3-latest-Linux-x86_64.sh


##
# personalization
##

cd -

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


##
# copy configurations files
##
cp -r ../backups/. ~/
echo "Configuration files copied successfully"
