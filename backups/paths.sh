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
export SOURCE_DIR=$HOME
export EROOT=$SOURCE_DIR/disk/E
export DROOT=$SOURCE_DIR/disk/D

export WORKSPACE=$EROOT/workspace
export GITHUB=$WORKSPACE/github.com
export ME=$GITHUB/toransahu
export OFFICE_NAME=aristanetworks
export OFFICE_WORKSPACE=gerrit.corp.arista.io
export OFFICE=$WORKSPACE/$OFFICE_WORKSPACE

REPO_DIR="linux-tweaks"
BAK_DIR="backups" # backup_confs.sh
# BAK_DIR="$(date +"%Y-%m-%d-%I:%M:%S")"
TARGET_DIR=$ME/$REPO_DIR/$BAK_DIR

IS_NEW=false
if  ! [ -d "$EROOT" ] || ! [ -d "$DROOT" ]; then
    mkdir -p $EROOT
    mkdir -p $DROOT
elif  [ "$(hostname)" = mint-ThinkPad-L440 ]; then
    EROOT=~/disk/E
    DROOT=~/disk/D
elif  [ "$(hostname)" = Torans-MacBook-Pro-2.local ]; then
    EROOT=~/disk/E
    DROOT=~/disk/D
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
    export PATH=$PATH:$JAVA_HOME/bin
    export M2_HOME=$HOME/apache-maven-3.6.3
    export MVN_HOME=$M2_HOME 
    export PATH=$MVN_HOME/bin:$PATH
    export GPG_TTY=$(tty)
    export PATH=$PATH:$HOME/usr/local/go/bin
elif [ "$(hostname)" = DESKTOP-35VDAC5 ] && [ "$(uname)" = Linux ]; then
    SOURCE_DIR="/home/toran"
    EROOT="/mnt/g/toran/E"
elif [ "$(hostname)" = raspberrypi ]; then
    SOURCE_DIR="/home/pi"
    EROOT="/home/pi/main-storage/E"
else
    echo "[$REDx$NC] New device "$(hostname)" found. Adjust the vars accrodingly (if required)..$NC"
    IS_NEW=true
fi

if [ $IS_NEW = false ] ; then
    echo -e "$GREEN\b[✓] $CYAN$(whoami)@$(hostname)$NC"
fi
