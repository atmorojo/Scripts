#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# check battery level, and raise a notification if the capacity is
# under a defined level

LEVL=30

while true; do
    BATC=$(sed 's/%//' /sys/class/power_supply/BAT0/capacity)
    CHARGE=$(acpi -b | grep "Charging")
    
    # Test if the charger is plugged
    if [ -z ${CHARGE} ]; then
      # Raise a warnig if the charger is unplugged and the battery is below the
      # desired percentage
      test ${BATC} -le ${LEVL} && dunstify "Your battery is running low: $BATC remaining" 
      sleep 30s
    fi
done
