get_battery_status() {
    if command -v pmset &> /dev/null; then
        pmset -g batt | grep -Eo 'discharging'
    fi
}
