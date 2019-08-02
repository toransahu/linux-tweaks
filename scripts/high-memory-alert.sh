#! /bin/sh
#
# memory-notif.sh
# Copyright (C) 2019 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

#Minimum available memory limit, MB
THRESHOLD=400

#Check time interval, sec
INTERVAL=30

while :
do

    free=$(free -m|awk '/^Mem:/{print $4}')
    buffers=$(free -m|awk '/^Mem:/{print $6}')
    cached=$(free -m|awk '/^Mem:/{print $7}')
    available=$(free -m | awk '/^-\/+/{print $4}')

    message="Free $free""MB"", buffers $buffers""MB"", cached $cached""MB"", available $available""MB"""

    if [ $available -lt $THRESHOLD ]
        then
        notify-send "Memory is running out!" "$message"
    fi

    echo $message

    sleep $INTERVAL

done
