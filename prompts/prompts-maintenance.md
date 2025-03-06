
# Prompts Maintenance

This prompt initiates a systematic review and update of all prompts in our tiered documentation system, ensuring they remain current and effective.

## Current Prompt Structure

### Core Session Prompts

1. **Startup Prompt** - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/startup-prompt.md`
   - Purpose: Initialize projects context efficiently
   - Key components: Project overview, documentation structure, loading instructions

1. **End of Session** - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/end-of-session.md`
   - Purpose: Document progress before ending a session
   - Key components: Documentation update checklist, summary format, preservation rules

### Workflow Prompts

1. **Command Patterns** - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/command-patterns.md`
   - Purpose: Guide efficient command usage across projects
   - Key components: Tool recommendations, command principles, examples

1. **Ecosystem Review** - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/ecosystem-review.md`
   - Purpose: Comprehensive review of all projects for consistency
   - Key components: Review scope, categories, process details, deliverables

1. **Hooks and Workflows Maintenance** - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/hooks-workflow-maintenance.md`
   - Purpose: Audit and maintain pre-commit hooks and GitHub workflows
   - Key components: Audit process, fix strategy, critical guardrails

1. **Prompts Maintenance** - `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/prompts-maintenance.md`
   - Purpose: Self-referential prompt to maintain all prompts
   - Key components: Prompt list, review process, update guidelines

## Review Process

For each prompt:

1. **Read and Analyze Current Content**
   - Examine structure, completeness, and clarity
   - Identify outdated information or references
   - Check alignment with current ecosystem structure

1. **Verify Alignment with Documentation System**
   - Cross-reference with ecosystem overview
   - Check consistency with project status information
   - Ensure compatibility with task tracking system

1. **Check for Recent Changes**
   - Review project additions or removals
   - Identify new standards or conventions established
   - Note changes in file paths or repository structures
   - Update references to workflows or processes

1. **Cross-Prompt Consistency Check**
   - Ensure information is consistent across all prompts
   - Verify no conflicting guidance or instructions
   - Confirm standardized formatting and terminology

## Update Guidelines

When updating prompts:

1. **Structure and Organization**
   - Use clear, hierarchical headings
   - Group related information logically
   - Include purpose statement at the beginning
   - End with reference materials section

1. **Content Standards**
   - Use absolute file paths
   - Include concrete examples for complex instructions
   - Provide command examples using modern tools (fd, rg, git -C)
   - Include reference links to related documentation

1. **Format Consistency**
   - Use markdown tables for comparative information
   - Use code blocks with language specification for commands
   - Use numbered lists for sequential processes
   - Use bullet lists for non-sequential items

1. **Future-Proofing**
   - Design prompts to accommodate future project additions
   - Use principles rather than just specific examples
   - Reference the tiered documentation system properly
   - Include clear update mechanisms within each prompt

## Creating New Prompts

Guidelines for adding new prompts:

1. **Determine Prompt Type**
   - Session management prompts
   - Workflow/task prompts
   - Project-specific prompts
   - Emergency/troubleshooting prompts

1. **Standard Sections**
   - Title and purpose statement
   - Scope and applicability
   - Process or workflow details
   - Examples and usage patterns
   - Reference materials

1. **Integration with Existing System**
   - Reference from appropriate existing prompts
   - Update prompt maintenance document
   - Add to documentation system references
   - Update metrics tracking:

     ```bash
     # Add new prompt to the metrics file
     [editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md
     ```

     - Add a new entry in the Summary Statistics table:

     ```markdown
     | new-prompt-name | 0 | 0% | 0 min | 0.0 |
     ```

     - Include metrics collection section in new prompt using the template:

     ```bash
     cat /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/templates/metrics-reminder.md
     ```

## Removing Prompts

When a prompt is no longer needed:

1. **Archive the Prompt**
   - Don't delete prompts immediately; archive them first
   - Move to an archive directory: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/archive/`

   ```bash
   mkdir -p /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/archive
   git -C /home/gregg/Projects/docs mv prompts/obsolete-prompt.md prompts/archive/
   ```

1. **Update References**
   - Remove references to the prompt from other prompts
   - Update the cross-reference guide
   - Remove from documentation lists

1. **Update Metrics Tracking**
   - Remove the prompt from the metrics summary table:

   ```bash
   [editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md
   ```

   - Preserve historical metrics data in the detailed records section
   - Add a note that the prompt has been archived

1. **Document Reasons**
   - Record why the prompt was removed
   - Note any replacement prompts or workflows
   - Keep this information in the commit message

## Maintenance Schedule

Recommended maintenance intervals:

1. **Regular Review**
   - Full prompts audit every 3 months
   - Verification after major ecosystem changes
   - Update references when file paths change
   - Review metrics data using the metrics-review.md prompt

1. **Incremental Updates**
   - Update affected prompts after workflow changes
   - Add new prompts as needs are identified
   - Revise examples to reflect current best practices
   - Keep metrics tracking synchronized with prompt changes

1. **Metrics System Maintenance**
   - Ensure all prompts have metrics collection sections
   - Verify the metrics file contains entries for all active prompts
   - Create monthly review reports in metrics/monthly-reviews/
   - Use metrics data to prioritize prompt improvements

## Reference Materials

- Ecosystem Overview: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`
- Project Status: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`
- Documentation Structure: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/documentation-structure.md`
- Prompt Effectiveness: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/prompt-effectiveness.md`

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash

# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md

```text

Add a new entry with the following format:

```markdown

## YYYY-MM-DD - prompts-maintenance

- **Task**: Brief description of the prompt maintenance performed
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement

```text

This data helps us continuously improve our workflow prompts.

