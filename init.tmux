#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

placeholders=(
    "\#{battery_icon_new}"
    "\#{battery_level}"
)
commands=(
    "#($CURRENT_DIR/src/icon.sh)"
    "#($CURRENT_DIR/src/level.sh)"
)

apply_placeholder_substitution(){
    local option_value="$1"
    for ((i=0; i<${#commands[@]}; i++)); do
        # replace placeholder value with a command's value
        option_value=${option_value//${placeholders[$i]}/${commands[$i]}}
    done
    echo "$option_value"
}

set_tmux_option(){
    local option="$1"
    local value="$(tmux show-option -gqv "$option")"
    local new_value="$(apply_placeholder_substitution "$value")"
    tmux set-option -gq "$option" "$new_value"
}

main(){
    set_tmux_option "status-left"
    set_tmux_option "status-right"
}

main
