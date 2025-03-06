# Neovim Ecosystem Project Initialization

Hello Claude, we're continuing our work together on our Neovim ecosystem projects. This prompt is designed to efficiently initialize the proper context.

## Projects Overview

I'm working on multiple interconnected Neovim projects with a focus on standardization, quality, and testing. The key projects include:

1. **Neovim Configuration**: My personal Neovim setup at `/home/gregg/.config/nvim`
2. **lust-next**: Enhanced Lua testing framework
3. **hooks-util**: Git hooks framework for pre-commit validation
4. **nvim-toolkit**: Shared runtime utilities library
5. **Neovim plugins**: Laravel Helper, Claude Code integration
6. **Templates**: Base project, Neovim plugin and config templates

## Documentation Structure

To save context space, documentation has been organized in a tiered system (fully detailed in `/home/gregg/Projects/docs/specs/documentation-structure.md`):

### Tier 1: Essential Context (LOAD FIRST)
- `/home/gregg/Projects/docs/ecosystem-overview.md` - Core context (150-200 lines)

### Tier 2: Current Status (LOAD WHEN NEEDED)
- `/home/gregg/Projects/docs/project-status.md` - Current project statuses
- `/home/gregg/Projects/docs/tasks/[project]-tasks.md` - Project-specific tasks

### Tier 3: Reference Materials (LOAD ON DEMAND)
- `/home/gregg/Projects/docs/specs/` - Architecture specifications
  - `/home/gregg/Projects/docs/specs/documentation-structure.md` - Documentation system specification
  - `/home/gregg/Projects/docs/specs/adapter-architecture.md` - Adapter system specification
  - `/home/gregg/Projects/docs/specs/test-quality-levels.md` - Test quality validation specification
- `/home/gregg/Projects/docs/plans/` - Implementation plans
- `/home/gregg/Projects/docs/project-history.md` - Historical session logs

## Project-Specific Information

Each project has a CLAUDE.md file with project-specific commands and information:
- `/home/gregg/Projects/lust-next/CLAUDE.md`
- `/home/gregg/Projects/hooks-util/CLAUDE.md`
- `/home/gregg/.config/nvim/CLAUDE.md`
- etc.

## START HERE

1. **IMMEDIATELY READ the ecosystem overview**: 
   - `/home/gregg/Projects/docs/ecosystem-overview.md`

2. **BASED ON MY TASK, selectively load**:
   - Project status: `/home/gregg/Projects/docs/project-status.md`
   - Relevant tasks file: `/home/gregg/Projects/docs/tasks/[project]-tasks.md`
   - Project-specific CLAUDE.md for the project in question

3. **ONLY IF NEEDED, reference**:
   - Architecture specs
   - Implementation plans
   - Historical information

## Important Notes

1. **CRITICAL: NEVER use the `cd` command in any work**
   - Always use `env -C /path/to/dir command` for running commands in specific directories
   - Always use `git -C /path/to/repo` for git operations
   - For more details, read `/home/gregg/Projects/docs/prompts/command-patterns.md`

2. **Always load these essential prompts:**
   - Command patterns: `/home/gregg/Projects/docs/prompts/command-patterns.md`
   - Project-specific CLAUDE.md file for the current project

3. **Follow these workflow guidelines:**
   - Wait for me to specify the next task before proceeding
   - Always make changes locally using git workflow (edit, add, commit, push)
   - Use full absolute paths for all file references

I'll begin by telling you which project I'm working on, and you should load the appropriate context.