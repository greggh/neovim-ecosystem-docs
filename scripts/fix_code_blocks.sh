#!/bin/bash

# Script to fix common code block issues in markdown files:
# 1. Add language specifier to code blocks (MD040)
# 2. Ensure blank lines around fenced code blocks (MD031)

find /home/gregg/Projects/docs-projects/neovim-ecosystem-docs -name "*.md" -type f | while read -r file; do
    echo "Processing $file for code block issues: $file"
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Function to determine context-appropriate language
    # Detect the right language based on content or surrounding headings
    detect_language() {
        local line_num=$1
        local file=$2
        local preceding_lines=5
        
        # Default to text if we can't determine context
        local default_lang="text"
        
        # Check preceding lines for headings with language hints
        if grep -B $preceding_lines -A 1 -n "^```$" "$file" | grep -i -E "## (lua|bash|yaml|json|markdown)" > /dev/null; then
            if grep -B $preceding_lines -A 1 -n "^```$" "$file" | grep -i "## lua" > /dev/null; then
                echo "lua"
            elif grep -B $preceding_lines -A 1 -n "^```$" "$file" | grep -i "## bash" > /dev/null; then
                echo "bash"
            elif grep -B $preceding_lines -A 1 -n "^```$" "$file" | grep -i "## yaml" > /dev/null; then
                echo "yaml"
            elif grep -B $preceding_lines -A 1 -n "^```$" "$file" | grep -i "## json" > /dev/null; then
                echo "json"
            elif grep -B $preceding_lines -A 1 -n "^```$" "$file" | grep -i "## markdown" > /dev/null; then
                echo "markdown"
            else
                echo "$default_lang"
            fi
        else
            echo "$default_lang"
        fi
    }
    
    # Use awk to handle multi-line operations
    awk '
    # Track if we are in a code block
    BEGIN { in_code_block = 0; last_was_empty = 0; }
    
    # Detect code block start
    /^```[a-zA-Z0-9]*$/ {
        # If this is a code block start without a language, add one
        if ($0 == "```") {
            # Check if previous line was empty
            if (!last_was_empty) {
                # Add a blank line before code block
                print "";
            }
            # Add code language (using default)
            print "```text";
        } else {
            # Already has a language specified
            # Check if previous line was empty
            if (!last_was_empty) {
                # Add a blank line before code block
                print "";
            }
            print $0;
        }
        in_code_block = 1;
        last_was_empty = 0;
        next;
    }
    
    # Handle code block end
    in_code_block && /^```$/ {
        # Add a blank line after code block if next line is not empty
        print $0;
        print "";
        in_code_block = 0;
        last_was_empty = 1;
        next;
    }
    
    # Track if the line is empty
    /^$/ { last_was_empty = 1; }
    !/^$/ { last_was_empty = 0; }
    
    # Print all other lines as-is
    { print; }
    ' "$file" > "$temp_file"
    
    # Replace the original file with the fixed one
    mv "$temp_file" "$file"
done

echo "Code block fixing complete"