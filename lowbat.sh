#!/bin/sh

export XAUTHORITY=/home/atmorojo/.Xauthority
export DISPLAY=":0"

battery_level=`acpi -b | cut -d ' ' -f 4 | grep -o '[0-9]*'`
online="$(acpi -V | grep "on-line")"

if [ -z "$online" ] && [ $battery_level -le 10 ];
then
    notify-send "Battery low" "Battery level is ${battery_level}%!"
fi
