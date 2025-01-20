#!/bin/bash

# Set TERM variable if not set
if [ -z "$TERM" ]; then
    export TERM=xterm-256color
fi

# Reset
Color_Off='\033[0m'       # Text Reset

# Blue Colors
Blue='\033[0;34m'         # Blue
Light_Blue='\033[1;34m'   # Light Blue

# Function to center and color text
print_centered() {
    local input="$1"
    local color="$2"
    local term_width=$(tput -T xterm-256color cols)
    local text_width=${#input}

    # Strip color codes for width calculation
    local stripped_input=$(echo -e "$input" | sed 's/\x1b\[[0-9;]*m//g')
    local stripped_width=${#stripped_input}

    # Calculate padding
    local pad_width=$(( (term_width - stripped_width) / 2 ))
    local padding=$(printf '%*s' "$pad_width")

    # Print with color and padding
    echo -e "${padding}${color}${input}${Color_Off}"
}

# Define BANNER_ART here
BANNER_ART="
 __          ___    _       _______ _____ _____ _  ________ _______ 
 \ \        / / |  | |   /\|__   __|_   _/ ____| |/ /  ____|__   __|
  \ \  /\  / /| |__| |  /  \  | |    | || |    | ' /| |__     | |   
   \ \/  \/ / |  __  | / /\ \ | |    | || |    |  < |  __|    | |   
    \  /\  /  | |  | |/ ____ \| |   _| || |____| . \| |____   | |   
     \/  \/   |_|  |_/_/    \_\_|  |_____\_____|_|\_\______|  |_|    
                                                                             "

print_banner() {
    # Clear the screen
    clear

    # Print banner art line by line, centered with animation
    while IFS= read -r line; do
        print_centered "$line" "$Blue"
        sleep 0.1
    done <<< "$BANNER_ART"

    # Print information text, centered
    print_centered "© 2025" "$Light_Blue"

    # Ensure the color settings are reset
    echo -e "$Color_Off"
}

# Call the function print_banner here, if necessary
print_banner
