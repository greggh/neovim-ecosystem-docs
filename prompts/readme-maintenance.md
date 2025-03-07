
# README Maintenance and Standardization Prompt

## Purpose

This prompt helps standardize README files across Neovim ecosystem projects. It checks for required sections and badges, adds missing elements, updates outdated information, removes unneeded components, and tracks metrics for README effectiveness.

## Project Structure Requirements

README files in our ecosystem should maintain consistent structure and information. The standard elements include:

### Required Badges

All badges should be center-aligned at the top of the README with consistent styling. All badges should use the same style parameter (`style=flat-square`).

1. **Workflow Status Badges**
   - CI/Linting (Markdown, YAML, Lua, Shell)
   - Tests (if applicable)
   - Documentation build (if applicable)

1. **Project Information Badges**
   - License (MIT): `[![GitHub License](https://img.shields.io/github/license/username/repo?style=flat-square)](https://github.com/username/repo/blob/main/LICENSE)`
   - GitHub Stars: `[![GitHub Stars](https://img.shields.io/github/stars/username/repo?style=flat-square)](https://github.com/username/repo/stargazers)`
   - Neovim version compatibility (for Neovim plugins): `[![Neovim](https://img.shields.io/badge/Neovim-0.8.0+-blueviolet?style=flat-square&logo=neovim)](https://neovim.io)`
   - Release version: `[![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=flat-square)](https://github.com/username/repo/releases/tag/v1.0.0)`
   - Discussions: `[![Discussions](https://img.shields.io/github/discussions/username/repo?style=flat-square&logo=github)](https://github.com/username/repo/discussions)`

### Required Sections

1. **Project Title** (H1 heading with project name, center-aligned with `<div align="center">` wrapper)
2. **Concise Description** (1-2 sentences explaining purpose)
3. **Features** (bullet list of key capabilities with emojis)
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
4. Check for consistent badge styling (`style=flat-square`)
5. Verify all image references are valid and report any missing images
6. Ensure MIT license badge and section are present
7. Provide a detailed report of deficiencies
8. With your approval, update the README file with needed changes
9. Add metrics entry for the README update
10. Provide a summary of any image files referenced that need to be created

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

## Final Verification Checklist

Before completing the README update, I will verify:

1. ✅ All badges use consistent styling (`style=flat-square`)
2. ✅ All badges are center-aligned at the top of the README
3. ✅ MIT license badge and section are present
4. ✅ Features section includes emojis for better readability
5. ✅ All image references are valid and a list of missing images is provided
6. ✅ Navigation links between sections work correctly
7. ✅ Footer includes signature line: `<p>Made with ❤️ by <a href="https://github.com/username">username</a></p>`

## Example of Properly Formatted README

```markdown
<div align="center">

# Project Name

[![Lint Markdown](https://github.com/username/repo/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/username/repo/actions/workflows/markdown-lint.yml)
[![Lint YAML](https://github.com/username/repo/actions/workflows/yaml-lint.yml/badge.svg)](https://github.com/username/repo/actions/workflows/yaml-lint.yml)
[![Tests](https://github.com/username/repo/actions/workflows/tests.yml/badge.svg)](https://github.com/username/repo/actions/workflows/tests.yml)
[![GitHub License](https://img.shields.io/github/license/username/repo?style=flat-square)](https://github.com/username/repo/blob/main/LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/username/repo?style=flat-square)](https://github.com/username/repo/stargazers)
[![Neovim](https://img.shields.io/badge/Neovim-0.8.0+-blueviolet?style=flat-square&logo=neovim)](https://neovim.io)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=flat-square)](https://github.com/username/repo/releases/tag/v1.0.0)
[![Discussions](https://img.shields.io/github/discussions/username/repo?style=flat-square&logo=github)](https://github.com/username/repo/discussions)

*A concise and clear description of what this project does and why it exists.*

[Features](#features) • 
[Installation](#installation) • 
[Usage](#usage) • 
[Configuration](#configuration) • 
[Documentation](#documentation) • 
[Contributing](#contributing) • 
[License](#license) • 
[Discussions](https://github.com/username/repo/discussions)

</div>

## Features

- 🚀 **Key feature 1** - Brief explanation of this important feature
- ⚡ **Key feature 2** - Brief explanation of this important feature
- 🔍 **Key feature 3** - Brief explanation of this important feature

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

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  <p>Made with ❤️ by <a href="https://github.com/username">username</a></p>
</div>
```

## Image References Summary Section

At the end of the README update process, I will provide a summary of all image files referenced in the README that need to be created. This will include:

1. The full path of each image file referenced
2. A brief description of what each image should contain
3. Suggestions for image creation if applicable

Example:
```
### Image Files Referenced

The following image files were referenced in the README but may not exist:

1. assets/readme/screenshot.png - Main application screenshot showing key features
2. assets/readme/diagram.svg - Architecture diagram of the system components

Please create these image files to ensure the README displays correctly on GitHub.
```

