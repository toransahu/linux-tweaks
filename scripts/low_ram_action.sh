#! /bin/sh
#
# low_ram_warning.sh
# Copyright (C) 2020 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

source ~/paths.sh

THRESHOLD1=20.0
THRESHOLD2=15.0
THRESHOLD3=10.0
TICK=3

free_cached_ram () {
    echo Freeing up some RAM.
    sudo $WORKSPACE/linux-tweaks/scripts/freeram.sh
    echo done!
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

kill_java () {
    echo Killing java
    kill $(pidof java)
    echo done!
}

run() {
    while true; do
        TIMESTAMP=$(date +"%Y-%m-%d-%H:%M:%S")
        RAM_USGAE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
        # RAM_FREE=$(free | grep Mem | awk '{print $4/$2 * 100.0}') # total - used - cahed - buffer
        RAM_FREE=$(python -c "print(100 - $RAM_USGAE)") # total - used
        
        SWAP_USGAE=$(free | grep Swap | awk '{print $3/$2 * 100.0}')
        SWAP_FREE=$(free | grep Swap | awk '{print $4/$2 * 100.0}')
        
        echo "[$TIMESTAMP] Usage: $RAM_USGAE%,\tFree: $RAM_FREE%."

        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD1 else 1)"; then
            free_cached_ram
        fi
    
        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD2 else 1)"; then
            kill_java
        fi

        if python -c "exit(0 if $RAM_FREE <= $THRESHOLD3 else 1)"; then
            kill_firefox
        fi
        
        sleep $TICK;
    done
}

run



# good-to-read
# - https://www.linuxatemyram.com/
