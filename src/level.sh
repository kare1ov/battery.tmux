#!/bin/bash

if command -v pmset &> /dev/null; then
    # OSX
    pmset -g batt | grep -Eo "\d+%" | tr -d "%"
elif command -v acpi &>/dev/null; then
    # Linux
    acpi -b | grep -m 1 -Eo "[0-9]+%" | tr -d "%"
fi
