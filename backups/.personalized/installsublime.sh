#! /bin/sh
#
# installsublime.sh
# Copyright (C) 2018 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#


wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update

sudo apt-get install sublime-text
