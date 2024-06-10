#!/bin/bash

# Requirements for this module. It can be empty.
# Note: these are regular commands, not module names.
REQUIREMENTS=(
    # zsh
    # git
    # ... add more as needed
)

install_X() {
    # for example: install_package X 
    :
}

# Main Module Logic
if [[ "$RUN_MODULE" == true ]]; then
    # Here goes the installation logic
    install_X
fi
