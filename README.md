
# Neovim Ecosystem Documentation

[![Lint Markdown](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/markdown-lint.yml)
[![Lint YAML](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/yaml-lint.yml/badge.svg)](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/yaml-lint.yml)
[![Build Documentation](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/docs-build.yml/badge.svg)](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/docs-build.yml)

Documentation for the Neovim ecosystem projects, providing comprehensive guidance for development workflows, project standards, and technical specifications.

## Documentation Structure

This documentation repository uses a tiered system to optimize context usage and information access:

### Tier 1: Essential Context

- [**ecosystem-overview.md**](ecosystem-overview.md) - Core overview of all projects in the ecosystem

### Tier 2: Current Status

- [**project-status.md**](project-status.md) - Current status of all projects
- **Project-specific task files** in the [tasks/](tasks/) directory

### Tier 3: Reference Materials

- **Technical specifications** in the [specs/](specs/) directory
- **Implementation plans** in the [plans/](plans/) directory
- [**project-history.md**](project-history.md) - Recent development sessions (latest 10)
- [**archives/project-history-archive.md**](archives/project-history-archive.md) - Archived development sessions

## Workflow Prompts

A comprehensive set of workflow prompts to guide development processes:

- **Session management**: startup-prompt.md, end-of-session.md
- **Development workflows**: project-initialization.md, feature-implementation.md, bug-fixing.md, code-review.md
- **System maintenance**: command-patterns.md, ecosystem-review.md, hooks-workflow-maintenance.md, prompts-maintenance.md

## Navigation

To easily navigate the documentation:

1. Start with the [**Ecosystem Overview**](ecosystem-overview.md) for a high-level understanding
2. Check the [**Cross-Reference Guide**](cross-reference.md) to find related documentation
3. Use the appropriate workflow prompt from the [prompts/](prompts/) directory

## Templates

Standardized templates for creating consistent documentation and configurations:

- [**Technical Specification Template**](templates/technical-spec-with-diagrams.md) - For creating visual technical specifications
- [**CLAUDE.md Template**](templates/CLAUDE.md.template) - For project-specific documentation
- [**FUNDING.yml**](templates/FUNDING.yml) - Standard GitHub sponsorship configuration

## Metrics and Improvement

We track the effectiveness of our documentation through:

- **Prompt effectiveness metrics** in the [metrics/](metrics/) directory
- **Monthly reviews** to continuously improve our documentation

---

For guidance on navigating this documentation system, see the [**Cross-Reference Guide**](cross-reference.md).
