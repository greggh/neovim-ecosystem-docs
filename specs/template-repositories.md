# Template Repositories Specification

This document defines the structure and features of the template repositories used across the Neovim ecosystem.

## Template Repositories

The ecosystem uses the following template repositories:

1. **Base Project Template** (`/home/gregg/Projects/templates/base-project-repo`)
   - Foundation template with GitHub best practices for all new projects
   - Contains basic GitHub workflows, documentation, and configuration

2. **Neovim Plugin Template** (`/home/gregg/Projects/templates/neovim-plugin-template`)
   - Specialized template for creating Neovim plugins
   - Inherits from Base Project Template
   - Contains Neovim-specific structure and configuration

3. **Neovim Config Template** (`/home/gregg/Projects/templates/neovim-config-template`)
   - Specialized template for creating Neovim configurations
   - Inherits from Base Project Template
   - Contains configuration-specific structure and organization

## Template Inheritance

Templates follow an inheritance pattern:
```
Base Project Template → Specialized Templates → Actual Projects
```

This ensures that:
- Common features are maintained in a single location
- Specialized needs are addressed at the appropriate template level
- Projects inherit best practices automatically
- Updates can flow down through the inheritance chain

## Standard Features

All template repositories include:

### 1. Version Management
- `version.lua` as single source of truth for versioning
- Version validation in pre-commit hooks
- Version bump utilities
- CHANGELOG.md following Keep a Changelog format

### 2. GitHub Configuration
- Comprehensive GitHub workflows for CI, documentation, and releases
- GitHub Discussions setup
- Issue and PR templates
- Branch protection rules
- Release automation

### 3. Development Tools
- Pre-commit hooks configuration
- Hooks-util integration
- Editor configuration (.editorconfig)
- Linting configuration (Luacheck, StyLua)
- Testing framework integration

### 4. Documentation
- Standardized README.md structure
- CONTRIBUTING.md with contribution guidelines
- CLAUDE.md with project-specific guidance
- LICENSE with appropriate licensing
- CODE_OF_CONDUCT.md for community guidelines

## Neovim Plugin Template Specifics

The Neovim plugin template includes:

1. **Plugin Structure**
   - Standard Neovim plugin directory layout
   - Initialization files following best practices
   - Module organization for maintainability

2. **Plugin Documentation**
   - Usage examples with code blocks
   - Installation instructions
   - Configuration options
   - Troubleshooting section

3. **Testing Framework**
   - Test directory with example tests
   - Mocking utilities for Neovim API
   - Lust-next integration

4. **Integration**
   - Ready for nvim-toolkit integration
   - Hooks-util adapter for plugin-specific validations

## Neovim Config Template Specifics

The Neovim configuration template includes:

1. **Config Structure**
   - Modular configuration with clear separation of concerns
   - Performance-optimized loading through lazy.nvim
   - Clear organization of plugins, keymaps, and options

2. **Configuration Documentation**
   - Detailed customization guides
   - Performance profiling section
   - Migration instructions

3. **Testing Framework**
   - Lightweight testing for configuration validation
   - Startup time measurement
   - Basic functionality verification

4. **Integration**
   - Ready for nvim-toolkit integration
   - Hooks-util adapter for configuration-specific validations

## Setup Process

When creating a new repository from a template:

1. Clone the appropriate template repository
2. Update all placeholder references (username, repository name)
3. Configure GitHub repository settings
4. Enable GitHub Discussions
5. Set up branch protection rules
6. Add hooks-util as a git submodule
7. Customize for specific project needs

## Maintenance

Templates are maintained through:

1. Regular audits against best practices
2. Propagation of improvements from base template to specialized templates
3. Standardization of common patterns across all templates
4. Testing with real-world usage scenarios

## Integration with Ecosystem

Templates support integration with:
- hooks-util for pre-commit validation
- lust-next for testing
- nvim-toolkit for shared utilities
- Documentation structure defined in documentation-structure.md