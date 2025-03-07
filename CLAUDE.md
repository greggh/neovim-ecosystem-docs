
# Project: Neovim Ecosystem Documentation

## Overview

Neovim Ecosystem Documentation is the central knowledge repository for all Neovim-related projects in our ecosystem. It provides comprehensive documentation, workflow prompts, and specifications that guide development across all projects.

## Essential Commands

- Check Markdown Formatting: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs markdownlint '**/*.md' --ignore node_modules`
- Fix Markdown Issues: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs markdownlint --fix '**/*.md' --ignore node_modules`
- Check YAML Formatting: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs yamllint .`
- Run Pre-commit Hooks: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs pre-commit run --all-files`
- Push to GitHub: `git -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs push origin main`

## Auto-Fix Scripts

- Comprehensive Markdown Fix: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_markdown_comprehensive.sh`
- Fix List Numbering: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_list_numbering.sh`
- Fix Heading Levels: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_heading_levels.sh`
- Fix Code Blocks: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_code_blocks.sh`
- Fix Newlines: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_newlines.sh`

## Project Structure

- `/prompts`: Workflow prompts for various development activities
- `/specs`: Technical specifications and architecture documents
- `/tasks`: Project-specific task tracking
- `/templates`: Templates for creating new documentation and files
- `/metrics`: Prompt effectiveness tracking and metrics
- `/archives`: Archive of older project history entries
- `/scripts`: Utility scripts for linting and fixing documentation

## Current Focus

- Implementing the README standardization system across all projects
- Applying auto-fixing scripts and pre-commit hooks to other repositories
- Building metrics validation and tracking for documentation effectiveness
- Developing comprehensive style guide for all documentation
- Creating visual documentation system for architecture diagrams
- Automating documentation quality processes

## Documentation Links

- Ecosystem Overview: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`
- Project Status: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`
- Tasks: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/` directory
- Cross-Reference Guide: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/cross-reference.md`
