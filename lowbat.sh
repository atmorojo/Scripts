#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# check battery level, and raise a notification if the capacity is
# under a defined level

ICON=$(echo -e "\ue237")
LEVL=20

while true; do
    BATC=$(sed 's/%//' /sys/class/power_supply/BAT0/capacity)
    test ${BATC} -le ${LEVL} && popup "%{R} $ICON %{R} Your battery is running low: %{R} $BATC %{R} remaining" w
    sleep 1m
done
