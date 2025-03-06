# Bug Fixing Workflow

This prompt provides a standardized workflow for diagnosing and fixing bugs across our Neovim ecosystem projects, ensuring consistent quality and properly validated solutions.

## Bug Analysis

Before starting to fix a bug, gather the following information:

1. **Bug Reproduction**
   - What are the exact steps to reproduce the bug?
   - Is it consistent or intermittent?
   - What environment/configuration is needed to reproduce it?

2. **Impact Assessment**
   - How severe is the bug? (critical, major, minor, cosmetic)
   - What functionality is affected?
   - Are there temporary workarounds users can employ until the fix is deployed? (This is only to assess severity and user impact, NOT to replace fixing the actual bug)
   - **IMPORTANT: Always fix the root cause. Workarounds are never acceptable as permanent solutions.**

3. **Root Cause Hypothesis**
   - What component(s) might be causing the issue?
   - What interactions might be triggering the problem?
   - What code patterns could be related to the bug?

## Diagnostic Steps

### 1. Environment Setup

```bash
# Update repository to latest state
git -C /home/gregg/Projects/[project-path] fetch origin
git -C /home/gregg/Projects/[project-path] pull

# Create bug fix branch
git -C /home/gregg/Projects/[project-path] checkout -b fix/[bug-description]

# Update submodules if present
git -C /home/gregg/Projects/[project-path] submodule update --init --recursive
```text

### 2. Reproduce the Bug

1. **Create Minimal Test Case**
   - Create a test that reproduces the bug
   - Simplify the reproduction case as much as possible
   - Isolate from unrelated functionality

2. **Verify Reproduction**
   - Run the test to confirm it fails due to the bug
   - Document exact conditions that trigger the bug
   - Note any variations that affect the bug's behavior

### 3. Debug the Issue

1. **Examine Relevant Code**
   - Review the code in components related to the bug
   - Check for common issues like:
     - Logic errors
     - Boundary conditions
     - Race conditions
     - Resource management
     - Error handling

2. **Analyze Data Flow**
   - Trace data through the affected components
   - Identify where values diverge from expected
   - Check interactions between components

3. **Use Debugging Tools**
   - Add print statements or logging
   - Use Lua debugging tools if available
   - Check for pattern matches in similar code

### 4. Identify Root Cause

1. **Pinpoint the Issue**
   - Identify the specific code causing the bug
   - Understand why the code is failing
   - Document the root cause

2. **Consider Broader Patterns**
   - Check if the same issue might exist elsewhere
   - Look for related bugs in the codebase
   - Assess if this is a symptom of a larger design issue

## Implementation Steps

### 1. Plan the Fix

1. **Design the Solution**
   - What is the proper change needed to fix the bug at its root cause?
   - Are there multiple ways to address the issue? Choose the most robust solution
   - What approach best balances correctness, simplicity, and performance?
   - **CRITICAL: Never implement temporary workarounds or remove functionality to avoid fixing bugs**

2. **Consider Side Effects**
   - Will the fix affect other functionality?
   - Are there backward compatibility concerns?
   - Might the fix cause performance impacts?

### 2. Write or Modify Tests

```bash
# Open test file corresponding to the buggy component
[editor] /home/gregg/Projects/[project-path]/[test-file-path]

# Implement test that verifies the fix
```text

Ensure that:

- The test fails without the fix
- The test passes with the fix
- The test clearly demonstrates the fixed behavior

### 3. Implement the Fix

```bash
# Open file with the bug
[editor] /home/gregg/Projects/[project-path]/[file-path]

# Implement the fix
```text

Follow these principles:

- Fix the root cause, not just the symptoms
- Maintain code style consistency
- Add comments explaining the fix if necessary
- Consider adding assertions or validation

### 4. Verify the Fix

```bash
# Run the specific test for this bug
env -C /home/gregg/Projects/[project-path] [test-command] -f [test-name]

# Run all tests to ensure no regressions
env -C /home/gregg/Projects/[project-path] [test-command]

# Run linting and formatting
env -C /home/gregg/Projects/[project-path] [lint-command]
```text

**Note**: hooks-util will typically handle validation automatically during commit, but it's good to run tests manually during development.

### 5. Code Review Self-Check

Before committing, review the fix against these criteria:

- ✅ The fix addresses the root cause, not just the symptoms
- ✅ All tests pass, including the new test for this bug
- ✅ The fix is complete and robust
- ✅ No new edge cases are introduced
- ✅ No performance issues are introduced
- ✅ Code style is consistent with the project
- ✅ No functionality has been removed to avoid fixing the bug

### 6. Commit and Push

```bash
# Commit changes (hooks-util will validate automatically)
git -C /home/gregg/Projects/[project-path] add .
git -C /home/gregg/Projects/[project-path] commit -m "Fix [bug-description]: [brief explanation]"

# Push to remote
git -C /home/gregg/Projects/[project-path] push -u origin fix/[bug-description]
```text

## Cross-Project Considerations

### 1. Check for Related Issues

If the bug might affect multiple projects:

1. **Identify Potentially Affected Projects**
   - Does the bug affect shared libraries or dependencies?
   - Could similar code patterns exist in other projects?

2. **Verify in Other Projects**
   - Test for the same bug in related projects
   - Create test cases for each affected project

3. **Apply Fix Across Projects**
   - Adapt the fix for each affected project
   - Ensure tests pass in all projects

### 2. Dependency Updates

If the bug is in a dependency:

- For hooks-util: Update and push changes, then update submodules in dependent projects
- For lust-next: Update and push changes, then update dependencies in dependent projects
- For nvim-toolkit: Update shared utilities and propagate to dependent projects
- For templates: Update template repositories and selectively merge changes into dependent projects

### 3. Documentation Updates

1. **Update Project Documentation**
   - Add notes about the fix to CHANGELOG.md
   - Update project-specific CLAUDE.md if necessary
   - Update any user documentation describing the fixed functionality

2. **Update Ecosystem Documentation**
   - Update `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/project-status.md` if significant
   - Update task file in `/home/gregg/Projects/docs-projects/neovim-ecosystem-docs/tasks/`

### 4. Merge to Main

When the fix is complete and tested:

```bash
# Checkout main branch
git -C /home/gregg/Projects/[project-path] checkout main

# Merge fix branch
git -C /home/gregg/Projects/[project-path] merge fix/[bug-description]

# Push to remote
git -C /home/gregg/Projects/[project-path] push origin main
```text

### 5. Release Considerations

For significant bug fixes:

- Consider whether a patch release is warranted
- Update version number according to semver (usually patch level for bug fixes)
- Create release tag and GitHub release if appropriate

## Post-Fix Analysis

Once the bug is fixed, perform a brief analysis:

1. **Prevention Strategies**
   - Could this bug have been prevented with better testing?
   - Are there design patterns that could prevent similar bugs?
   - Should test coverage be improved in related areas?

2. **Process Improvement**
   - What can we learn from this bug?
   - How can we improve our development process?
   - Are there tools or practices that could help catch similar issues?

3. **Knowledge Sharing**
   - Document key insights from the bug fix
   - Share lessons learned with the team
   - Update relevant documentation

Remember to follow standard development workflows throughout the bug fixing process.

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash
# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs-projects/neovim-ecosystem-docs/metrics/prompt-metrics.md
```text

Add a new entry with the following format:

```markdown
### YYYY-MM-DD - bug-fixing

- **Task**: Brief description of the bug fixed
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement
```text

This data helps us continuously improve our workflow prompts.
