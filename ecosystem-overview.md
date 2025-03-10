
# Neovim Ecosystem Overview

## Project List

### Primary Projects

1. **Neovim Configuration** - Personal Neovim configuration with modern plugins and features
   - Path: `/home/gregg/.config/nvim`

1. **Laravel Helper Plugin** - Neovim plugin for Laravel development with IDE Helper integration
   - Path: `/home/gregg/Projects/neovim/plugins/laravel-helper`
   - GitHub: <https://github.com/greggh/laravel-helper.nvim>

1. **Claude Code Plugin** - Seamless integration between Claude Code AI assistant and Neovim
   - Path: `/home/gregg/Projects/neovim/plugins/claude-code`
   - GitHub: <https://github.com/greggh/claude-code.nvim>

1. **Lust-Next** - Enhanced Lua testing framework
   - Path: `/home/gregg/Projects/lua-library/lust-next`
   - GitHub: <https://github.com/greggh/lust-next>
   - Features: Test discovery, filtering/tagging, enhanced reporting, async support, mocking, filesystem operations

### Supporting Projects

1. **Base Project Template** - Foundation template for all new projects
   - Path: `/home/gregg/Projects/templates/base-project-repo`
   - GitHub: <https://github.com/greggh/base-project-template>

1. **Hooks-Util** - Git hooks framework for pre-commit validation
   - Path: `/home/gregg/Projects/lua-library/hooks-util`
   - GitHub: <https://github.com/greggh/hooks-util>

1. **Neovim Plugin Template** - Standardized template for creating Neovim plugins
   - Path: `/home/gregg/Projects/templates/neovim-plugin-template`
   - GitHub: <https://github.com/greggh/neovim-plugin-template>

1. **Neovim Config Template** - Template for Neovim configurations with modern plugins
   - Path: `/home/gregg/Projects/templates/neovim-config-template`
   - GitHub: <https://github.com/greggh/neovim-config-template>

1. **Nvim-Toolkit** - Shared runtime utilities library for Neovim projects
   - Path: `/home/gregg/Projects/neovim/nvim-toolkit`
   - GitHub: <https://github.com/greggh/nvim-toolkit>

### Test Projects

1. **Lust-Next Testbed** - Pure Lua project for validating lust-next
    - Path: `/home/gregg/Projects/test-projects/lust-next-testbed`

1. **Hooks-Util Testbed Lua Lib** - Testing hooks-util with Lua library adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-lua-lib`

1. **Hooks-Util Testbed Nvim Plugin** - Testing hooks-util with Neovim plugin adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-nvim-plugin`

1. **Hooks-Util Testbed Nvim Config** - Testing hooks-util with Neovim config adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-nvim-config`

1. **Hooks-Util Testbed Docs** - Testing hooks-util with Documentation adapter
    - Path: `/home/gregg/Projects/test-projects/hooks-util-testbed-docs`

### Documentation

1. **Project Documentation** - Centralized documentation and prompts for the ecosystem
    - Path: `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs`
    - GitHub: <https://github.com/greggh/neovim-ecosystem-docs>
    - Features: Tiered documentation, task tracking, technical specs, and session prompts

## Current Priorities

1. ~~**Implement Comprehensive Code Quality System**~~ ✅ - Implemented codefix.lua module in lust-next
2. ~~**Integrate Codefix with hooks-util**~~ ✅ - Created hooks-util adapter for the codefix module
3. ~~**Fix lust-next Expect Assertion System**~~ ✅ - Fixed expect assertions and added comprehensive tests
4. ~~**Implement Interactive CLI Mode for lust-next**~~ ✅ - Created interactive command interface for test runner
5. ~~**Fix lust-next Quality Module**~~ ✅ - Fixed quality validation and implemented missing functionality
6. ~~**Fix lust-next Test Infrastructure**~~ ✅ - Rewrote run_all_tests.lua for proper test isolation
7. ~~**Implement lust-next Mocking System**~~ ✅ - Created modular system with spy/stub/mock functionality
8. ~~**Implement Type Checking in lust-next**~~ ✅ - Added advanced type checking with inheritance support
9. ~~**Implement Async Testing in lust-next**~~ ✅ - Created async module with await and wait_until functions
10. ~~**Fix Codefix Multi-File Functionality**~~ ✅ - Enhanced file discovery and multi-file processing
11. ~~**Implement JUnit XML Reporting**~~ ✅ - Added JUnit XML format for CI/CD integration
12. ~~**Create Advanced Mock Sequences**~~ ✅ - Implemented with sequential return values and cycling behavior
13. ~~**Add More Output Formats**~~ ✅ - Added TAP and CSV formats with enhanced HTML reports
14. ~~**Implement Performance Optimization**~~ ✅ - Added module reset system and benchmarking utilities
15. ~~**Implement Filesystem Module**~~ ✅ - Created platform-independent filesystem operations library
16. **Fix Critical hooks-util Issues** - Resolve submodule handling, path resolution, and template distribution issues
17. **Integrate Unified Fixing Tools** - Implement auto-fixing for all file types with centralized configuration
18. **Deploy Enhanced hooks-util 0.6.0** - Add the fixed and tested hooks-util as a submodule to all ecosystem repositories
19. **Integrate Base+Adapter Workflow System** - Begin with base-project-repo and propagate to all projects
20. **Establish Repository Upstreams** - Set up proper upstream relationships for consistent propagation of changes
21. **Non-Destructive Synchronization** - Develop system for preserving customizations during upstream merges
22. ~~**Documentation Linting Standardization**~~ ✅ - Implemented in hooks-util core and docs adapter
23. ~~**Comprehensive Repository Audit**~~ ✅ - Completed audit of hooks, workflows, and linting tools
24. ~~**Submodule Update Mechanism**~~ ✅ - Added gitmodules-hooks.sh for automatic submodule updates
25. ~~**Watch Mode for Continuous Testing**~~ ✅ - Implemented watch mode in lust-next for auto-rerunning tests
26. **Metrics System Enhancement** - Build comprehensive metrics tracking and validation for documentation

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
