#! /bin/sh
#
# low_ram_warning.sh
# Copyright (C) 2020 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

source ~/paths.sh

TIMESTAMP=$(date +"%Y-%m-%d-%H:%M:%S")
THRESHOLD_FIRST=10.0
THRESHOLD_SECOND=5.0
TICK=3

free_ram () {
    sudo $WORKSPACE/linux-tweaks/scripts/freeram.sh
}

kill_firefox () {
    APPS_TO_CLOSE='firefox'
    for app in $APPS_TO_CLOSE; do
        pids=$(pidof $app | awk '{$NF=""; print $0}')  # kill subtasks
        echo "[$TIMESTAMP] Will kill $app[pids: $pids]"
        kill $pids
        echo "[$TIMESTAMP] Killed $app[pids: $pids]"
    done
}

run() {
    while true; do
        RAM_USGAE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
        # RAM_FREE=$(free | grep Mem | awk '{print $4/$2 * 100.0}') # total - used - cahed - buffer
        RAM_FREE=$(python -c "print(100 - $RAM_USGAE)") # total - used
        
        SWAP_USGAE=$(free | grep Swap | awk '{print $3/$2 * 100.0}')
        SWAP_FREE=$(free | grep Swap | awk '{print $4/$2 * 100.0}')
        
        echo "[$TIMESTAMP] Usage: $RAM_USGAE%, Free: $RAM_FREE%."

        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD_FIRST else 1)"; then
            echo Freeing up some RAM.
            free_ram
        fi
    
        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD_SECOND else 1)"; then
            echo Killing firefox tabs.
            kill_firefox
        fi
        
        sleep $TICK;
    done
}

run
