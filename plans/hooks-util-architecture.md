
# Hooks-Util Architecture

## Overview

Hooks-Util is a comprehensive Git hooks framework designed for pre-commit validation across Neovim ecosystem projects. It features an adapter-based architecture to support different project types with a consistent interface.

## Core Architecture

### Main Components

The hooks-util framework consists of the following primary components:

1. **Core Registry** (`hooks-util/core/registry.lua`):
   - Central registry for adapter management
   - Handles registration and discovery of adapters
   - Provides mechanisms for adapter selection
   - Manages adapter lifecycle and initialization

1. **Configuration System** (`hooks-util/core/config.lua`):
   - Supports both shell-based (.hooksrc) and Lua-based (.hooks-util.lua) configurations
   - Implements configuration merging and validation
   - Provides hierarchical access to configuration options
   - Handles environment variables and defaults

1. **Adapter Interface** (`hooks-util/core/adapter.lua`):
   - Defines the standard interface for all adapters
   - Provides base adapter implementation
   - Includes utility functions for common adapter operations
   - Sets up conventions for adapter capabilities

1. **Project Type Adapters** (`hooks-util/adapters/`):
   - Specialized implementations for different project types:
     - Neovim plugin adapter
     - Neovim configuration adapter
     - Lua library adapter
     - Generic Lua adapter (fallback)
   - Each implements detection, setup, and hook operations

1. **Shell Scripts** (`hooks-util/scripts/`):
   - Bash scripts for hook execution
   - Utility scripts for setup and configuration
   - Pre-commit hooks implementation
   - Integration scripts for CI platforms

1. **Test Quality Integration** (`hooks-util/scripts/test_quality.sh`):
   - Integration with lust-next for test validation
   - Coverage validation implementation
   - Quality level verification
   - Custom rule support

1. **CI Templates** (`hooks-util/templates/`):
   - GitHub Actions workflow templates
   - Template generation utilities
   - CI configuration helpers

## Adapter-Based Architecture

### Architecture Design

The adapter architecture forms the core of hooks-util's flexibility:

```text
                    ┌─────────────────┐
                    │  Registry       │
                    └────────┬────────┘
                             │
                    ┌────────┴────────┐
                    │  Adapter        │
                    │  Interface      │
                    └────────┬────────┘
                             │
        ┌────────────┬───────┼────────────┬────────────┐
        │            │       │            │            │
┌───────▼─────┐┌─────▼─────┐┌▼──────────┐┌▼──────────┐┌▼──────────┐
│  Neovim     ││  Neovim   ││  Lua      ││  Generic  ││  Custom   │
│  Plugin     ││  Config   ││  Library  ││  Lua      ││  Adapter  │
└─────────────┘└───────────┘└───────────┘└───────────┘└───────────┘

```text

1. **Registry**: Central component for adapter management
2. **Adapter Interface**: Defines common contract for all adapters
3. **Concrete Adapters**: Specialized implementations for different project types

### Adapter Discovery Flow

```text
[Project Directory] → [Try Each Adapter's detect()] → [Select Matching Adapter] → [Configuration Override Check] → [Final Adapter Selection]

```text

1. Start with the project directory
2. Each registered adapter's `detect()` function is called
3. The first adapter to return true is selected
4. Check if configuration explicitly overrides selection
5. Final adapter is initialized with configuration

### Adapter Interface

Each adapter must implement the following interface:

```lua
{
  -- Metadata
  id = "unique_id",
  name = "Human Readable Name",
  description = "Description of the adapter",

  -- Core Functions
  detect = function(path),           -- Determine if this adapter should be used
  setup = function(config),          -- Initialize the adapter
  get_hooks_path = function(),       -- Get path to hooks
  get_lint_command = function(),     -- Get command for linting
  get_test_command = function(),     -- Get command for testing

  -- Hook Implementations
  pre_commit = function(),           -- Pre-commit hook implementation

  -- Helpers
  get_default_config = function()    -- Get default configuration
}

```text

## Configuration System

### Dual Configuration Approach

Hooks-util supports two configuration formats:

1. **Shell-Based Configuration** (`.hooksrc`):
   - Traditional environment variable style
   - Compatible with shell scripts
   - Simple key-value format

   ```bash
   # Project type
   HOOKS_PROJECT_TYPE="neovim_plugin"

   # Linting options
   HOOKS_LINT_ENABLED=1
   HOOKS_LINT_COMMAND="luacheck"

   # Test options
   HOOKS_TEST_ENABLED=1
   HOOKS_TEST_COVERAGE_THRESHOLD=80
   ```

1. **Lua-Based Configuration** (`.hooks-util.lua`):
   - Modern, structured configuration
   - Support for complex data types
   - Better organization and commenting

   ```lua
   return {
     project_type = "neovim_plugin",

     lint = {
       enabled = true,
       command = "luacheck",
       args = {"--config", ".luacheckrc"}
     },

     test = {
       enabled = true,
       coverage = {
         enabled = true,
         threshold = 80
       }
     }
   }
   ```

### Configuration Hierarchy

Configuration is loaded from multiple sources with the following precedence:

1. Command-line arguments (highest priority)
2. Environment variables
3. Local project configuration (`.hooks-util.lua` or `.hooksrc`)
4. User global configuration (`~/.hooks-util.lua` or `~/.hooksrc`)
5. Default adapter configuration (lowest priority)

### Configuration Access

The configuration system provides a consistent interface:

```lua
local config = require("hooks-util.core.config")

-- Initialize from project directory
config.load("/path/to/project")

-- Access configuration (with dot notation support)
local threshold = config.get("test.coverage.threshold")
local lint_enabled = config.get("lint.enabled")

-- Check if option exists
if config.has("custom_option") then
  -- Use custom option
end

-- Get configuration with defaults
local lint_config = config.get("lint", {enabled = false})

```text

