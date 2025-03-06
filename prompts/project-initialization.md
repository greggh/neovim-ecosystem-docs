# Project Initialization Workflow

This prompt provides a standardized workflow for initializing new projects within our Neovim ecosystem, ensuring consistency and adherence to best practices.

## Project Types

Choose the appropriate project type to initialize:

1. **Neovim Plugin**
   - Template: `/home/gregg/Projects/neovim/neovim-plugin-template`
   - For creating new Neovim plugins with standardized structure

2. **Neovim Configuration**
   - Template: `/home/gregg/Projects/neovim/neovim-config-template`
   - For creating Neovim configurations with modern plugin management

3. **Lua Library**
   - Template: `/home/gregg/Projects/base-project-repo`
   - For standalone Lua libraries with proper packaging

4. **Test Project**
   - For creating test environments for validating other projects
   - Based on specific project requirements

## Initialization Steps

### 1. Repository Creation

```bash
# Create the project directory
mkdir -p /home/gregg/Projects/[type]/[project-name]

# Initialize git repository
git -C /home/gregg/Projects/[type]/[project-name] init

# Copy template files from appropriate template
# For Neovim plugin:
cp -r /home/gregg/Projects/neovim/neovim-plugin-template/. /home/gregg/Projects/neovim/plugins/[project-name]
# For Neovim config:
cp -r /home/gregg/Projects/neovim/neovim-config-template/. /home/gregg/Projects/[type]/[project-name]
# For Lua library:
cp -r /home/gregg/Projects/base-project-repo/. /home/gregg/Projects/[type]/[project-name]

# Add template as upstream remote for future template updates
# For Neovim plugin:
git -C /home/gregg/Projects/neovim/plugins/[project-name] remote add upstream https://github.com/greggh/neovim-plugin-template.git
# For Neovim config:
git -C /home/gregg/Projects/[type]/[project-name] remote add upstream https://github.com/greggh/neovim-config-template.git
# For Lua library:
git -C /home/gregg/Projects/[type]/[project-name] remote add upstream https://github.com/greggh/base-project-template.git
```

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
     ```

3. **Update Documentation**:
   - Create project-specific CLAUDE.md from template
   - Create [project]-tasks.md in docs/tasks
   - Copy FUNDING.yml template to .github/FUNDING.yml (from `/home/gregg/Projects/templates/FUNDING.yml`)

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

2. **Create GitHub Repository**:
   ```bash
   # Using GitHub CLI
   gh repo create greggh/[project-name] --public --source=/home/gregg/Projects/[type]/[project-name] --remote=origin
   
   # Push to remote
   git -C /home/gregg/Projects/[type]/[project-name] push -u origin main
   ```

3. **Verify GitHub Actions**:
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

4. **Configure GitHub Settings**:
   - Enable Issues and Discussions
   - Configure branch protection rules
   - Set up GitHub Actions if not automatically configured
   - Verify sponsors configuration from the FUNDING.yml template

### 4. Integration with Ecosystem

1. **Add to documentation**:
   - Update `/home/gregg/Projects/docs/ecosystem-overview.md`
   - Update `/home/gregg/Projects/docs/project-status.md`
   - Create task file in `/home/gregg/Projects/docs/tasks/`

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