# Prompts Maintenance

This prompt initiates a systematic review and update of all prompts in our tiered documentation system, ensuring they remain current and effective.

## Current Prompt Structure

### Core Session Prompts
1. **Startup Prompt** - `/home/gregg/Projects/docs/prompts/startup-prompt.md`
   - Purpose: Initialize projects context efficiently
   - Key components: Project overview, documentation structure, loading instructions

2. **End of Session** - `/home/gregg/Projects/docs/prompts/end-of-session.md`
   - Purpose: Document progress before ending a session
   - Key components: Documentation update checklist, summary format, preservation rules

### Workflow Prompts
3. **Command Patterns** - `/home/gregg/Projects/docs/prompts/command-patterns.md`
   - Purpose: Guide efficient command usage across projects
   - Key components: Tool recommendations, command principles, examples

4. **Ecosystem Review** - `/home/gregg/Projects/docs/prompts/ecosystem-review.md`
   - Purpose: Comprehensive review of all projects for consistency
   - Key components: Review scope, categories, process details, deliverables

5. **Hooks and Workflows Maintenance** - `/home/gregg/Projects/docs/prompts/hooks-workflow-maintenance.md`
   - Purpose: Audit and maintain pre-commit hooks and GitHub workflows
   - Key components: Audit process, fix strategy, critical guardrails

6. **Prompts Maintenance** - `/home/gregg/Projects/docs/prompts/prompts-maintenance.md`
   - Purpose: Self-referential prompt to maintain all prompts
   - Key components: Prompt list, review process, update guidelines

## Review Process

For each prompt:

1. **Read and Analyze Current Content**
   - Examine structure, completeness, and clarity
   - Identify outdated information or references
   - Check alignment with current ecosystem structure

2. **Verify Alignment with Documentation System**
   - Cross-reference with ecosystem overview
   - Check consistency with project status information
   - Ensure compatibility with task tracking system

3. **Check for Recent Changes**
   - Review project additions or removals
   - Identify new standards or conventions established
   - Note changes in file paths or repository structures
   - Update references to workflows or processes

4. **Cross-Prompt Consistency Check**
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

2. **Content Standards**
   - Use absolute file paths
   - Include concrete examples for complex instructions
   - Provide command examples using modern tools (fd, rg, git -C)
   - Include reference links to related documentation

3. **Format Consistency**
   - Use markdown tables for comparative information
   - Use code blocks with language specification for commands
   - Use numbered lists for sequential processes
   - Use bullet lists for non-sequential items

4. **Future-Proofing**
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

2. **Standard Sections**
   - Title and purpose statement
   - Scope and applicability
   - Process or workflow details
   - Examples and usage patterns
   - Reference materials

3. **Integration with Existing System**
   - Reference from appropriate existing prompts
   - Update prompt maintenance document
   - Add to documentation system references

## Maintenance Schedule

Recommended maintenance intervals:

1. **Regular Review**
   - Full prompts audit every 3 months
   - Verification after major ecosystem changes
   - Update references when file paths change

2. **Incremental Updates**
   - Update affected prompts after workflow changes
   - Add new prompts as needs are identified
   - Revise examples to reflect current best practices

## Reference Materials

- Ecosystem Overview: `/home/gregg/Projects/docs/ecosystem-overview.md`
- Project Status: `/home/gregg/Projects/docs/project-status.md`
- Documentation Structure: `/home/gregg/Projects/docs/specs/documentation-structure.md`