## Lust-Next Integration

### Integration Architecture

Hooks-util integrates with lust-next for test quality validation:

```text
             ┌───────────────┐
             │  hooks-util   │
             └───────┬───────┘
                     │
          ┌──────────▼────────┐
          │ test_quality.sh   │
          └──────────┬────────┘
                     │
    ┌────────────────┴────────────────┐
    │                                 │
┌───▼────┐                     ┌──────▼──────┐
│coverage│◄────┌──────────┐───►│   quality   │
└────────┘     │lust-next │    └─────────────┘
               └──────────┘

```text

### Integration Flow

```text
[Pre-Commit Hook] → [Check Config] → [Find lust-next] → [Determine Features] → [Run Tests] → [Check Results] → [Pass/Fail Commit]

```text

1. Pre-commit hook activates test quality check
2. Configuration is checked for test quality settings
3. Lust-next is located using multiple search paths
4. Available features (coverage, quality) are detected
5. Tests are run with quality validation enabled
6. Results are checked against configured thresholds
7. Commit is allowed or blocked based on results

### Feature Detection

The system dynamically detects lust-next capabilities:

```bash

# Check if lust-next has coverage module
if lua -e "pcall(function() require('path.to.lust-next.src.coverage') end)" &>/dev/null; then
  # Coverage is available
fi

# Check if lust-next has quality module
if lua -e "pcall(function() require('path.to.lust-next.src.quality') end)" &>/dev/null; then
  # Quality validation is available
fi

```text

## Pre-Commit Hook Implementation

### Hook Execution Flow

```text
[git commit] → [pre-commit hook] → [load config] → [select adapter] → [quality check] → [lint check] → [test check] → [commit allowed/blocked]

```text

1. Git commit triggers pre-commit hook
2. Configuration is loaded from project
3. Appropriate adapter is selected for project type
4. Test quality validation runs (if enabled)
5. Linting checks run (if enabled)
6. Tests are executed (if enabled)
7. Commit proceeds only if all checks pass

### Hook Script Structure

```bash
#!/bin/bash

# Source common functions
source "$(dirname "$0")/hooks-util/scripts/common.sh"

# Load configuration
source "$(dirname "$0")/hooks-util/scripts/config.sh"
load_config

# Determine project type and load adapter
source "$(dirname "$0")/hooks-util/scripts/adapter.sh"
select_adapter

# Run quality checks
if [ "$HOOKS_TEST_QUALITY_ENABLED" = "1" ]; then
  source "$(dirname "$0")/hooks-util/scripts/test_quality.sh"
  check_test_quality || exit 1
fi

# Run linting
if [ "$HOOKS_LINT_ENABLED" = "1" ]; then
  run_lint_command || exit 1
fi

# Run tests
if [ "$HOOKS_TEST_ENABLED" = "1" ]; then
  run_test_command || exit 1
fi

# All checks passed
exit 0

```text

## CLI and Automation

### Command-Line Interface

Hooks-util provides a CLI for common operations:

```text
hooks-util setup      # Set up hooks for the current project
hooks-util configure  # Run interactive configuration wizard
hooks-util check      # Run all checks (lint, test, quality)
hooks-util lint       # Run linting only
hooks-util test       # Run tests only
hooks-util quality    # Run quality validation only

```text

### Setup Wizard

The interactive setup wizard helps configure hooks-util:

```text
[Start Wizard] → [Detect Project Type] → [Configure Linting] → [Configure Tests] → [Configure Quality] → [Generate Config] → [Install Hooks]

```text

1. Wizard is initiated with `hooks-util configure`
2. Project type is automatically detected or manually selected
3. Linting options are configured (tool, args, etc.)
4. Test options are set (framework, patterns, etc.)
5. Quality settings are configured (level, threshold, etc.)
6. Configuration file is generated
7. Hooks are installed in the project

## CI Integration

### CI Workflow Templates

Hooks-util provides templates for CI workflows:

```yaml

# GitHub Actions workflow example
name: Tests

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:

      - uses: actions/checkout@v2

      - name: Set up Lua
        uses: leafo/gh-actions-lua@v8
        with:
          luaVersion: "5.1"

      - name: Set up LuaRocks
        uses: leafo/gh-actions-luarocks@v4

      - name: Install dependencies
        run: |
          luarocks install luacheck
          luarocks install busted

      - name: Lint
        run: luacheck .

      - name: Test
        run: busted

```text

## Template Generation

CI templates are generated based on project type:

```text
[Project Type] → [Select Template] → [Fill Variables] → [Generate Workflow] → [Save to Project]

```text

1. Project type determines which template to use
2. Template is selected from available options
3. Variables are filled based on project configuration
4. Complete workflow file is generated
5. Workflow is saved to project's CI configuration directory

## Future Architecture Extensions

### Planned Enhancements

1. **Plugin System**:
   - Support for custom plugins to extend functionality
   - Standard API for hook extensions
   - Plugin registry and lifecycle management

1. **Additional Adapters**:
   - Support for more project types and languages
   - Framework-specific adapters (e.g., Love2D games)
   - Build system integration adapters

1. **Enhanced Reporting**:
   - Visual reports for quality and test results
   - Historical tracking of project quality
   - Integration with notification systems

1. **Advanced Configuration**:
   - Schema-based configuration validation
   - Remote configuration support
   - Team-based configuration sharing

This architecture document provides a comprehensive overview of the hooks-util design, emphasizing its adapter-based approach and integration with lust-next for test quality validation.

