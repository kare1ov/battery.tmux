#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

default_icon_level_95='󰁹'
default_icon_level_90='󰂂'
default_icon_level_80='󰂁'
default_icon_level_70='󰂀'
default_icon_level_60='󰁿'
default_icon_level_50='󰁾'
default_icon_level_40='󰁽'
default_icon_level_30='󰁼'
default_icon_level_20='󰁻'
default_icon_level_10='󰁺'
default_icon_level_low='󰂎'

get_icon(){
    local battery_level="$($CURRENT_DIR/level.sh)"
    if [[ "$battery_level" -ge 95 ]]; then
        printf "$default_icon_level_95"
    elif [[ "$battery_level" -ge 90 ]]; then
        printf "$default_icon_level_90"
    elif [[ "$battery_level" -ge 80 ]]; then
        printf "$default_icon_level_80"
    elif [[ "$battery_level" -ge 70 ]]; then
        printf "$default_icon_level_70"
    elif [[ "$battery_level" -ge 60 ]]; then
        printf "$default_icon_level_60"
    elif [[ "$battery_level" -ge 50 ]]; then
        printf "$default_icon_level_50"
    elif [[ "$battery_level" -ge 40 ]]; then
        printf "$default_icon_level_40"
    elif [[ "$battery_level" -ge 30 ]]; then
        printf "$default_icon_level_30"
    elif [[ "$battery_level" -ge 20 ]]; then
        printf "$default_icon_level_20"
    elif [[ "$battery_level" -gt 5 ]]; then
        printf "$default_icon_level_10"
    else
        printf "$default_icon_level_low"
    fi
}

get_icon
