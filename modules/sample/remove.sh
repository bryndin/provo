#!/bin/bash

# Requirements for this module. It can be empty.
# Note: these are regular commands, not module names.
REQUIREMENTS=(
    # zsh
    # git
    # ... add more as needed
)

clean_X() {
    # for example: rm -rf ~/X 
    :
}

# Main Module Logic
if [[ "$RUN_MODULE" == true ]]; then
    # Here goes the installation logic
    clean_X
fi
