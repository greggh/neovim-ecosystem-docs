# Project Initialization Workflow

This prompt provides a standardized workflow for initializing new projects within our Neovim ecosystem, ensuring consistency and adherence to best practices.

## Project Types

Choose the appropriate project type to initialize:

1. **Neovim Plugin**
   - Template: `/home/gregg/Projects/templates/neovim-plugin-template`
   - For creating new Neovim plugins with standardized structure
   - Target directory: `/home/gregg/Projects/neovim/plugins/[project-name]`

2. **Neovim Configuration**
   - Template: `/home/gregg/Projects/templates/neovim-config-template`
   - For creating Neovim configurations with modern plugin management
   - Target directory: `/home/gregg/Projects/neovim-config/[project-name]`

3. **Lua Library**
   - Template: `/home/gregg/Projects/templates/base-project-repo`
   - For standalone Lua libraries with proper packaging
   - Target directory: `/home/gregg/Projects/lua-library/[project-name]`

4. **Documentation Project**
   - Template: `/home/gregg/Projects/templates/base-project-repo`
   - For documentation repositories with markdown files, diagrams, and specifications
   - Target directory: `/home/gregg/Projects/docs-projects/[project-name]`
   - Note: Current ecosystem documentation is in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs`
   - Linting/Styling Requirements:
     - Markdown: markdownlint for consistent formatting and style
     - YAML: yamllint for workflow and configuration files
     - Lua: luacheck and stylua for any script files
     - Bash: shellcheck for shell scripts
     - JSON: jsonlint or prettier for configuration files
     - TOML: taplo for configuration files (such as Cargo.toml or pyproject.toml)
   - Additional setup:
     - Enable MkDocs for documentation publishing
     - Configure mermaid.js for diagram support
     - Add pre-commit hooks for all file types
     - Add GitHub workflows for linting all supported file types

5. **Test Project**
   - For creating test environments for validating other projects
   - Based on specific project requirements
   - Target directory: `/home/gregg/Projects/test-projects/[project-name]`

6. **Template**
   - For project templates that serve as the foundation for other projects
   - Target directory: `/home/gregg/Projects/templates/[project-name]`

## Initialization Steps

### 1. Repository Creation

```bash
# Create the project directory based on the type
case "$type" in
  "neovim")
    mkdir -p /home/gregg/Projects/neovim/plugins/[project-name]
    # Initialize git repository
    git -C /home/gregg/Projects/neovim/plugins/[project-name] init
    ;;
  "neovim-config")
    mkdir -p /home/gregg/Projects/neovim-config/[project-name]
    # Initialize git repository
    git -C /home/gregg/Projects/neovim-config/[project-name] init
    ;;
  "lua-library")
    mkdir -p /home/gregg/Projects/lua-library/[project-name]
    # Initialize git repository
    git -C /home/gregg/Projects/lua-library/[project-name] init
    ;;
  "docs-projects")
    mkdir -p /home/gregg/Projects/docs-projects/[project-name]
    # Initialize git repository
    git -C /home/gregg/Projects/docs-projects/[project-name] init
    ;;
  "test-projects")
    mkdir -p /home/gregg/Projects/test-projects/[project-name]
    # Initialize git repository
    git -C /home/gregg/Projects/test-projects/[project-name] init
    ;;
  "templates")
    mkdir -p /home/gregg/Projects/templates/[project-name]
    # Initialize git repository
    git -C /home/gregg/Projects/templates/[project-name] init
    ;;
  *)
    echo "Unknown project type: $type"
    exit 1
    ;;
esac

# Copy template files from appropriate template
# For Neovim plugin:
cp -r /home/gregg/Projects/templates/neovim-plugin-template/. /home/gregg/Projects/neovim/plugins/[project-name]
# For Neovim config:
cp -r /home/gregg/Projects/templates/neovim-config-template/. /home/gregg/Projects/neovim-config/[project-name]
# For Lua library:
cp -r /home/gregg/Projects/templates/base-project-repo/. /home/gregg/Projects/lua-library/[project-name]
# For Documentation project:
cp -r /home/gregg/Projects/templates/base-project-repo/. /home/gregg/Projects/docs-projects/[project-name]
# For Test project:
cp -r /home/gregg/Projects/templates/base-project-repo/. /home/gregg/Projects/test-projects/[project-name]
# For Template:
mkdir -p /home/gregg/Projects/templates/[project-name]

