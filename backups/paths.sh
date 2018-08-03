#! /bin/sh
#
# paths.sh
# Copyright (C) 2018 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#



##
# PATHs
##
SOURCE_DIR="/home/toran"
REPO_DIR="linux-tweaks"

##
# backup_confs.sh
##
# BAK_DIR="$(date +"%Y-%m-%d-%I:%M:%S")"
BAK_DIR="backups"


if  [ "$(hostname)" = mint-ThinkPad-L440 ]; then
    EROOT="/mnt/ExternalHDD/E"
    DROOT="/mnt/ExternalHDD/D"
    WORKSPACE="$EROOT/workspace"
    # TARGET_DIR="$WORKSPACE/linux-tweaks/configs/mint/$BAK_DIR"
    TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"
elif [ "$(hostname)" = mint-ethereal ]; then
    EROOT="/mnt/Other/toran/E"
    WORKSPACE="$EROOT/workspace"
	# TARGET_DIR="$WORKSPACE/linux-tweaks/configs/mint/$BAK_DIR"
    TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"
elif [ "$(hostname)" = ip-172-31-24-111 ]; then
    SOURCE_DIR="/home/ubuntu"
    EROOT="/home/ubuntu"
    WORKSPACE="$EROOT/workspace"
    # TARGET_DIR="$WORKSPACE/linux-tweaks/configs/aws-ubuntu/$BAK_DIR"
    TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"    
elif [ "$(hostname)" = DESKTOP-35VDAC5 ] && [ "$(uname)" = Linux ]; then
    SOURCE_DIR="/home/toran"
    EROOT="/mnt/g/toran/E"
    WORKSPACE="$EROOT/workspace"
    TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"
elif [ "$(hostname)" = DESKTOP-35VDAC5 ]; then
    SOURCE_DIR="/c/Users/Toran"
    EROOT="/g/toran/E"
    WORKSPACE="$EROOT/workspace"
    TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"
elif [ "$(hostname)" = ip-172-31-18-37 ]; then
    SOURCE_DIR="/home/ubuntu"
    EROOT="/home/ubuntu/toran"
    WORKSPACE="$EROOT/workspace"
    TARGET_DIR="$WORKSPACE/$REPO_DIR/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"    
else
    echo "New device found. Make entry in the script.."
fi
