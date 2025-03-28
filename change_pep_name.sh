#!/bin/bash

# Set the base path where all simulation folders are located
base_path=~/Documents/moritz/exp_md_sim

# Loop through each subdirectory in the base path
for dir in "$base_path"/*/ ; do
    # Skip if it's not a directory
    [ -d "$dir" ] || continue

    # Get the name of the folder (used as protein name)
    folder_name=$(basename "$dir")
    auto_sh="$dir/auto.sh"

    # Check if the auto.sh script exists in the current folder
    if [ -f "$auto_sh" ]; then
        echo " Adjusting $auto_sh for protein: $folder_name"

        # Replace the line that starts with 'protein=' with the current folder name
        sed -i "s/^protein=.*/protein=\"$folder_name\"/" "$auto_sh"
    else
        echo "No auto.sh file found in $dir"
    fi
done

