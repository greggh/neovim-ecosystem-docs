# Repository Hooks and Workflows Audit Results

## Audit Date: March 6, 2025

## Executive Summary

We conducted a comprehensive audit of pre-commit hooks and GitHub workflows across all Neovim ecosystem repositories. The audit revealed inconsistencies in workflow implementation, varying levels of hooks-util integration, and duplication of functionality across projects. This document outlines our findings and provides recommendations for the implementation of a base+adapter workflow architecture.

## Key Findings

### 1. Workflow Patterns

- All repositories use similar GitHub workflow files:
  - `ci.yml`
  - `markdown-lint.yml`
  - `yaml-lint.yml`
  - `scripts-lint.yml`
  - `docs.yml`
  - `release.yml`
  - Some also have `dependency-updates.yml`

- Significant workflow duplication exists across repositories
- Project-specific functionality is mixed with common functionality
- No clear separation between core and adapter-specific concerns

### 2. Hooks Configuration

- Most repositories have custom pre-commit hook implementations
- Limited hooks-util integration across projects
- Documentation repositories have advanced markdown fixing capabilities
- Inconsistent linting tool configurations across repositories

### 3. Existing Documentation Tools

- Advanced markdown tools found in the documentation repository:
  - `fix_markdown_comprehensive.sh`
  - `fix_list_numbering.sh`
  - `fix_heading_levels.sh`
- YAML linting configuration in several repositories
- No standardized JSON or TOML linting

## Repository-Specific Findings

### Base Project Repository

- Contains GitHub workflow templates for common validation patterns
- Has scripts for hooks-util integration but not fully implemented
- Contains markdown fixing scripts that should be incorporated into hooks-util
- Missing proper adapter configuration for workflow management

### hooks-util Repository

- Core functionality includes:
  - Lua linting and formatting (StyLua, Luacheck)
  - Shell script validation (ShellCheck)
  - Test running capabilities
  - Code quality fixes (whitespace, line endings)
- Missing:
  - Comprehensive markdown linting and fixing
  - YAML, JSON, and TOML linting
  - Workflow templating system
  - Automatic update mechanism

### Neovim Plugin Repositories

- Contains plugin-specific validation:
  - Health check validation
  - Runtime path checks
  - Plugin structure validation
- These should be moved to the nvim-plugin adapter

### Lua Library Repositories

- Contains library-specific validation:
  - Code coverage tracking
  - LuaRocks validation
  - Multi-version testing
- These should be moved to the lua-lib adapter

### Documentation Repository

- Contains advanced markdown tools that should be moved to hooks-util core
- Has documentation-specific workflows that should become adapter configs
- Demonstrates need for a dedicated docs adapter

## Recommended Architecture

Based on our audit, we recommend implementing a base+adapter workflow architecture:

1. **Base Components** (hooks-util core):
   - Comprehensive markdown linting and fixing
   - YAML, JSON, and TOML linting
   - Script validation (Shell, Lua)
   - Base workflow templates for common validation patterns

2. **Adapter-Specific Components**:
   - Configuration files that extend base workflows
   - Project-type specific validation rules
   - Specialized CI/test configurations

3. **Templating System**:
   - Mechanism to merge base workflows with adapter configurations
   - Non-destructive updates that preserve customizations
   - Configuration options for project-specific needs

## Implementation Plan

1. **Enhance hooks-util Core**:
   - Add documentation tools from neovim-ecosystem-docs
   - Create base workflow templates
   - Develop workflow templating system

2. **Update Adapters**:
   - Enhance existing adapters with workflow configurations
   - Create docs adapter if needed
   - Document adapter capabilities

3. **Integration Strategy**:
   - Implement in base-project-repo first
   - Propagate to templates
   - Update end-product repositories

## Conclusion

The current state of hooks and workflows shows significant duplication and inconsistency. By implementing a base+adapter architecture, we can standardize core functionality while allowing for project-specific customizations, dramatically reducing duplication and maintenance burden.

This approach will ensure all repositories benefit from shared improvements while maintaining their unique requirements, creating a more maintainable and consistent ecosystem.