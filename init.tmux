#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

battery_placeholders=(
    "\#{battery_icon_new}"
    "\#{battery_level}"
)
battery_commands=(
    "#($CURRENT_DIR/src/icon.sh)"
    "#($CURRENT_DIR/src/level.sh)"
)

substitute(){
    local option_value="$1"
    for ((i=0; i<${#battery_commands[@]}; i++)); do
        option_value=${option_value//${battery_placeholders[$i]}/${battery_commands[$i]}}
    done
    echo "$option_value"
}

set_tmux_option(){
    local option="$1"
    local value="$(tmux show-option -gqv "$option")"
    local new_value="$(substitute "$value")"
    tmux set-option -gq "$option" "$new_value"
}

main(){
    set_tmux_option "status-left"
    set_tmux_option "status-right"
}

main
