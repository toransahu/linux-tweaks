#! /bin/sh
#
# troubleshhot.sh
# Copyright (C) 2019 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

# pre-requisites
# - run in tty

# kill memory hops
# killall firefox
killall firefox-bin
killall skypeforlinux
killall slack

# restart cinnamon
# export DISPLAY=:0; cinnamon &
# export DISPLAY=:0; cinnamon --replace &
pkill -HUP -f "cinnamon --replace"
# sudo service mdm restart

# clear memory
# clearswap
sudo apt clean
sudo apt autoremove

# monitor memory
free -m
sudo lshw -c memory

# monitor startup apps
service --status-all
