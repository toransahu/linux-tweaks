#!/usr/bin/env bash
#
# paths.sh
# Copyright (C) 2020 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

##
# PATHs: init - default 
##
SOURCE_DIR="/home/$USER"
EROOT="/home/$USER/disk/E"
DROOT="/home/$USER/disk/D"

REPO_DIR="linux-tweaks"
BAK_DIR="backups" # backup_confs.sh
# BAK_DIR="$(date +"%Y-%m-%d-%I:%M:%S")"

IS_NEW=false

if  [ -d "$EROOT" ] || [ -d "$DROOT" ]; then
    mkdir -p $EROOT
    mkdir -p $DROOT
elif  [ "$(hostname)" = mint-ThinkPad-L440 ]; then
    EROOT="/mnt/ExternalHDD/E"
    DROOT="/mnt/ExternalHDD/D"
elif [ "$(hostname)" = mint-ethereal ]; then
    EROOT="/mnt/Other/toran/E"
elif [ "$(hostname)" = ip-172-31-24-111 ]; then
    SOURCE_DIR="/home/ubuntu"
    EROOT="/home/ubuntu"
elif [ "$(hostname)" = DESKTOP-35VDAC5 ] && [ "$(uname)" = Linux ]; then
    SOURCE_DIR="/home/toran"
    EROOT="/mnt/g/toran/E"
elif [ "$(hostname)" = DESKTOP-35VDAC5 ]; then
    SOURCE_DIR="/c/Users/Toran"
    EROOT="/g/toran/E"
elif [ "$(hostname)" = ip-172-31-18-37 ]; then
    SOURCE_DIR="/home/ubuntu"
    EROOT="/home/ubuntu/toran"
 elif [ "$(hostname)" = ip-172-31-18-57 ]; then
    SOURCE_DIR="/home/ubuntu"
    EROOT="/home/ubuntu/toran"
elif [ "$(hostname)" = ToranS-PC ]; then
    SOURCE_DIR="/c/Users/torans"
    EROOT="/e/E"
elif [ "$(hostname)" = ToranS-UB ]; then
    SOURCE_DIR="/home/torans"
    EROOT="/mnt/Other/E"
elif [ "$(hostname)" = raspberrypi ]; then
    SOURCE_DIR="/home/pi"
    EROOT="/home/pi/main-storage/E"
else
    echo "[$REDx$NC] New device found. Adjust the vars accrodingly (if required)..$NC"
    IS_NEW=true
fi

export WORKSPACE="$EROOT/workspace"
export TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"

if [ $IS_NEW = false ] ; then
    echo -e "$GREEN\b[✓] $CYAN$(whoami)@$(hostname)i$NC"
fi
