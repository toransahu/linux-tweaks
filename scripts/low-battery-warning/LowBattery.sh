#!/bin/bash

while true
do
    battery_level=`acpi -b |awk '{print ($(4)-0)}'`
    status=`acpi -b |awk '{print ($(3))}'`   
    #notify-send $battery_level
    if [ $status != "Charging," ]
    then
        if [ $battery_level -lt "15" ]
        then
            mpg321 --frames 30 gentex_cammander_3_code_3_horn-Brandon-938131891.mp3
            sleep 2m
        fi
    fi
done

