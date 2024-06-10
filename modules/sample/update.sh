#!/bin/bash

# Requirements for this module. It can be empty.
# Note: these are regular commands, not module names.
REQUIREMENTS=(
    # zsh
    # git
    # ... add more as needed
)

update_everything() {
    # for example: sudo apt-get update && sudo apt-get upgrade
    :
}

# Main Module Logic
if [[ "$RUN_MODULE" == true ]]; then
    # Here goes the installation logic
    update_everything
fi
