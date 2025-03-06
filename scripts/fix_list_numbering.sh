#!/bin/bash

# Script to fix list numbering in markdown files
# Resets section numbering to start from 1 after each heading

find /home/gregg/Projects/docs-projects/neovim-ecosystem-docs -name "*.md" -type f | while read -r file; do
    echo "Processing $file for list numbering"

    # Create a temporary file
    temp_file=$(mktemp)

    # Process the file line by line
    in_list=false
    list_counter=0
    previous_line=""

    while IFS= read -r line; do
        # Check if line is a heading
        if [[ "$line" =~ ^#+ ]]; then
            in_list=false
            list_counter=0
            echo "$line" >> "$temp_file"
            previous_line="$line"
            continue
        fi

        # Check if line is an ordered list item
        if [[ "$line" =~ ^[[:space:]]*[0-9]+\. ]]; then
            # If previous line was empty or a heading, start a new list
            if [[ "$previous_line" =~ ^[[:space:]]*$ || "$previous_line" =~ ^#+ ]]; then
                in_list=true
                list_counter=1
                # Replace the number with 1
                echo "${line/[0-9]\./$list_counter\.}" >> "$temp_file"
            else
                # Continue the list
                if [ "$in_list" = true ]; then
                    list_counter=$((list_counter + 1))
                    # Replace the number with the current counter
                    echo "${line/[0-9]\./$list_counter\.}" >> "$temp_file"
                else
                    echo "$line" >> "$temp_file"
                fi
            fi
        else
            # Not a list item
            echo "$line" >> "$temp_file"
            # Check if we're exiting a list
            if [[ "$line" =~ ^[[:space:]]*$ && "$in_list" = true ]]; then
                in_list=false
                list_counter=0
            fi
        fi

        previous_line="$line"
    done < "$file"

    # Replace the original file with the fixed one
    mv "$temp_file" "$file"
done

echo "List numbering fix complete"
