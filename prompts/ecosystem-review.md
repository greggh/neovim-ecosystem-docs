# Comprehensive Ecosystem Review

This prompt initiates a systematic review of all projects in our Neovim ecosystem to ensure consistency, quality, and alignment with our standards.

## Review Scope

### Primary Projects
1. **Neovim Configuration** - `/home/gregg/.config/nvim`
2. **Laravel Helper Plugin** - `/home/gregg/Projects/neovim/plugins/laravel-helper`
3. **Claude Code Plugin** - `/home/gregg/Projects/neovim/plugins/claude-code`
4. **Lust-Next** - `/home/gregg/Projects/lust-next`

### Supporting Projects
5. **Base Project Template** - `/home/gregg/Projects/base-project-repo`
6. **Hooks-Util** - `/home/gregg/Projects/hooks-util`
7. **Neovim Plugin Template** - `/home/gregg/Projects/neovim/neovim-plugin-template`
8. **Neovim Config Template** - `/home/gregg/Projects/neovim/neovim-config-template`
9. **Nvim-Toolkit** - `/home/gregg/Projects/neovim/nvim-toolkit`

### Test Projects
10. **Lust-Next Testbed** - `/home/gregg/Projects/lust-next-testbed`
11. **Hooks-Util Testbeds** - Various testbed projects

## Review Categories

### 1. Version Management

- Verify consistent version references across all files:
  - `version.lua` or equivalent source of truth
  - README.md badges and documentation
  - CHANGELOG.md entries
  - Plugin initialization files
  - Documentation references
  - GitHub release tags
  - Test files with version-specific tests

- Ensure standardized version management system is implemented:
  - Semantic versioning format (MAJOR.MINOR.PATCH)
  - Version update scripts functioning properly
  - Version validation in pre-commit hooks

### 2. Documentation Consistency

- Verify all projects have standardized documentation:
  - README.md with consistent structure
  - CHANGELOG.md following Keep a Changelog format
  - CLAUDE.md with project-specific commands and information
  - Documentation references using absolute paths
  - LICENSE, CODE_OF_CONDUCT.md, CONTRIBUTING.md

- Check CLAUDE.md files for completeness:
  - Project overview and purpose
  - Key features and components
  - Development commands
  - Testing instructions
  - Project structure
  - Recent improvements
  - Best practices

### 3. Quality Assurance

- Verify test suite implementation:
  - Comprehensive test coverage
  - Standardized test patterns
  - Mocking conventions
  - Proper test documentation

- Check hooks and workflows:
  - Pre-commit hooks configured with hooks-util
  - GitHub Actions workflows for CI, documentation, and releases
  - Consistent workflow patterns across projects

### 4. Integration and Dependencies

- Verify proper integration between projects:
  - hooks-util integrated as git submodule
  - nvim-toolkit integration in relevant projects
  - Template repositories set as upstream remotes
  - Dependency management consistent across projects

## Process Details

For each project:

1. **Initial Assessment**
   - Check repository structure for completeness
   - Verify documentation files exist and follow standards
   - Check CLAUDE.md for current information

2. **Version Verification**
   - Identify authoritative version source
   - Check all files for consistent version references
   - Verify version management system implementation

3. **Documentation Review**
   - Audit all documentation files
   - Check for consistency with standardized formats
   - Update README.md, CHANGELOG.md, and CLAUDE.md as needed

4. **Quality Assurance Audit**
   - Verify test suite implementation
   - Check pre-commit hooks configuration
   - Audit GitHub workflow configurations

5. **Integration Check**
   - Verify dependencies management
   - Check integration between related projects
   - Ensure template inheritance is properly configured

6. **Updates and Fixes**
   - Implement necessary updates for consistency
   - Fix any issues with hooks or workflows
   - Update documentation to reflect current state

## Deliverables

Upon completion, create:

1. **Status Report**
   - Current state of each project
   - Consistency across the ecosystem
   - Identified issues and their resolutions

2. **Documentation Updates**
   - Updated project status in `/home/gregg/Projects/docs/project-status.md`
   - Updated tasks in relevant task files
   - Updated CLAUDE.md files for projects with changes

3. **Action Items**
   - List of remaining issues to address
   - Prioritized recommendations for improvement
   - Timeline for addressing critical issues

## Reference Materials

- Ecosystem Overview: `/home/gregg/Projects/docs/ecosystem-overview.md`
- Project Status: `/home/gregg/Projects/docs/project-status.md`
- Architecture Specifications: `/home/gregg/Projects/docs/specs/`
- Implementation Plans: `/home/gregg/Projects/docs/plans/`
- Command Patterns: `/home/gregg/Projects/docs/prompts/command-patterns.md`

Remember to follow the command pattern guidelines, using full paths with appropriate tools (fd, rg, git -C, etc.) for all operations.