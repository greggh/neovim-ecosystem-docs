# Documentation Structure Specification

This document defines the tiered documentation structure for the Neovim ecosystem projects.

## Documentation Tiers

The documentation system is organized into three tiers to optimize context usage and information access:

### Tier 1: Essential Context

Files that provide core context about the ecosystem and should be loaded first:

- **ecosystem-overview.md** (`/home/gregg/Projects/docs/ecosystem-overview.md`)
  - Provides a concise (150-200 lines) overview of all projects in the ecosystem
  - Lists current priorities and focus areas
  - Explains architecture principles and relationships between projects
  - Contains links to Tier 2 and Tier 3 documentation

### Tier 2: Current Status

Files that provide up-to-date information about project status and ongoing tasks:

- **project-status.md** (`/home/gregg/Projects/docs/project-status.md`)
  - Shows current status of all projects in the ecosystem
  - Lists key features and their completion status
  - Details active next steps for each project
  - Updated at the end of each session with the latest progress

- **Project-specific task files** (`/home/gregg/Projects/docs/tasks/[project]-tasks.md`)
  - Contains detailed task lists for each project
  - Organizes tasks by priority (high, medium, low)
  - Tracks completion status with checkboxes
  - Updates reflect current focus and remaining work

### Tier 3: Reference Materials

Detailed documentation for reference when specific information is needed:

- **Architecture specifications** (`/home/gregg/Projects/docs/specs/`)
  - Contains detailed architecture specifications for key components
  - Explains design decisions and implementation details
  - Provides diagrams and structural information
  - Serves as authoritative reference for implementation

- **Implementation plans** (`/home/gregg/Projects/docs/plans/`)
  - Contains detailed plans for implementing specific features
  - Breaks down complex tasks into step-by-step processes
  - Tracks completion status for major implementation efforts
  - Provides reasoning behind implementation approaches

- **Project history** (`/home/gregg/Projects/docs/project-history.md`)
  - Maintains chronological record of all sessions
  - Preserves details of completed work for reference
  - Documents decisions and their rationale
  - Provides historical context for future development

## Project-Specific Documentation

Each project maintains its own CLAUDE.md file with project-specific information:

- **CLAUDE.md** (at the root of each project directory)
  - Project overview and purpose
  - Key features and components
  - Development commands
  - Project structure
  - Recent improvements
  - Best practices and examples

## Prompt System

Specialized prompts in the `/home/gregg/Projects/docs/prompts/` directory:

### Session Management Prompts
- `startup-prompt.md`: Initializes project context efficiently
- `end-of-session.md`: Documents progress before ending session

### Workflow Prompts
- `command-patterns.md`: Guides efficient command usage
- `ecosystem-review.md`: Comprehensive project review process
- `hooks-workflow-maintenance.md`: CI/CD maintenance instructions
- `prompts-maintenance.md`: Prompt system self-management

### Future Specialized Prompts
- Project initialization
- Feature implementation
- Bug fixing workflow
- Code review and quality checks
- Release preparation
- Test suite enhancement
- And others as needed

## Documentation Flow

The documentation system follows a specific flow for optimal usage:

1. **Start with Tier 1**: Load the ecosystem overview for essential context
2. **Selectively load Tier 2**: Based on the current task, load relevant status and task files
3. **Reference Tier 3 when needed**: Load detailed specifications, plans, or history only when specific information is required
4. **Use project-specific CLAUDE.md**: Consult the project's CLAUDE.md for project-specific commands and information
5. **Apply appropriate prompts**: Use specialized prompts for specific workflows or tasks

## Maintenance Process

The documentation system requires regular maintenance:

1. **End of session updates**:
   - Update project-status.md with latest progress
   - Update relevant task files with completed tasks
   - Add new entry to project-history.md
   - Update project-specific CLAUDE.md files as needed

2. **Regular audits**:
   - Conduct monthly audit of all documentation for accuracy
   - Ensure documentation reflects current project state
   - Update any outdated references or instructions
   - Maintain cross-references between documentation files

3. **Prompt maintenance**:
   - Review and update prompts quarterly
   - Add new prompts as workflow needs are identified
   - Ensure all prompts are consistent with current practices
   - Update command examples to reflect best practices