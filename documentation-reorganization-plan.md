# Documentation Reorganization Plan

## Problem
Our current documentation approach requires loading thousands of lines of files at the start of each Claude session, which:
- Consumes valuable context length
- Makes it difficult to find specific information
- Contains redundant information across files
- Leads to context overflow in long sessions

## Tiered Documentation System

### 1. Create a Tiered Documentation System
- **Tier 1**: Essential context (load at chat start)
- **Tier 2**: Project-specific details (load when working on a project)
- **Tier 3**: Reference materials (load only when needed)

### 2. Replace Current Documents With:

#### Tier 1: Core Context (Always Load)
- **ecosystem-overview.md** (150-200 lines)
  - Project list with 1-line descriptions
  - Current priorities (5-7 bullet points)
  - Architecture principles (5-7 bullet points)
  - Links to other documents

#### Tier 2: Project-Specific Files (Load When Needed)
- **project-status.md** (200-300 lines)
  - Current status of each project (not history)
  - Active next steps only
- **[project]-tasks.md** for each project
  - Immediate tasks and requirements
  - Current focus areas

#### Tier 3: Reference Materials
- **project-history.md** (archive historical sessions)
- **implementation-plans/** (directory with detailed plans)
- **architecture-specs/** (directory with technical details)

### 3. CLAUDE.md Improvements
- Standardize format across all projects
- Limit to critical commands and references
- Remove duplicated information
- Include links to Tier 2/3 documents

### 4. Start-up Script
Create a small script that just lists active projects and directs to load only what's needed:
```
To continue work on [project]:
1. Read ecosystem-overview.md
2. Read [project]-tasks.md
3. Load the CLAUDE.md from [project] directory
```

## Proposed Directory Structure

```
/home/gregg/Projects/
├── docs/                           # Centralized documentation
│   ├── ecosystem-overview.md       # [TIER 1] Essential ecosystem information
│   ├── project-status.md           # [TIER 2] Current status of all projects
│   ├── project-history.md          # [TIER 3] Historical session logs
│   ├── tasks/                      # [TIER 2] Current tasks by project
│   │   ├── lust-next-tasks.md
│   │   ├── hooks-util-tasks.md
│   │   ├── nvim-toolkit-tasks.md
│   │   └── ...
│   ├── specs/                      # [TIER 3] Detailed specifications
│   │   ├── adapter-architecture.md
│   │   ├── test-quality-levels.md
│   │   ├── version-management.md
│   │   └── ...
│   └── plans/                      # [TIER 3] Implementation plans
│       ├── test-quality-plan.md
│       ├── lust-next-architecture.md
│       └── hooks-util-architecture.md
├── templates/                      # Standardized templates
│   └── CLAUDE.md.template          # Template for project CLAUDE.md files
├── [project1]/                     # Each project directory
│   ├── CLAUDE.md                   # Simplified project-specific commands
│   └── ...
├── [project2]/
│   ├── CLAUDE.md
│   └── ...
└── ...
```

## Standard CLAUDE.md Template

```markdown
# Project: [Project Name]

## Overview
[1-2 paragraph description of the project]

## Essential Commands
- Build: `command`
- Test: `command`
- Lint: `command`
- [Other key commands]

## Project Structure
- `/src`: [brief description]
- `/tests`: [brief description]
- [Other key directories]

## Current Focus
- [1-3 bullet points about current priorities]

## Documentation Links
- Tasks: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/[project]-tasks.md`
- Architecture: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/[relevant-spec].md`
- [Other relevant links]
```

## Migration Plan

1. Create the new directory structure
2. Create the ecosystem-overview.md as the core context document
3. Extract current status information into project-status.md
4. Move historical information to project-history.md
5. Create individual task documents for active projects
6. Extract specialized information into reference documents
7. Update all CLAUDE.md files to follow the new template
8. Create a startup script for continued development

This approach will reduce initial context by 70-80% while ensuring all information remains accessible when needed.