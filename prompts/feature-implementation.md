# Feature Implementation Workflow

This prompt provides a standardized workflow for implementing new features across our Neovim ecosystem projects, ensuring consistent quality and proper integration with existing components.

## Feature Planning

Before beginning implementation, ensure the following information is clear:

1. **Feature Scope**
   - What specific functionality will the feature provide?
   - What are the boundaries of the feature?
   - How does it integrate with existing components?

2. **Usage Patterns**
   - How will users interact with the feature?
   - What configuration options are needed?
   - What API does the feature expose?

3. **Quality Requirements**
   - What tests are needed to validate the feature?
   - What edge cases should be handled?
   - What performance considerations exist?

## Implementation Steps

### 1. Environment Setup

```bash
# Update repository to latest state
git -C /home/gregg/Projects/[project-path] fetch origin
git -C /home/gregg/Projects/[project-path] pull

# Create feature branch
git -C /home/gregg/Projects/[project-path] checkout -b feature/[feature-name]

# Update submodules if present
git -C /home/gregg/Projects/[project-path] submodule update --init --recursive
```

### 2. Implementation Process

1. **Setup Test Environment First**
   - Create test files to validate the feature before implementing
   - Define test expectations based on planned API and behaviors
   - Set up any necessary test fixtures or mocks

2. **Implement Core Functionality**
   - Begin with minimal implementation that passes tests
   - Focus on correctness before optimization
   - Add documentation as you implement

3. **Enhance and Refine**
   - Improve error handling
   - Add validation for edge cases
   - Optimize performance where needed
   - Ensure proper integration with other components

4. **Documentation**
   - Add inline documentation for all functions and key sections
   - Update README or other documentation files
   - Add usage examples

### 3. Quality Assurance

```bash
# Run specific tests for the feature
env -C /home/gregg/Projects/[project-path] [test-command] -f [feature-name]

# Run linting and formatting
env -C /home/gregg/Projects/[project-path] [lint-command]

# Run all tests to ensure no regressions
env -C /home/gregg/Projects/[project-path] [test-command]
```

**Note**: hooks-util will typically handle these automatically during commit, but it's good to run them manually during development.

### 4. Code Review Self-Check

Before committing, review the implementation against these criteria:

- ✅ Code follows project's style guide and conventions
- ✅ All tests pass and provide adequate coverage
- ✅ Documentation is clear and comprehensive
- ✅ Error handling is robust
- ✅ No unnecessary code or dependencies
- ✅ Performance considerations are addressed
- ✅ Integration with other components is seamless
- ✅ API design is consistent with project patterns

### 5. Commit and Push

```bash
# Commit changes (hooks-util will validate automatically)
git -C /home/gregg/Projects/[project-path] add .
git -C /home/gregg/Projects/[project-path] commit -m "Add [feature-name] with [brief description]"

# Push to remote
git -C /home/gregg/Projects/[project-path] push -u origin feature/[feature-name]
```

## Integration with Ecosystem

### 1. Documentation Updates

- Update project-specific CLAUDE.md if necessary
- Update `/home/gregg/Projects/docs/project-status.md` with new feature
- Update task file in `/home/gregg/Projects/docs/tasks/`

### 2. Cross-Project Considerations

If the feature affects multiple projects:

- Ensure compatibility with dependent projects
- Update any shared libraries or utilities
- Consider cascading updates if needed:
  - For template updates: selectively pull changes with `git fetch upstream && git merge --strategy-option=theirs upstream/main -- [specific-files]`
  - For hooks-util: update submodules with `git submodule update --remote`
  - For lust-next or nvim-toolkit: update dependencies

### 3. Merge to Main

When the feature is complete and tested:

```bash
# Checkout main branch
git -C /home/gregg/Projects/[project-path] checkout main

# Merge feature branch
git -C /home/gregg/Projects/[project-path] merge feature/[feature-name]

# Push to remote
git -C /home/gregg/Projects/[project-path] push origin main
```

### 4. Release Considerations

If the feature warrants a new release:

- Update version number according to semver (major.minor.patch)
- Update CHANGELOG.md with details of the new feature
- Create release tag and GitHub release if appropriate

## Feature Validation

After implementation, verify the feature from a user perspective:

- ✅ Feature works as expected in real-world scenarios
- ✅ Documentation makes usage clear
- ✅ Configuration options are intuitive
- ✅ Error messages are helpful
- ✅ Performance is acceptable

## Next Steps

After completing the feature:

1. Consider follow-up enhancements or optimizations
2. Plan for user feedback and iteration
3. Update project roadmap
4. Evaluate impact on other planned features

Remember to follow standard development workflows throughout the implementation process.