# Neovim Ecosystem Overview

## Project List

### Primary Projects

1. **Neovim Configuration** - Personal Neovim configuration with modern plugins and features
   - Path: `/home/gregg/.config/nvim`

2. **Laravel Helper Plugin** - Neovim plugin for Laravel development with IDE Helper integration
   - Path: `/home/gregg/Projects/neovim/plugins/laravel-helper`
   - GitHub: https://github.com/greggh/laravel-helper.nvim

3. **Claude Code Plugin** - Seamless integration between Claude Code AI assistant and Neovim
   - Path: `/home/gregg/Projects/neovim/plugins/claude-code`
   - GitHub: https://github.com/greggh/claude-code.nvim

4. **Lust-Next** - Enhanced Lua testing framework
   - Path: `/home/gregg/Projects/lua-library/lust-next`
   - GitHub: https://github.com/greggh/lust-next
   - Features: Test discovery, filtering/tagging, enhanced reporting, async support, mocking

### Supporting Projects

5. **Base Project Template** - Foundation template for all new projects
   - Path: `/home/gregg/Projects/templates/base-project-repo`
   - GitHub: https://github.com/greggh/base-project-template

6. **Hooks-Util** - Git hooks framework for pre-commit validation
   - Path: `/home/gregg/Projects/lua-library/hooks-util`
   - GitHub: https://github.com/greggh/hooks-util

7. **Neovim Plugin Template** - Standardized template for creating Neovim plugins
   - Path: `/home/gregg/Projects/templates/neovim-plugin-template`
   - GitHub: https://github.com/greggh/neovim-plugin-template

8. **Neovim Config Template** - Template for Neovim configurations with modern plugins
   - Path: `/home/gregg/Projects/templates/neovim-config-template`
   - GitHub: https://github.com/greggh/neovim-config-template

9. **Nvim-Toolkit** - Shared runtime utilities library for Neovim projects
   - Path: `/home/gregg/Projects/neovim/nvim-toolkit`
   - GitHub: https://github.com/greggh/nvim-toolkit

### Test Projects

10. **Lust-Next Testbed** - Pure Lua project for validating lust-next
    - Path: `/home/gregg/Projects/test-projects/lust-next-testbed`

11. **Hooks-Util Testbed Lua Lib** - Testing hooks-util with Lua library adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-lua-lib`

12. **Hooks-Util Testbed Nvim Plugin** - Testing hooks-util with Neovim plugin adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-nvim-plugin`

13. **Hooks-Util Testbed Nvim Config** - Testing hooks-util with Neovim config adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-nvim-config`

### Documentation

14. **Project Documentation** - Centralized documentation and prompts for the ecosystem
    - Path: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs`
    - GitHub: https://github.com/greggh/neovim-ecosystem-docs
    - Features: Tiered documentation, task tracking, technical specs, and session prompts

## Current Priorities

1. **Documentation Reorganization** - Implement the new tiered documentation structure and create necessary prompts
2. **Complete Modular Reporting System** - Finish the reporting module in lust-next with reliable output formats
3. **Implement Test Quality Validation** - Integrate test quality checks in pre-commit hooks
4. **Standardize Version Management** - Ensure consistent version handling across all projects
5. **Implement Nvim-Toolkit Integration** - Integrate shared utilities into plugins and configurations

## Architecture Principles

1. **Separation of Concerns** - Each module has clear responsibilities with minimal overlap
2. **Adapter-Based Architecture** - Flexible approach to support different project types
3. **Template Inheritance** - Updates flow from base templates to specialized templates to projects
4. **Integration Strategy** - hooks-util as git submodule in projects, nvim-toolkit as dependency
5. **Testability** - Comprehensive testing with lust-next ensures quality and reliability

## Documentation Links

- **Documentation Structure**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/documentation-structure.md`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/documentation-structure.md)
- **Template Repositories**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/template-repositories.md`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/template-repositories.md)
- **Project Status**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md)
- **Project Tasks**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/)
- **Architecture Details**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/specs/)
- **Implementation Plans**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/plans/`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/plans/)
- **Project History**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-history.md`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-history.md)
- **Session Prompts**: [`/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/`](/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/prompts/)