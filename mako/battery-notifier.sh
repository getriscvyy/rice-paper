#!/usr/bin/env bash

LOW_BATTERY_THRESHOLD=20
CRITICAL_BATTERY_THRESHOLD=10

BAT=$(ls /sys/class/power_supply | grep -E '^BAT[0-9]' | head -n 1)

if [ -z "$BAT" ]; then
    echo "No battery found."
    exit 1
fi

LAST_STATUS=""
LOW_WARNED=false
CRITICAL_WARNED=false

while true; do
    CAPACITY=$(cat "/sys/class/power_supply/$BAT/capacity")
    STATUS=$(cat "/sys/class/power_supply/$BAT/status")

    if [ "$STATUS" != "$LAST_STATUS" ]; then
        if [ "$STATUS" = "Charging" ]; then
            notify-send -r 9991 -i battery-charging "Power Connected" "Battery is charging ($CAPACITY%)"
            LOW_WARNED=false
            CRITICAL_WARNED=false
        elif [ "$STATUS" = "Discharging" ]; then
            notify-send -r 9991 -i battery "Power Disconnected" "Running on battery ($CAPACITY%)"
        fi
        LAST_STATUS="$STATUS"
    fi

    if [ "$STATUS" = "Discharging" ]; then
        if [ "$CAPACITY" -le "$CRITICAL_BATTERY_THRESHOLD" ]; then
            if [ "$CRITICAL_WARNED" = false ]; then
                notify-send -u critical -r 9992 -i battery-caution "CRITICAL BATTERY" "Battery is dangerously low at ${CAPACITY}%!"
                CRITICAL_WARNED=true
            fi
        elif [ "$CAPACITY" -le "$LOW_BATTERY_THRESHOLD" ]; then
            if [ "$LOW_WARNED" = false ]; then
                notify-send -u normal -r 9992 -i battery-low "Low Battery" "Battery has dropped to ${CAPACITY}%."
                LOW_WARNED=true
            fi
        fi
    fi

    if [ "$STATUS" = "Charging" ] && [ "$CAPACITY" -gt "$LOW_BATTERY_THRESHOLD" ]; then
        LOW_WARNED=false
    fi

    sleep 30
done

