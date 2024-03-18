#!/bin/bash

# Function to list folders in the current directory
list_folders() {
    local options=$(ls -d */ .. 2>/dev/null | awk -F/ '{print $1 " " $1}')
    dialog --title "Select a folder" --menu "Choose a folder to navigate into:" 0 0 0 $options 2>&1 >/dev/tty
}

# Main loop
while true; do
    choice=$(list_folders)

    # Check if user cancelled or didn't select anything
    if [ -z "$choice" ]; then
        dialog --title "Exit" --yesno "Change directory?" 0 0
        exit_status=$?
        if [ $exit_status -eq 0 ]; then
            clear
            echo "cd $choice"
            break
        fi
    elif [ "$choice" = ".." ]; then
        # Go back one directory
        cd ..
    else
        # Change directory into the selected folder
        cd "$choice" || {
            dialog --title "Error" --msgbox "Failed to change directory into $choice" 0 0
            continue
        }
    fi
done