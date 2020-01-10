#! /bin/sh
#
# low_ram_warning.sh
# Copyright (C) 2020 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

source ~/paths.sh

free_ram () {
    sudo $WORKSPACE/linux-tweaks/scripts/freeram.sh
}

kill_apps () {
    APPS_TO_CLOSE='firefox '

    for app in $APPS_TO_CLOSE; do
        pid=$(pidof $app | awk '{print $NF}')
        echo "Will kill $app[pid: $pid]"
        kill $pid
    done
}

run() {
    while true; do
        RAM_USGAE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
        RAM_FREE=$(free | grep Mem | awk '{print $4/$2 * 100.0}')
        
        SWAP_USGAE=$(free | grep Swap | awk '{print $3/$2 * 100.0}')
        SWAP_FREE=$(free | grep Swap | awk '{print $4/$2 * 100.0}')
        
        THRESHOLD_FIRST=15.0
        THRESHOLD_SECOND=5.0
        
        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD_FIRST else 1)"; then
            notify-send "Low Memory" "$RAM_FREE% free only"
            free_ram
        fi
    
        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD_SECOND else 1)"; then
            notify-send "Low Memory" "$RAM_FREE% free only"
            kill_apps
        fi
        
        sleep 5;
    done
}

run
