
<div align="center">

# Neovim Ecosystem Documentation

[![Lint Markdown](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/markdown-lint.yml/badge.svg)](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/markdown-lint.yml)
[![Lint YAML](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/yaml-lint.yml/badge.svg)](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/yaml-lint.yml)
[![Build Documentation](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/docs-build.yml/badge.svg)](https://github.com/greggh/neovim-ecosystem-docs/actions/workflows/docs-build.yml)
[![GitHub License](https://img.shields.io/github/license/greggh/neovim-ecosystem-docs?style=flat-square)](https://github.com/greggh/neovim-ecosystem-docs/blob/main/LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/greggh/neovim-ecosystem-docs?style=flat-square)](https://github.com/greggh/neovim-ecosystem-docs/stargazers)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=flat-square)](https://github.com/greggh/neovim-ecosystem-docs/releases/tag/v1.0.0)
[![Discussions](https://img.shields.io/github/discussions/greggh/neovim-ecosystem-docs?style=flat-square&logo=github)](https://github.com/greggh/neovim-ecosystem-docs/discussions)

*Comprehensive documentation for the Neovim ecosystem projects, providing structured guidance for development workflows, project standards, and technical specifications.*

[Features](#features) • 
[Documentation Structure](#documentation-structure) • 
[Installation](#installation) • 
[Usage](#usage) • 
[Contributing](#contributing) • 
[License](#license) • 
[Discussions](https://github.com/greggh/neovim-ecosystem-docs/discussions)

</div>

## Features

- 📚 **Tiered Documentation System** - Optimized for context usage and information access
- 🧭 **Comprehensive Project Overview** - Core information about all ecosystem projects
- 📋 **Project Status Tracking** - Current status and task lists for all projects
- 🛠️ **Workflow Prompts** - Standardized prompts for common development scenarios
- 📝 **Technical Specifications** - Detailed architecture and implementation guides
- 📊 **Metrics Collection** - Documentation effectiveness tracking and improvement
- 🔄 **Cross-Reference System** - Easy navigation between related documentation
- 📏 **Templates** - Standardized formats for consistent documentation

## Documentation Structure

This documentation repository uses a tiered system to optimize context usage and information access:

### Tier 1: Essential Context

- [**ecosystem-overview.md**](ecosystem-overview.md) - Core overview of all projects in the ecosystem

### Tier 2: Current Status

- [**project-status.md**](project-status.md) - Current status of all projects
- **Project-specific task files** in the [tasks/](tasks/) directory

### Tier 3: Reference Materials

- **Technical specifications** in the [specs/](specs/) directory
- **Implementation plans** in the [plans/](plans/) directory
- [**project-history.md**](project-history.md) - Recent development sessions (latest 10)
- [**archives/project-history-archive.md**](archives/project-history-archive.md) - Archived development sessions

## Installation

To start using this documentation:

```bash
# Clone the repository
git clone https://github.com/greggh/neovim-ecosystem-docs.git

# Navigate to the documentation directory
cd neovim-ecosystem-docs
```

For web-based access, visit the GitHub repository directly at [https://github.com/greggh/neovim-ecosystem-docs](https://github.com/greggh/neovim-ecosystem-docs).

## Usage

### Workflow Prompts

A comprehensive set of workflow prompts to guide development processes:

```bash
# For starting a new session
cat prompts/startup-prompt.md

# For implementing a new feature
cat prompts/feature-implementation.md

# For standardized command patterns
cat prompts/command-patterns.md
```

### Navigation

To effectively navigate the documentation:

1. Start with the [**Ecosystem Overview**](ecosystem-overview.md) for a high-level understanding
2. Check the [**Cross-Reference Guide**](cross-reference.md) to find related documentation
3. Use the appropriate workflow prompt from the [prompts/](prompts/) directory

### Templates

Standardized templates for creating consistent documentation:

- [**Technical Specification Template**](templates/technical-spec-with-diagrams.md) - For creating visual technical specifications
- [**CLAUDE.md Template**](templates/CLAUDE.md.template) - For project-specific documentation
- [**FUNDING.yml**](templates/FUNDING.yml) - Standard GitHub sponsorship configuration

### Metrics and Improvement

We track the effectiveness of our documentation through:

- **Prompt effectiveness metrics** in the [metrics/](metrics/) directory
- **Monthly reviews** to continuously improve our documentation

## Contributing

Contributions to improve the documentation are welcome! Please follow these steps:

1. Check the [open issues](https://github.com/greggh/neovim-ecosystem-docs/issues) or create a new one
2. Fork the repository
3. Create a new branch for your feature or fix
4. Make your changes
5. Ensure markdown lint passes (`make lint`)
6. Submit a pull request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
  <p>For guidance on navigating this documentation system, see the <a href="cross-reference.md">Cross-Reference Guide</a>.</p>
</div>
