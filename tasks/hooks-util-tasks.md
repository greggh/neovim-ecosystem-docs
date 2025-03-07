
# Hooks-Util Tasks

## Current Focus: Centralized Code Quality Framework

We have developed a comprehensive plan for a centralized code quality system across all Neovim ecosystem projects. This new approach replaces our previous task lists with a more structured, phased implementation that centralizes all linting and fixing capabilities through hooks-util and lust-next. See the [Code Quality Plan](/home/gregg/Projects/test-projects/hooks-util-testbed-lua-lib/.githooks/hooks-util/docs/CODE_QUALITY_PLAN.md) for complete details.

### Phase 1: Tools Integration and Enhancement (Current Focus)

1. **Lua Codefix Module in lust-next**
   - [x] Create comprehensive codefix.lua module in lust-next
   - [x] Integrate with StyLua for formatting
   - [x] Integrate with Luacheck for linting
   - [x] Implement custom fixers for edge cases:
     - [x] Trailing whitespace in multiline strings
     - [x] Proper unused variable handling
     - [x] Type annotation generation
     - [x] String concatenation optimization
     - [x] Lua version compatibility handling
   - [x] Create hooks-util adapter for Lua codefix operations

2. **Shell Script Tools**
   - [ ] Continue using shellcheck for linting (already present)
   - [ ] Add shfmt integration for automatic formatting
   - [ ] Create a unified shell script formatter in hooks-util
   - [ ] Add custom fixers for shellcheck issues that aren't auto-fixable

3. **Markdown Tools**
   - [ ] Enhance existing fix_markdown_comprehensive.sh with additional fixers
   - [ ] Integrate markdownlint-cli for auto-fixing capability
   - [ ] Add pre-commit hook for markdown validation
   - [ ] Include fixes for link checking and table formatting

4. **Data Format Tools**
   - [ ] Add prettier integration for YAML and JSON auto-formatting
   - [ ] Create hooks_yaml_fix function in yaml.sh
   - [ ] Enhance json.sh with auto-fixing capabilities
   - [ ] Integrate taplo for TOML validation and formatting

### Phase 2: Unified Interface and Configuration (Next Steps)

1. **CLI Interface**
   - [ ] Create a unified CLI in hooks-util for all quality operations
   - [ ] Support operations for specific file types or all files
   - [ ] Provide detailed reporting capabilities

2. **Configuration Management**
   - [ ] Standardize all linting configurations in templates/
   - [ ] Create configuration management system
   - [ ] Add auto-generation for new projects

3. **Tool Installation**
   - [ ] Create setup script for required tools
   - [ ] Add detection for existing installations
   - [ ] Support partial installations based on project needs

### Phase 3: Pre-commit Hooks and Workflows (Future)

1. **Pre-commit Hook Enhancements**
   - [ ] Update to use our enhanced tools for each file type
   - [ ] Add seamless integration with lust-next
   - [ ] Provide detailed error reporting
   - [ ] Add graceful fallbacks for missing tools

2. **GitHub Workflow Standardization**
   - [ ] Create consistent workflow files for each file type
   - [ ] Ensure workflows use centralized configurations
   - [ ] Add detailed reporting for CI/CD

### Phase 4: Testing and Deployment (Final Phase)

1. **Comprehensive Testing**
   - [ ] Create extensive test suite for all tools
   - [ ] Test integration between components
   - [ ] Verify tool installation across environments

2. **Deployment Across Projects**
   - [ ] Update all testbed projects with enhanced hooks-util
   - [ ] Propagate to template repositories
   - [ ] Deploy to end-product repositories

1. ~~**Core Enhancement for Documentation Tools**~~ ✅ COMPLETED
   - [x] Integrate markdown linting and fixing scripts from neovim-ecosystem-docs
   - [x] Add YAML linting capabilities to core hooks-util
   - [x] Add JSON linting support to core functionality
   - [x] Add TOML linting capabilities
   - [x] Ensure script linting (shellcheck, luacheck) is comprehensive
   - [x] Create comprehensive markdown module (core/markdown.lua)

1. ~~**Adapter Analysis and Enhancement**~~ ✅ COMPLETED
   - [x] Audit neovim-plugin repositories for unique hooks/workflows to incorporate
   - [x] Audit lua-lib repositories for library-specific validation needs
   - [x] Audit neovim-config for configuration-specific requirements
   - [x] Determine if a dedicated docs adapter is needed for documentation projects
   - [x] Update all adapters with project-specific functionality identified in audit

1. ~~**Installation System Improvement**~~ ✅ COMPLETED
   - [x] Enhance installation to properly handle GitHub workflow setup
   - [x] Create post-update hook system to detect and apply submodule updates
   - [x] Improve configuration system to better handle project-specific customizations
   - [x] Create more intelligent project type detection for auto-adapter selection

1. ~~**Workflow Management System**~~ ✅ COMPLETED
   - [x] Create base workflow templates for all common validation types
   - [x] Develop adapter-specific configuration files that extend base workflows
   - [x] Create workflow templating system to merge base and adapter configuration
   - [x] Ensure all projects get core functionality regardless of adapter
   - [x] Add documentation workflow with MkDocs support
   - [x] Add standardized release workflow with appropriate configurations

1. **Integration Tools Development**
   - [ ] Create comprehensive integration script for adding to repositories
   - [ ] Develop system for preserving project-specific customizations during integration
   - [ ] Build update mechanism for keeping repositories in sync with hooks-util changes
   - [ ] Document integration and update processes thoroughly

## Medium Priority Tasks

1. **Testing Standardization**
   - [x] Test all adapter types thoroughly with different configurations
   - [x] Verify project detection mechanisms across various project structures
   - [x] Test error handling and fallback mechanisms
   - [x] Validate configuration loading from different sources
   - [x] Test pre-commit hooks with all linting tools (including new documentation tools)

1. **Documentation Enhancement**
   - [ ] Complete adapter system documentation with detailed examples
   - [ ] Create detailed setup guide for each project type
   - [ ] Document configuration options for all linting tools
   - [ ] Add troubleshooting guide for common issues
   - [ ] Create integration and update workflow documentation

1. **CI Workflow Templates**
   - [ ] Create standardized workflow templates for all common validation types
   - [ ] Develop project-specific workflow templates for each adapter type
   - [ ] Ensure workflows properly handle documentation validation
   - [ ] Add intelligent conditionals to only run workflows on relevant file changes

## Low Priority Tasks

1. **Advanced Features**
   - [ ] Add support for custom hook types
   - [ ] Implement plugin system for extending functionality
   - [ ] Create hook management dashboard
   - [ ] Add telemetry options for tracking quality improvements

1. **Performance Optimization**
   - [ ] Optimize hook execution time
   - [ ] Improve caching mechanisms
   - [ ] Add selective execution based on changed files
