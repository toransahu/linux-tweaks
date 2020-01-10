#! /bin/sh
#
# low_ram_warning.sh
# Copyright (C) 2020 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#


RAM_USGAE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
RAM_FREE=$(free | grep Mem | awk '{print $4/$2 * 100.0}')

SWAP_USGAE=$(free | grep Swap | awk '{print $3/$2 * 100.0}')
SWAP_FREE=$(free | grep Swap | awk '{print $4/$2 * 100.0}')

APPS_TO_CLOSE='firefox '
THRESHOLD=5.0

if python -c "exit(0 if $RAM_FREE <= $THRESHOLD else 1)"; then
    echo "Low memory.. $RAM_FREE% free only"
    for app in $APPS_TO_CLOSE; do
        pid=$(pidof $app | awk '{print $NF}')
        echo "Will kill $app[pid: $pid]"
        kill $pid
    done
fi

