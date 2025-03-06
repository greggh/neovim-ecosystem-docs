
# Adapter Architecture Specification

## Overview

The adapter architecture is a core design pattern in the hooks-util framework, enabling flexible support for different project types while maintaining a consistent interface. This approach allows hooks-util to adapt its behavior based on the specific needs of each project type.

## Core Principles

1. **Single Interface, Multiple Implementations**: All adapters implement a common interface but provide specialized functionality.
2. **Automatic Detection**: The system can automatically detect the project type to use the appropriate adapter.
3. **Configuration Override**: Users can explicitly specify the adapter to use, overriding automatic detection.
4. **Extensibility**: New adapters can be added without modifying core code.
5. **Fallback Support**: If no specific adapter matches, a generic adapter is used as a fallback.

## Adapter Interface

Each adapter must implement the following key functions:

```lua
local Adapter = {
  -- Metadata
  id = "adapter_id",             -- Unique identifier for the adapter
  name = "Display Name",         -- Human-readable name
  description = "Description",   -- Brief description of the adapter's purpose

  -- Core functionality
  detect = function(path)        -- Returns true if this adapter should be used for the project
    -- Implementation
  end,

  setup = function(config)       -- Sets up the adapter with the given configuration
    -- Implementation
  end,

  get_hooks_path = function()    -- Returns the path to the hooks directory
    -- Implementation
  end,

  get_lint_command = function()  -- Returns the command to run for linting
    -- Implementation
  end,

  get_test_command = function()  -- Returns the command to run for testing
    -- Implementation
  end,

  -- Optional helpers
  get_default_config = function() -- Returns default configuration for this adapter
    -- Implementation
  end
}

```text

## Current Adapter Types

### 1. Neovim Plugin Adapter

Specialized for Neovim plugin projects with the following detection rules:

- Contains `plugin/` directory or `lua/*/init.lua`
- Has `plugin` in the `rockspec` file (if present)
- Contains `.nvim` in the repository name

Configuration focus:

- Neovim-specific lint rules
- Test commands that mock Neovim API
- Documentation checks for plugin-specific formats

### 2. Neovim Configuration Adapter

Specialized for Neovim configuration directories with these detection rules:

- Contains `init.lua` or `init.vim` at the root
- Has `after/`, `plugin/`, or `ftplugin/` directories
- Path ends with `.config/nvim` or similar patterns

Configuration focus:

- Relaxed lint rules for configuration files
- Simplified testing approach for configurations
- Support for modular configuration structures

### 3. Lua Library Adapter

Specialized for standalone Lua libraries with these detection rules:

- Contains `.rockspec` file(s)
- Has `src/` or `lib/` directory with Lua files
- No Neovim-specific patterns present

Configuration focus:

- Strict lint rules for library code
- Comprehensive testing expectations
- Documentation checks for API references

### 4. Generic Lua Adapter (Fallback)

Used when no specific adapter matches, with basic Lua project handling:

- Basic lint rules for Lua syntax
- Simple test execution patterns
- Minimal configuration requirements

## Registration and Discovery

Adapters are registered with the adapter registry:

```lua
local registry = require("hooks-util.core.registry")

-- Register built-in adapters
registry.register(require("hooks-util.adapters.neovim_plugin"))
registry.register(require("hooks-util.adapters.neovim_config"))
registry.register(require("hooks-util.adapters.lua_library"))
registry.register(require("hooks-util.adapters.generic_lua"))

-- Register custom adapter
registry.register(require("my_custom_adapter"))

```text

The registry provides discovery mechanisms:

```lua
-- Get all registered adapters
local adapters = registry.get_all()

-- Get adapter by ID
local adapter = registry.get("neovim_plugin")

-- Automatically discover the correct adapter for the current project
local detected_adapter = registry.detect(cwd)

```text

## Configuration Integration

Adapters integrate with the configuration system:

```lua
-- In .hooks-util.lua
return {
  -- Explicitly set adapter (overrides automatic detection)
  project_type = "neovim_plugin",

  -- Or use automatic detection
  project_type = "auto",

  -- Adapter-specific configuration
  neovim_plugin = {
    -- Configuration specific to Neovim plugin adapter
  },

  lua_library = {
    -- Configuration specific to Lua library adapter
  }
}

```text

## Extension Points

The architecture provides several extension points:

1. **Custom Adapters**: Create a new adapter module following the interface
2. **Adapter Hooks**: Add pre/post hooks to adapter functions
3. **Configuration Extensions**: Extend adapter configuration with custom options
4. **Detection Enhancements**: Add custom detection rules to existing adapters

## Implementation Example

Here's a simplified example of the Neovim Plugin adapter:

```lua
local NeovimPluginAdapter = {
  id = "neovim_plugin",
  name = "Neovim Plugin",
  description = "Adapter for Neovim plugin projects",

  detect = function(path)
    local has_plugin_dir = fs.directory_exists(path .. "/plugin")
    local has_lua_init = fs.glob(path .. "/lua/*/init.lua")
    local name_contains_nvim = path:find("%.nvim") or path:find("nvim%-")

    return has_plugin_dir or #has_lua_init > 0 or name_contains_nvim
  end,

  setup = function(config)
    -- Implementation
  end,

  get_lint_command = function()
    return "luacheck --config .luacheckrc ."
  end,

  get_test_command = function()
    return "lua ./test/run_tests.lua"
  end,

  get_default_config = function()
    return {
      lint = {
        globals = {"vim", "describe", "it", "before_each", "after_each"},
        max_line_length = 120
      },
      test = {
        pattern = "test_*.lua",
        coverage = {
          enabled = true,
          threshold = 80
        }
      }
    }
  end
}

return NeovimPluginAdapter

```text

This architecture provides a flexible foundation for extending hooks-util to support various project types while maintaining a consistent interface and user experience.

