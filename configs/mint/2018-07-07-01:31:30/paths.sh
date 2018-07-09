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

# backup_confs.sh
SOURCE_DIR="/home/toran"
BAK_DIR="$(date +"%Y-%m-%d-%I:%M:%S")"

if  [ "$(hostname)" = mint-ThinkPad-L440 ]; then

    EROOT="/mnt/ExternalHDD/E"
    WORKSPACE="$EROOT/workspace"
    TARGET_DIR="$WORKSPACE/linux-tweaks/configs/mint/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"
elif [ "$(hostname)" = mint-ethereal ]; then
    EROOT="/mnt/Other/toran/E"
    WORKSPACE="$EROOT/workspace"
	TARGET_DIR="$WORKSPACE/linux-tweaks/configs/mint/$BAK_DIR"
    echo "All seems good. You're on computer: $(hostname)"
else
    echo "New device found. Make entry in the script.."
fi
