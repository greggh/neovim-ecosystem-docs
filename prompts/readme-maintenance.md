# README Maintenance and Standardization Prompt

## Purpose

This prompt helps standardize README files across Neovim ecosystem projects. It checks for required sections and badges, adds missing elements, updates outdated information, removes unneeded components, and tracks metrics for README effectiveness.

## Project Structure Requirements

README files in our ecosystem should maintain consistent structure and information. The standard elements include:

### Required Badges

1. **Workflow Status Badges**
   - CI/Linting (Markdown, YAML, Lua, Shell)
   - Tests (if applicable)
   - Documentation build (if applicable)

2. **Project Information Badges**
   - License
   - Neovim version compatibility (for Neovim plugins)
   - Release version

### Required Sections

1. **Project Title** (H1 heading with project name)
2. **Concise Description** (1-2 sentences explaining purpose)
3. **Features** (bullet list of key capabilities)
4. **Installation** (clear instructions for different package managers)
5. **Usage** (basic examples of how to use)
6. **Configuration** (if applicable)
7. **Documentation** (link to full docs or explanation of documentation structure)
8. **Development** (brief instructions for contributing)
9. **License** (statement of license type with link)

### Optional But Recommended

1. **Screenshots/GIFs** (for visual components)
2. **Roadmap** (for active projects)
3. **Dependencies** (if there are notable requirements)
4. **Credits** (acknowledgments, if applicable)

## Implementation Steps

After reading and understanding this prompt, I will:

1. Ask you which project's README file you want to review
2. Read and analyze the project's existing README.md
3. Identify missing badges, sections, or outdated information
4. Provide a detailed report of deficiencies
5. With your approval, update the README file with needed changes
6. Add metrics entry for the README update

## Required Inputs

To properly standardize the README, I will need:

1. Project repository path
2. Project type (Neovim configuration, plugin, Lua library, template, documentation)
3. Any special requirements for this project's README

## Metrics Tracking

After completing the README update, I will:

1. Record the effectiveness of this prompt in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md`
2. Document which sections were added, modified, or removed
3. Rate the improvement on a scale of 1-5

## Command Patterns

I will follow standard command patterns for this ecosystem:

1. Use the View tool to check the existing README
2. Use the Edit tool to update the README
3. Never use `cd`, always use `env -C /path/to/dir` or `git -C /path/to/repo`
4. Commit changes using the established git workflow

## Example of Properly Formatted README

```markdown
# Project Name

[![Lint Markdown](https://github.com/username/repo/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/username/repo/actions/workflows/markdown-lint.yml)
[![Lint YAML](https://github.com/username/repo/actions/workflows/yaml-lint.yml/badge.svg)](https://github.com/username/repo/actions/workflows/yaml-lint.yml)
[![Tests](https://github.com/username/repo/actions/workflows/tests.yml/badge.svg)](https://github.com/username/repo/actions/workflows/tests.yml)
[![License](https://img.shields.io/github/license/username/repo)](https://github.com/username/repo/blob/main/LICENSE)
[![Neovim](https://img.shields.io/badge/Neovim-0.8.0+-blueviolet.svg)](https://neovim.io)
[![Release](https://img.shields.io/github/v/release/username/repo)](https://github.com/username/repo/releases/latest)

A concise and clear description of what this project does and why it exists.

## Features

- Key feature 1 with brief explanation
- Key feature 2 with brief explanation
- Key feature 3 with brief explanation

## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'username/repo',
  config = function()
    require('repo').setup()
  end
}
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'username/repo',
  config = function()
    require('repo').setup()
  end
}
```

## Usage

```lua
-- Basic usage example
require('repo').function()
```

## Configuration

```lua
require('repo').setup({
  key = 'value',
  another_key = 'another_value'
})
```

## Documentation

Full documentation is available at [docs/](docs/) or [online documentation](https://example.com).

## Development

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```