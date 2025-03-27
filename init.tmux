#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

placeholders=(
    "\#{battery_icon}"
    "\#{battery_level}"
)
commands=(
    "#($CURRENT_DIR/src/battery_icon.sh)"
    "#($CURRENT_DIR/src/battery_level.sh)"
)

__apply_placeholder_substitution(){
    local option_value="$1"
    for ((i=0; i<${#commands[@]}; i++)); do
        # replace placeholder value with a command's value
        option_value=${option_value//${placeholders[$i]}/${commands[$i]}}
    done
    echo "$option_value"
}

__set_tmux_option(){
    local option="$1"
    local value="$(tmux show-option -gqv "$option")"
    local new_value="$(__apply_placeholder_substitution "$value")"
    tmux set-option -gq "$option" "$new_value"
}

__main(){
    __set_tmux_option "status-left"
    __set_tmux_option "status-right"
}

__main
