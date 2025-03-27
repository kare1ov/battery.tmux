#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/utils.sh"

__load_icons() {
    local battery_status="$(get_battery_status)"
    if [[ "$battery_status" == "discharging" ]]; then
        source "$CURRENT_DIR/config/icons.conf"
    else
        source "$CURRENT_DIR/config/charging_icons.conf"

    fi
}

__set_icon(){
    __load_icons

    local battery_level="$($CURRENT_DIR/battery_level.sh)"
    if [[ "$battery_level" -gt 90 ]]; then
        printf "$icon_level_100"
    elif [[ "$battery_level" -gt 80 ]]; then
        printf "$icon_level_90"
    elif [[ "$battery_level" -gt 70 ]]; then
        printf "$icon_level_80"
    elif [[ "$battery_level" -gt 60 ]]; then
        printf "$icon_level_70"
    elif [[ "$battery_level" -gt 50 ]]; then
        printf "$icon_level_60"
    elif [[ "$battery_level" -gt 40 ]]; then
        printf "$icon_level_50"
    elif [[ "$battery_level" -gt 30 ]]; then
        printf "$icon_level_40"
    elif [[ "$battery_level" -gt 20 ]]; then
        printf "$icon_level_30"
    elif [[ "$battery_level" -gt 10 ]]; then
        printf "$icon_level_20"
    else
        printf "$icon_level_10"
    fi
}

__set_icon
