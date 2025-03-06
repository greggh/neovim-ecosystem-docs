# Project: Neovim Ecosystem Documentation

## Overview

Neovim Ecosystem Documentation is the central knowledge repository for all Neovim-related projects in our ecosystem. It provides comprehensive documentation, workflow prompts, and specifications that guide development across all projects.

## Essential Commands

- Check Markdown Formatting: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs markdownlint '**/*.md' --ignore node_modules`
- Fix Markdown Issues: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs markdownlint --fix '**/*.md' --ignore node_modules`
- Check YAML Formatting: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs yamllint .`
- Fix Newlines: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_newlines.sh`
- Fix Code Blocks: `env -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs ./scripts/fix_code_blocks.sh`
- Push to GitHub: `git -C /home/gregg/Projects/docs-projects/neovim-ecosystem-docs push origin main`

## Project Structure

- `/prompts`: Workflow prompts for various development activities
- `/specs`: Technical specifications and architecture documents
- `/tasks`: Project-specific task tracking
- `/templates`: Templates for creating new documentation and files
- `/metrics`: Prompt effectiveness tracking and metrics
- `/archives`: Archive of older project history entries
- `/scripts`: Utility scripts for linting and fixing documentation

## Current Focus

- Maintaining up-to-date documentation for all ecosystem projects
- Refining workflow prompts based on effectiveness metrics
- Ensuring all paths and references are updated after project restructuring
- Building a comprehensive cross-reference system for easier navigation
- Improving metrics collection and analysis for documentation effectiveness
- Fixing linting issues in Markdown and YAML files

## Documentation Links

- Ecosystem Overview: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`
- Project Status: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`
- Tasks: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/` directory
- Cross-Reference Guide: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/cross-reference.md`