# Add template as upstream remote for future template updates
# For Neovim plugin:
git -C /home/gregg/Projects/neovim/plugins/[project-name] remote add upstream https://github.com/greggh/neovim-plugin-template.git
# For Neovim config:
git -C /home/gregg/Projects/neovim-config/[project-name] remote add upstream https://github.com/greggh/neovim-config-template.git
# For Lua library:
git -C /home/gregg/Projects/lua-library/[project-name] remote add upstream https://github.com/greggh/base-project-template.git
# For Documentation project:
git -C /home/gregg/Projects/docs-projects/[project-name] remote add upstream https://github.com/greggh/base-project-template.git
# For Test project:
git -C /home/gregg/Projects/test-projects/[project-name] remote add upstream https://github.com/greggh/base-project-template.git
# For Template:
# No upstream for templates as they are the source
```text

### 2. Project Customization

1. **Update Project Metadata**:
   - Update project name in all files (plugin name, config name, or library name)
   - Set appropriate version number (start with 0.1.0)
   - Update GitHub username references to "greggh"
   - Ensure all URLs and badges reference greggh/[project-name]

2. **Configure Development Environment**:
   - Add git hooks for pre-commit validation:

     ```bash
     mkdir -p /home/gregg/Projects/[type]/[project-name]/.git/hooks
     git -C /home/gregg/Projects/[type]/[project-name] submodule add https://github.com/greggh/hooks-util .hooks-util
     env -C /home/gregg/Projects/[type]/[project-name]/.hooks-util ./install.sh
     
     # For Documentation projects, also create .pre-commit-config.yaml
     if [[ "$type" == "docs" ]]; then
       cat > /home/gregg/Projects/[type]/[project-name]/.pre-commit-config.yaml << 'EOF'
     repos:
     - repo: https://github.com/pre-commit/pre-commit-hooks
       rev: v4.4.0
       hooks:
         - id: trailing-whitespace
         - id: end-of-file-fixer
         - id: check-yaml
         - id: check-added-large-files
     
     - repo: https://github.com/igorshubovych/markdownlint-cli
       rev: v0.34.0
       hooks:
         - id: markdownlint
           args: [--config, .markdownlint.json]
     
     - repo: https://github.com/adrienverge/yamllint.git
       rev: v1.30.0
       hooks:
         - id: yamllint
           args: [--config-file, .yamllint.yml]
     
     - repo: https://github.com/JohnnyMorganz/StyLua
       rev: v0.17.1
       hooks:
         - id: stylua
           args: [--check]
     
     - repo: https://github.com/lunarmodules/luacheck
       rev: v1.1.0
       hooks:
         - id: luacheck
     
     - repo: https://github.com/pre-commit/mirrors-prettier
       rev: v3.0.0-alpha.6
       hooks:
         - id: prettier
           types_or: [json]
     
     - repo: https://github.com/tamasfe/taplo-pre-commit
       rev: v0.8.1
       hooks:
         - id: taplo
     
     - repo: https://github.com/koalaman/shellcheck-precommit
       rev: v0.9.0
       hooks:
         - id: shellcheck
     EOF
     fi
     ```

   - For Documentation projects, add additional linting configurations:

     ```bash
     # Create .markdownlint.json
     cat > /home/gregg/Projects/[type]/[project-name]/.markdownlint.json << 'EOF'
     {
       "default": true,
       "line-length": false,
       "no-duplicate-heading": false,
       "no-inline-html": false
     }
     EOF
     
     # Create .yamllint.yml
     cat > /home/gregg/Projects/[type]/[project-name]/.yamllint.yml << 'EOF'
     extends: default
     
     rules:
       line-length: disable
       document-start: disable
     EOF
     
     # Create .luacheckrc for any Lua scripts
     cat > /home/gregg/Projects/[type]/[project-name]/.luacheckrc << 'EOF'
     std = {
       globals = { "vim" },
     }
     EOF
     
     # Create .prettierrc for JSON formatting
     cat > /home/gregg/Projects/[type]/[project-name]/.prettierrc << 'EOF'
     {
       "printWidth": 100,
       "tabWidth": 2,
       "singleQuote": true,
       "trailingComma": "es5"
     }
     EOF
     
     # Create .taplo.toml for TOML formatting
     cat > /home/gregg/Projects/[type]/[project-name]/.taplo.toml << 'EOF'
     [formatting]
     align_entries = true
     array_trailing_comma = true
     column_width = 80
     compact_arrays = false
     compact_inline_tables = false
     EOF
     ```

3. **Update Documentation**:
   - Create project-specific CLAUDE.md from template
   - Create [project]-tasks.md in docs/tasks
   - Copy FUNDING.yml template to .github/FUNDING.yml (from `/home/gregg/Projects/templates/FUNDING.yml`)

   - For Documentation projects, set up MkDocs:

     ```bash
     # Create mkdocs.yml if it doesn't exist
     cat > /home/gregg/Projects/[type]/[project-name]/mkdocs.yml << 'EOF'
     site_name: [project-name] Documentation
     site_description: Documentation for [project-name]
     site_author: gregg
     
     repo_name: greggh/[project-name]
     repo_url: https://github.com/greggh/[project-name]
     edit_uri: edit/main/docs/
     
     theme:
       name: material
       palette:
         primary: indigo
         accent: indigo
       features:
         - navigation.instant
         - navigation.tracking
         - navigation.expand
         - navigation.indexes
         - content.code.copy
     
     markdown_extensions:
       - admonition
       - pymdownx.details
       - pymdownx.superfences:
           custom_fences:
             - name: mermaid
               class: mermaid
               format: !!python/name:pymdownx.superfences.fence_code_format
       - pymdownx.highlight
       - pymdownx.inlinehilite
       - pymdownx.tabbed
       - pymdownx.tasklist
       - toc:
           permalink: true
     
     nav:
       - Home: index.md
       - Getting Started: getting-started.md
     EOF
     
     # Create GitHub workflow for linting
     mkdir -p /home/gregg/Projects/[type]/[project-name]/.github/workflows
     
     # Create markdown-lint.yml workflow
     cat > /home/gregg/Projects/[type]/[project-name]/.github/workflows/markdown-lint.yml << 'EOF'
     name: Lint Markdown

     on:
       push:
         branches: [ main ]
         paths:
           - '**.md'
       pull_request:
         branches: [ main ]
         paths:
           - '**.md'
     
     jobs:
       lint:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Set up Node.js
             uses: actions/setup-node@v3
             with:
               node-version: '16'
           - name: Install markdownlint
             run: npm install -g markdownlint-cli
           - name: Run markdownlint
             run: markdownlint '**/*.md' --ignore node_modules
     EOF
     
     # Create yaml-lint.yml workflow
     cat > /home/gregg/Projects/[type]/[project-name]/.github/workflows/yaml-lint.yml << 'EOF'
     name: Lint YAML
     
     on:
       push:
         branches: [ main ]
         paths:
           - '**.yml'
           - '**.yaml'
       pull_request:
         branches: [ main ]
         paths:
           - '**.yml'
           - '**.yaml'
     
     jobs:
       lint:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Set up Python
             uses: actions/setup-python@v4
             with:
               python-version: '3.10'
           - name: Install yamllint
             run: pip install yamllint
           - name: Run yamllint
             run: yamllint .
     EOF
     
     # Create scripts-lint.yml workflow for bash and lua
     cat > /home/gregg/Projects/[type]/[project-name]/.github/workflows/scripts-lint.yml << 'EOF'
     name: Lint Scripts
     
     on:
       push:
         branches: [ main ]
         paths:
           - '**.sh'
           - '**.lua'
       pull_request:
         branches: [ main ]
         paths:
           - '**.sh'
           - '**.lua'
     
     jobs:
       shellcheck:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Run ShellCheck
             uses: ludeeus/action-shellcheck@master
             with:
               scandir: './scripts'
     
       luacheck:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Set up Lua
             uses: leafo/gh-actions-lua@v9
             with:
               luaVersion: "5.1"
           - name: Set up LuaRocks
             uses: leafo/gh-actions-luarocks@v4
           - name: Install luacheck
             run: luarocks install luacheck
           - name: Run luacheck
             run: luacheck .
     EOF
     
     # Create docs-build.yml workflow
     cat > /home/gregg/Projects/[type]/[project-name]/.github/workflows/docs-build.yml << 'EOF'
     name: Build Documentation
     
     on:
       push:
         branches: [ main ]
         paths:
           - 'docs/**'
           - 'mkdocs.yml'
       pull_request:
         branches: [ main ]
         paths:
           - 'docs/**'
           - 'mkdocs.yml'
     
     jobs:
       build:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Set up Python
             uses: actions/setup-python@v4
             with:
               python-version: '3.10'
           - name: Install dependencies
             run: |
               python -m pip install --upgrade pip
               pip install mkdocs-material
               pip install pymdown-extensions
           - name: Build docs
             run: mkdocs build
     EOF
     
     # Create json-lint.yml workflow
     cat > /home/gregg/Projects/[type]/[project-name]/.github/workflows/json-lint.yml << 'EOF'
     name: Lint JSON
     
     on:
       push:
         branches: [ main ]
         paths:
           - '**.json'
       pull_request:
         branches: [ main ]
         paths:
           - '**.json'
     
     jobs:
       lint:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Set up Node.js
             uses: actions/setup-node@v3
             with:
               node-version: '16'
           - name: Install jsonlint
             run: npm install -g jsonlint
           - name: Run jsonlint
             run: find . -name "*.json" -not -path "./node_modules/*" -exec jsonlint -c {} \;
     EOF
     
     # Create toml-lint.yml workflow
     cat > /home/gregg/Projects/[type]/[project-name]/.github/workflows/toml-lint.yml << 'EOF'
     name: Lint TOML
     
     on:
       push:
         branches: [ main ]
         paths:
           - '**.toml'
       pull_request:
         branches: [ main ]
         paths:
           - '**.toml'
     
     jobs:
       lint:
         runs-on: ubuntu-latest
         steps:
           - uses: actions/checkout@v3
           - name: Install Taplo
             run: |
               curl -fsSL https://github.com/tamasfe/taplo/releases/latest/download/taplo-linux-x86_64.gz | gzip -d > taplo
               chmod +x taplo
               sudo mv taplo /usr/local/bin/
           - name: Run Taplo
             run: find . -name "*.toml" -exec taplo lint {} \;
     EOF
     ```

### 3. Repository Setup

1. **Initial Commit**:

   ```bash
   git -C /home/gregg/Projects/[type]/[project-name] add .
   git -C /home/gregg/Projects/[type]/[project-name] commit -m "Initial commit from template"
   ```

   **Note**: The pre-commit hooks from hooks-util should run automatically during the commit. If the hooks fail:

- Fix the issues in the current project
- If the issue is in hooks-util itself:
  - Fix hooks-util directly
  - Commit and push the changes
  - Cascade updates to all dependent projects with `git submodule update --remote` in each project

1. **Create GitHub Repository**:

   ```bash
   # Using GitHub CLI
   case "$type" in
     "neovim")
       gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/neovim/plugins/[project-name] --remote=origin
       git -C /home/gregg/Projects/neovim/plugins/[project-name] push -u origin main
       ;;
     "neovim-config")
       gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/neovim-config/[project-name] --remote=origin
       git -C /home/gregg/Projects/neovim-config/[project-name] push -u origin main
       ;;
     "lua-library")
       gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/lua-library/[project-name] --remote=origin
       git -C /home/gregg/Projects/lua-library/[project-name] push -u origin main
       ;;
     "docs-projects")
       gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/docs-projects/[project-name] --remote=origin
       git -C /home/gregg/Projects/docs-projects/[project-name] push -u origin main
       ;;
     "test-projects")
       gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/test-projects/[project-name] --remote=origin
       git -C /home/gregg/Projects/test-projects/[project-name] push -u origin main
       ;;
     "templates")
       gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/templates/[project-name] --remote=origin
       git -C /home/gregg/Projects/templates/[project-name] push -u origin main
       ;;
     *)
       echo "Unknown project type: $type"
       exit 1
       ;;
   esac
   ```

2. **Verify GitHub Actions**:

   ```bash
   # Check status of workflows
   gh -R greggh/[project-name] workflow list
   gh -R greggh/[project-name] run list
   ```

   If workflows fail:
   - Check workflow logs to identify issues: `gh -R greggh/[project-name] run view [run-id]`
   - Fix workflow issues in the current project
   - If the issue relates to template or shared components:
     - Update the affected template or shared component
     - Push changes to the template repository
     - For template updates: selectively pull template changes into dependent projects with `git fetch upstream && git merge --strategy-option=theirs upstream/main -- [specific-files]`
     - For hooks-util: update submodules in dependent projects
     - For lust-next: update dependencies as needed

3. **Configure GitHub Settings**:
   - Enable Issues and Discussions
   - Configure branch protection rules
   - Set up GitHub Actions if not automatically configured
   - Verify sponsors configuration from the FUNDING.yml template

### 4. Integration with Ecosystem

1. **Add to documentation**:
   - Update `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/ecosystem-overview.md`
   - Update `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md`
   - Create task file in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/`

