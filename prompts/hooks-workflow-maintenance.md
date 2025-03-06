
# Hooks and Workflows Maintenance

This prompt initiates a comprehensive audit and maintenance of pre-commit hooks and GitHub workflows across all Neovim ecosystem projects.

## Scope and Objectives

1. **Verify and Fix Pre-commit Hooks**
   - Ensure hooks-util is properly integrated
   - Verify all required checks are configured and passing
   - Fix any failing or misconfigured hooks

1. **Validate GitHub Workflows**
   - Verify CI/CD, documentation, and release workflows
   - Ensure consistent patterns across projects
   - Fix any failing or misconfigured workflows

1. **Check Integration Components**
   - Verify proper submodule and dependency management
   - Check for cross-project integration consistency
   - Ensure version management is working properly

## Project List

### Primary Projects

1. **Neovim Configuration** - `/home/gregg/.config/nvim`
2. **Laravel Helper Plugin** - `/home/gregg/Projects/neovim/plugins/laravel-helper`
3. **Claude Code Plugin** - `/home/gregg/Projects/neovim/plugins/claude-code`
4. **Lust-Next** - `/home/gregg/Projects/lua-library/lust-next`

### Supporting Projects

1. **Base Project Template** - `/home/gregg/Projects/templates/base-project-repo`
2. **Hooks-Util** - `/home/gregg/Projects/lua-library/hooks-util`
3. **Neovim Plugin Template** - `/home/gregg/Projects/templates/neovim-plugin-template`
4. **Neovim Config Template** - `/home/gregg/Projects/templates/neovim-config-template`
5. **Nvim-Toolkit** - `/home/gregg/Projects/neovim/nvim-toolkit`

### Test Projects

1. **Lust-Next Testbed** - `/home/gregg/Projects/lua-library/lust-next-testbed`
2. **Hooks-Util Testbed Projects** - Various testbed projects

## Maintenance Process

For each project, the following steps will be performed:

### 1. Pre-commit Hooks Audit

- Check for proper hooks-util integration:

  ```bash
  git -C /path/to/project config --get-regexp 'hooks'
  git -C /path/to/project submodule status -- hooks-util
  ls -la /path/to/project/.git/hooks/
  ```

- Verify hook configuration:

  ```bash
  cat /path/to/project/.hooks-util.lua
  # or
  cat /path/to/project/.pre-commit-config.yaml
  ```

- Test hook execution:

  ```bash
  env -C /path/to/project git hooks run pre-commit
  # or
  env -C /path/to/project pre-commit run --all-files
  ```

- Fix hooks configuration issues:
  - Update hooks-util integration if needed
  - Modify hook configuration files
  - Ensure all required linters and validators are installed

### 2. GitHub Workflows Audit

- Check workflow configuration files:

  ```bash
  ls -la /path/to/project/.github/workflows/
  cat /path/to/project/.github/workflows/ci.yml
  ```

- Verify workflow status:

  ```bash
  gh workflow list -R owner/repo
  gh run list -R owner/repo -w "CI"
  ```

- Fix workflow issues:
  - Update workflow configuration files
  - Ensure consistent patterns with template repositories
  - Fix any workflow steps that are failing

### 3. Integration Verification

- Check hooks-util submodule:

  ```bash
  git -C /path/to/project submodule status
  ```

- Verify nvim-toolkit integration (where applicable):

  ```bash
  rg -g "*.lua" -l "require.*nvim-toolkit" /path/to/project
  ```

- Check template upstream configuration:

  ```bash
  git -C /path/to/project remote -v
  ```

## Fix Strategy

When addressing issues:

1. **Fix Underlying Problems**, NOT Symptoms
   - Correct code issues, not bypass quality checks
   - Update dependencies rather than disable failing checks
   - Investigate root causes for persistent failures

1. **Preserve Consistency**
   - Apply fixes that maintain cross-project consistency
   - Follow established patterns from template repositories
   - Document any necessary exceptions with clear rationale

1. **Verify Fixes**
   - Test all hooks and workflows after changes
   - Ensure fixes don't introduce new issues
   - Document the fix process for future reference

## Critical Guardrails

What NOT to do:

- NEVER disable checks to make workflows pass
- NEVER comment out failing tests
- NEVER use `|| true` to mask failures
- NEVER bypass version validation

## Expected Deliverables

1. **Status Report**
   - Current state of hooks and workflows for each project
   - Issues found and fixes implemented
   - Remaining problems that need further investigation

1. **Documentation Updates**
   - Updated CLAUDE.md files with current hook commands
   - Updated task files with completed maintenance items
   - New issues documented in appropriate task files

1. **Improvement Suggestions**
   - Recommendations for standardizing hooks across projects
   - Workflow optimization suggestions
   - New features that could enhance the CI/CD pipeline

## Reference Materials

- Hooks-Util Documentation: `/home/gregg/Projects/lua-library/hooks-util/README.md`
- Workflow Templates: `/home/gregg/Projects/templates/base-project-repo/.github/workflows/`
- Command Patterns: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/command-patterns.md`
- Ecosystem Overview: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash

# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md

```text

Add a new entry with the following format:

```markdown

## YYYY-MM-DD - hooks-workflow-maintenance

- **Task**: Brief description of the maintenance performed
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement

```text

This data helps us continuously improve our workflow prompts.

