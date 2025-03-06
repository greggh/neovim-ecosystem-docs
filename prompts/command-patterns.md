# Command Patterns and Tool Usage

This prompt provides guidance on optimal command patterns and tool usage across our Neovim ecosystem projects.

## Modern Tool Recommendations

| Instead of             | Please Use                       | Advantages                                     |
|------------------------|----------------------------------|------------------------------------------------|
| `find`                 | `fd`                             | Faster, more intuitive syntax, better defaults |
| `grep`                 | `rg` (ripgrep) or `ag` (silver searcher) | Much faster, better pattern support, smart defaults |
| `cat` for searching    | `bat`                            | Syntax highlighting, line numbers, Git integration |
| `ls`                   | `exa` or `ls` with better flags  | More readable output, better information display |
| `cd` between projects  | `git -C /path/to/repo`           | Avoids directory context switching |
| GitHub manual checks   | `gh` CLI commands                | Direct API access, cleaner output |

## CRITICAL: NEVER USE THE CD COMMAND

### ⚠️ ABSOLUTELY NEVER USE THE `cd` COMMAND IN ANY WORK ⚠️

Instead of changing directories with `cd`, ALWAYS use one of these alternatives:

1. **For running commands in a specific directory:**
   ```bash
   # NEVER do this:
   cd /home/gregg/Projects/lust-next && lua run_tests.lua
   
   # ALWAYS do this instead:
   env -C /home/gregg/Projects/lust-next lua run_tests.lua
   ```

2. **For git operations:**
   ```bash
   # NEVER do this:
   cd /home/gregg/Projects/lust-next && git status
   
   # ALWAYS do this instead:
   git -C /home/gregg/Projects/lust-next status
   ```

3. **For operations that don't support -C:**
   ```bash
   # PREFERRED: Use full paths with every command whenever possible
   ls -la /home/gregg/Projects/lust-next/src
   rg "function" /home/gregg/Projects/lust-next
   cat /home/gregg/Projects/lust-next/README.md
   ```

4. **ONLY as a last resort - use pushd/popd pattern in a SINGLE COMMAND:**
   ```bash
   # LAST RESORT: If -C isn't supported AND full paths won't work
   # ALWAYS combine pushd, commands, and popd in a SINGLE LINE:
   pushd /home/gregg/Projects/lust-next > /dev/null && command1 && command2 && popd > /dev/null
   
   # NEVER do this (separate commands):
   # pushd /home/gregg/Projects/lust-next
   # command1
   # command2
   # popd
   ```
   
   ⚠️ **IMPORTANT RULES for pushd/popd:**
   - Only use when both `-C` AND full paths are impossible
   - Always chain everything in a SINGLE command line with && operators
   - Always use `> /dev/null` to suppress directory stack output
   - Always include `popd` at the end of the SAME command
   - Never use nested pushd operations
   - Document why this approach was necessary

## Command Pattern Principles

1. **Full Absolute Paths**
   - Always use full paths instead of relative paths
   - Example: `/home/gregg/Projects/lust-next` not `../lust-next`

3. **Modern Command-Line Tools**
   - Prefer modern alternatives with better performance
   - Example: `rg --type lua "function"` not `grep -r "function" --include="*.lua"`

4. **Targeted File Operations**
   - Use specific patterns to limit search scope
   - Example: `fd -p "**/*.lua" /home/gregg/Projects/lust-next`

5. **Local Git Workflow**
   - Make changes locally and push, rather than using direct API calls
   - Sync local and remote repositories after any API operations

## Standard Commands for Our Projects

### Git Operations

```bash
# Repository status
git -C /home/gregg/Projects/lust-next status

# Add and commit changes
git -C /home/gregg/Projects/lust-next add src/reporting.lua
git -C /home/gregg/Projects/lust-next commit -m "Enhance reporting module with better error handling"

# Pull latest changes
git -C /home/gregg/Projects/lust-next pull origin main
```

### File Operations

```bash
# Find specific file types
fd -p "**/*.lua" /home/gregg/Projects/lust-next

# Search for patterns in code
rg --type lua "function setup" /home/gregg/Projects/lust-next

# View file content with syntax highlighting
bat /home/gregg/Projects/lust-next/src/reporting.lua
```

### Project-Specific Commands

```bash
# Run tests (using command from project's CLAUDE.md)
env -C /home/gregg/Projects/lust-next lua run_tests.lua

# Update dependencies
git -C /home/gregg/Projects/lust-next submodule update --remote

# Run specific project commands (always check CLAUDE.md)
env -C /home/gregg/Projects/lust-next ./scripts/version_bump.lua patch
```

### GitHub CLI Operations

```bash
# List repository issues
gh issue list -R greggh/lust-next

# Create a PR
gh pr create -R greggh/lust-next --title "Add enhanced reporting" --body "Implements the new reporting system with better error handling"

# Check workflow status
gh workflow list -R greggh/lust-next
```

## Important Notes

1. Always consult the project's CLAUDE.md for project-specific commands
2. Use gh CLI for all GitHub operations
3. Follow the tiered documentation structure to find relevant information
4. Always use full paths and avoid directory context switching
5. Utilize modern command-line tools for better efficiency

Remember: Good command patterns lead to more efficient development workflows and clearer documentation.

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash
# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs/metrics/prompt-metrics.md
```

Add a new entry with the following format:

```markdown
### YYYY-MM-DD - command-patterns

- **Task**: Brief description of how command patterns were applied
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement
```

This data helps us continuously improve our workflow prompts.