2. **Setup Dependencies (project-specific)**:
   - For Neovim plugins and configurations:
     - Add nvim-toolkit for shared utilities (UI, logging, keymap management)
   - For all projects:
     - hooks-util (already installed) handles testing through lust-next integration
     - No need for separate lust-next configuration

3. **Update Templates**:
   - Document any customizations made for future template improvements
   - If template improvements are identified, update the template repository and selectively propagate changes to existing projects

## Project Structure Validation

Before completing initialization, validate the project structure:

- ✅ All required files from template are present
- ✅ All template placeholders have been replaced
- ✅ Git hooks are properly installed
- ✅ Documentation is properly configured
- ✅ GitHub repository is properly set up
- ✅ CI/CD workflows are configured correctly and passing
- ✅ Template is configured as upstream remote
- ✅ FUNDING.yml is configured correctly

## Next Steps

After initialization, proceed with:

1. Implement core functionality according to project requirements
2. Create comprehensive test suite (hooks-util will manage this)
3. Update documentation to reflect implementation details
4. Configure CI/CD for automated testing and releases

Remember to follow standard development workflows for all subsequent work.

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash
# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md
```text

Add a new entry with the following format:

```markdown
### YYYY-MM-DD - project-initialization

- **Task**: Brief description of the project initialized
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement
```text

This data helps us continuously improve our workflow prompts.
