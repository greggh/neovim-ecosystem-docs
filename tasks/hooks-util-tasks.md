
# Hooks-Util Tasks

## Current Focus

The current focus for hooks-util is thoroughly testing our fixes across all adapter types. We've successfully fixed the update_hook.sh script to properly detect paths in different installation scenarios, enhanced the install.sh script to make itself available to update processes, and fixed version file handling to properly manage empty files and avoid unnecessary warnings. We've validated that the infinite recursion protection in quality.sh works correctly with its HOOKS_PROCESSING_QUALITY flag. Our next step is to comprehensively test pre-commit hooks across all adapter types (lua-lib, nvim-plugin, nvim-config, and docs) and fix the GitHub workflow failures before deploying hooks-util to template repositories.

## High Priority Tasks

1. **Run Comprehensive Tests and Verify Fixes**
   - [ ] Run automated tests across all adapter types
   - [ ] Push test branch to verify GitHub workflow fixes
   - [ ] Validate infinite recursion fix in real-world commits
   - [ ] Test shellcheck detection in different environments
   - [ ] Verify template distribution in all adapter types

1. **Fix CI Workflow Failures**
   - [x] Fix GitHub workflow failures in hooks-util repository
   - [x] Remove disabling of linting checks in CI workflows
   - [x] Create proper CI validation tests for core features
   - [ ] Fix GitHub workflow failures in neovim-ecosystem-docs
   - [ ] Ensure CI workflows are consistent across all repositories

1. **Fix Critical Submodule and Path Issues**
   - [x] Fix pre-commit hook's handling of submodule references
   - [x] Fix infinite recursion issue in hooks_fix_staged_quality
   - [x] Fix update_hook.sh to properly handle both normal and submodule installations
   - [x] Fix version file handling to properly manage empty files and avoid warnings
   - [x] Test template file distribution mechanism across test environments
   - [ ] Create proper file tracking system to assist with adding generated files to git
   - [ ] Enhance error logging to better diagnose issues across environments

1. **Fix Shellcheck and Tool Detection**
   - [x] Fix shellcheck detection across common environments
   - [x] Add comprehensive fallback mechanisms for shellcheck
   - [ ] Implement similar fallback mechanisms for other required tools
   - [ ] Test tool detection with various installation methods

1. **Pre-commit Hook Integration**
   - [x] Create shell script wrappers (markdown.sh, yaml.sh, json.sh, toml.sh) for linting modules
   - [x] Update pre-commit hook to call these new functions
   - [x] Fix pre-commit hook execution issues
   - [ ] Fix error handling in pre-commit hook for various edge cases
   - [ ] Test with various file types and edge cases
   - [x] Add proper debug mode support for troubleshooting

1. **Comprehensive Testing Strategy**
   - [x] Create a standardized testing procedure for hooks-util
   - [x] Implement automated test suite for all functionality
   - [x] Document testing approach in TESTING.md
   - [x] Create test automation scripts for continuous validation
   - [ ] Test all fixes across all adapter types

1. **Deployment Preparation** (Dependent on fixing critical issues)
   - [ ] Update base-project-repo with enhanced and fully tested hooks-util
   - [ ] Propagate changes to template repositories
   - [ ] Update end-product repositories with improved hooks-util

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
