#!/bin/bash

# Script to add language specifier to code blocks

# Use a simple sed command to replace ``` with ```text by default
# This fixes MD040 (missing language specifier in code blocks)

find /home/gregg/Projects/docs-projects/neovim-ecosystem-docs -name "*.md" -type f | while read -r file; do
    echo "Processing $file"
    sed -i 's/^```$/```text/' "$file"
done

echo "Code block fixing complete"