#!/bin/bash

##############################################################################
### Utility Functions (shared with other scripts) ############################
##############################################################################

#-----------------------------------------------------------------------------
# --- Constants  -------------------------------------------------------------
#-----------------------------------------------------------------------------

# Error codes
ERR_NOT_IMPLEMENTED=38    # ENOSYS: Function not implemented
ERR_MISSING_DEPENDENCY=65 # ENOPKG: Package not installed

#-----------------------------------------------------------------------------
#-- Custom echo functions ----------------------------------------------------
#-----------------------------------------------------------------------------

_echo_color() {
    local color="$1"
    local message="$2"

    local color_code=""

    case "$color" in
        red) color_code='\033[0;31m' ;;
        green) color_code='\033[0;32m' ;;
        blue) color_code='\033[0;34m' ;;
        yellow) color_code='\033[0;33m' ;;
        cyan) color_code='\033[0;36m' ;;
        magenta) color_code='\033[0;35m' ;;
        white) color_code='\033[0;37m' ;;
        black) color_code='\033[0;30m' ;;
        *) ;; # Do nothing for unknown colors
    esac

    if [ -t 1 ] && [ -n "$color_code" ] && [[ -n "$TERM" ]] && [[ "$TERM" != "dumb" ]]; then
        # Color enabled terminal
        printf "%b%s%b\n" "$color_code" "$message" '\033[0m'
    else
        # Fallback to standard output without colors
        printf "%s\n" "$message"
    fi
}

echo_info() {
    _echo_color "blue" "$1"
}

echo_warn() {
    _echo_color "yellow" "$1"
}

echo_error() {
    _echo_color "red" "$1" >&2
}

#-----------------------------------------------------------------------------
#-- Error functions ----------------------------------------------------------
#-----------------------------------------------------------------------------

# Function to print an error message in red and exit
error() {
    local error_code=$1
    local message=$2

    # pfx has the name of the function that called this function
    local pfx="provo:${FUNCNAME[1]}"

    echo_error "[$pfx] $message"
    exit "$error_code"
}

#-----------------------------------------------------------------------------
#-- Installation functions ---------------------------------------------------
#-----------------------------------------------------------------------------

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Function to install a package based on the detected OS
install_package() {
    local package="$1"

    if ! command_exists "$package"; then
        # Detect OS
        local os=$(uname -s)
        case "$os" in
            Linux)
                if command_exists apt-get; then
                    sudo apt-get update && \
                    sudo apt-get install -y "$package" || error $? "Failed to install $package with apt-get"
                elif command_exists pacman; then
                    sudo pacman -Syu --noconfirm "$package" || error $? "Failed to install $package with pacman"
                elif command_exists dnf; then
                    sudo dnf install -y "$package" || error $? "Failed to install $package with dnf"
                elif command_exists yum; then
                    sudo yum install -y "$package" || error $? "Failed to install $package with yum"
                else
                    error $ERR_NOT_IMPLEMENTED "Unsupported package manager for Linux."
                fi
                ;;
            Darwin)
                if command_exists brew; then
                    brew install "$package" || error $? "Failed to install $package with Homebrew"
                else
                    error $ERR_MISSING_DEPENDENCY "Homebrew is not installed. Please install it first."
                fi
                ;;
            *)
                error $ERR_NOT_IMPLEMENTED "Unsupported operating system: $os"
                ;;
        esac
    else
        echo_warn "$package is already installed."
    fi
}

#-----------------------------------------------------------------------------

