
# Neovim Ecosystem Project Initialization

## FOR CLAUDE: READ THESE FILES IMMEDIATELY

Hello Claude, we're continuing our work together on our Neovim ecosystem projects. This prompt is designed to efficiently initialize the proper context. As soon as you receive this prompt, please read the following files in order:

1. **THIS ENTIRE PROMPT DOCUMENT FIRST**
2. `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`
3. `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`
4. `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/command-patterns.md`

## Projects Overview

I'm working on multiple interconnected Neovim projects with a focus on standardization, quality, and testing. The key projects include:

1. **Neovim Configuration**: My personal Neovim setup at `/home/gregg/.config/nvim`
2. **lust-next**: Enhanced Lua testing framework
3. **hooks-util**: Git hooks framework for pre-commit validation
4. **nvim-toolkit**: Shared runtime utilities library
5. **Neovim plugins**: Laravel Helper, Claude Code integration
6. **Templates**: Base project, Neovim plugin and config templates

## Documentation Structure

To save context space, documentation has been organized in a tiered system (fully detailed in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/documentation-structure.md`):

### Tier 1: Essential Context (LOAD FIRST)

- `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md` - Core context (150-200 lines)

### Tier 2: Current Status (LOAD WHEN NEEDED)

- `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md` - Current project statuses
- `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/[project]-tasks.md` - Project-specific tasks

### Tier 3: Reference Materials (LOAD ON DEMAND)

- `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/` - Architecture specifications
  - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/documentation-structure.md` - Documentation system specification
  - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/adapter-architecture.md` - Adapter system specification
  - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/test-quality-levels.md` - Test quality validation specification
- `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/plans/` - Implementation plans
- `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-history.md` - Historical session logs

## Project-Specific Information

Each project has a CLAUDE.md file with project-specific commands and information:

- `/home/gregg/Projects/lua-library/lust-next/CLAUDE.md`
- `/home/gregg/Projects/lua-library/hooks-util/CLAUDE.md`
- `/home/gregg/.config/nvim/CLAUDE.md`
- etc.

## START HERE

1. **IMMEDIATELY READ the ecosystem overview**:
   - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`

1. **BASED ON MY TASK, selectively load**:
   - Project status: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`
   - Relevant tasks file: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/[project]-tasks.md`
   - Project-specific CLAUDE.md for the project in question

1. **ONLY IF NEEDED, reference**:
   - Architecture specs
   - Implementation plans
   - Historical information

## Important Notes

1. **CRITICAL: NEVER use the `cd` command in any work**
   - Always use `env -C /path/to/dir command` for running commands in specific directories
   - Always use `git -C /path/to/repo` for git operations
   - For more details, read `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/command-patterns.md`

1. **Always load these essential prompts:**
   - Command patterns: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/command-patterns.md`
   - Project-specific CLAUDE.md file for the current project

1. **Follow these workflow guidelines:**
   - Wait for me to specify the next task before proceeding
   - Always make changes locally using git workflow (edit, add, commit, push)
   - Use full absolute paths for all file references

I'll begin by telling you which project I'm working on, and you should load the appropriate context.

## Required Actions After Reading This Prompt

After reading this entire prompt and the required files, Claude should:

1. **Confirm** that you've read the essential files
2. **Ask** which specific project we'll be working on today
3. **Load** project-specific files (tasks and CLAUDE.md) based on my answer
4. **Acknowledge** understanding of the command patterns and no-cd policy
5. **Wait** for me to specify the next task before proceeding

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash

# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md

```text

Add a new entry with the following format:

```markdown

## YYYY-MM-DD - startup-prompt

- **Task**: Brief description of the session started
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement

```text

This data helps us continuously improve our workflow prompts.

