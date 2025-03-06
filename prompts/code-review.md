# Code Review and Quality Checks

This prompt provides a standardized workflow for conducting comprehensive code reviews and quality checks across our Neovim ecosystem projects.

## Code Review Philosophy

Our code review process aims to:

1. **Ensure Code Quality** - Verify that code meets our standards for readability, maintainability, and performance
2. **Knowledge Sharing** - Spread understanding of the codebase among team members
3. **Bug Prevention** - Catch issues before they reach production
4. **Consistency** - Maintain consistent patterns and practices across our projects
5. **Improvement** - Help each other grow as developers through constructive feedback

## Review Preparation

### 1. Understand the Context

```bash
# Check recent commits to understand the changes
git -C /home/gregg/Projects/[project-path] log -n 5 --oneline

# View the changes to be reviewed
git -C /home/gregg/Projects/[project-path] diff [base-branch]...[review-branch]

# List modified files
git -C /home/gregg/Projects/[project-path] diff --name-only [base-branch]...[review-branch]
```

### 2. Check Automated Tests and Checks

```bash
# Check if hooks-util pre-commit hooks have run successfully
env -C /home/gregg/Projects/[project-path] lua .hooks-util/run_tests.lua
env -C /home/gregg/Projects/[project-path] luacheck .

# Check GitHub Actions status if available
gh -R greggh/[project-name] run list
```

### 3. Review Documentation Updates

```bash
# Check for documentation changes
git -C /home/gregg/Projects/[project-path] diff [base-branch]...[review-branch] -- "*.md" "*/doc/*" "*/docs/*"
```

## Code Review Checklist

Review the code against these categories:

### 1. Functionality

- ✅ Does the code work as intended?
- ✅ Does it handle edge cases appropriately?
- ✅ Are there any logical errors or bugs?
- ✅ Does it follow the specified requirements?
- ✅ Is error handling comprehensive and appropriate?

### 2. Code Quality

- ✅ Is the code well-structured and organized?
- ✅ Are functions and variables named clearly and consistently?
- ✅ Is there appropriate documentation (inline comments and doc strings)?
- ✅ Is code duplicated that could be refactored?
- ✅ Is the code reasonably efficient?
- ✅ Are there any over-engineered or unnecessarily complex sections?

### 3. Testing

- ✅ Are there sufficient tests covering the new code?
- ✅ Do tests validate both expected behavior and edge cases?
- ✅ Are the tests clear and maintainable?
- ✅ Does the test coverage meet our quality standards?

### 4. Security and Stability

- ✅ Are there any potential security issues?
- ✅ Is user input properly validated?
- ✅ Are there any resource leaks or performance bottlenecks?
- ✅ Could the code cause crashes or unexpected behavior?

### 5. Project-Specific Standards

- ✅ Does the code follow project-specific architecture patterns?
- ✅ Is the code consistent with the existing codebase?
- ✅ Does it use appropriate APIs and utilities from our ecosystem?
- ✅ Does it adhere to our style guide?

### 6. Integration

- ✅ Does the code integrate well with existing components?
- ✅ Are there any compatibility issues with dependencies?
- ✅ Does it properly utilize shared libraries (nvim-toolkit, lust-next)?
- ✅ Are there any unintended side effects on other components?

## Code Quality Tools

Use these tools to supplement manual review:

### 1. Static Analysis

```bash
# Run Lua static analysis
env -C /home/gregg/Projects/[project-path] luacheck .

# Run Lua formatter to check style issues
env -C /home/gregg/Projects/[project-path] stylua --check .
```

### 2. Test Coverage Analysis

```bash
# Run test coverage analysis using lust-next
env -C /home/gregg/Projects/[project-path] lua .hooks-util/deps/lust-next/run_tests.lua --coverage

# Review coverage reports (HTML format)
xdg-open /home/gregg/Projects/[project-path]/coverage/index.html
```

### 3. Performance Measurement

**Note**: Currently, we don't have standardized performance benchmarking tools integrated with our projects. This is a planned future enhancement for lust-next.

For performance-critical code, manually time and evaluate operations:

```bash
# Basic timing wrapper in Lua
env -C /home/gregg/Projects/[project-path] lua -e "
local start = os.clock()
-- Call the function to benchmark
local result = require('your_module').function_to_test()
local elapsed = os.clock() - start
print(string.format('Execution time: %.6f seconds', elapsed))
"
```

## Review Feedback

When providing feedback:

1. **Be Specific**
   - Reference specific lines or files
   - Provide clear examples of issues or improvements

2. **Be Constructive**
   - Suggest solutions, not just problems
   - Explain the reasoning behind suggestions

3. **Prioritize Issues**
   - Distinguish between critical issues and minor suggestions
   - Focus on the most important aspects first

4. **Balance Positive and Negative**
   - Highlight what is done well
   - Frame feedback as improvements, not criticisms

5. **Consider Context**
   - Take into account the purpose and constraints of the code
   - Recognize trade-offs made in the implementation

## Review Process

### 1. Initial Review

```bash
# Check out the branch to review
git -C /home/gregg/Projects/[project-path] checkout [review-branch]

# Make detailed notes on issues and improvements
```

Document feedback in these categories:
- Must Fix: Critical issues that block approval
- Should Fix: Important issues that should be addressed 
- Consider: Suggestions for improvement that are optional
- Questions: Areas where clarification is needed

### 2. Follow-up Review

After issues are addressed:

```bash
# Pull latest changes
git -C /home/gregg/Projects/[project-path] pull

# View changes since last review
git -C /home/gregg/Projects/[project-path] diff [previous-review-commit]..HEAD
```

Verify that:
- All "Must Fix" issues have been resolved
- "Should Fix" issues have been addressed or explained
- "Consider" suggestions have been evaluated

### 3. Final Approval

When the code meets all requirements:

- Confirm all critical issues are resolved
- Verify all tests pass
- Check that documentation is updated
- Ensure code quality tools report no significant issues

## Merging and Integration

After review approval:

```bash
# Checkout main branch
git -C /home/gregg/Projects/[project-path] checkout main

# Merge the reviewed branch
git -C /home/gregg/Projects/[project-path] merge [review-branch]

# Push to remote
git -C /home/gregg/Projects/[project-path] push origin main
```

## Post-Review Actions

After completing the review:

1. **Update Documentation**
   - Update project-specific CLAUDE.md if necessary
   - Update `/home/gregg/Projects/docs/project-status.md` for significant changes
   - Update relevant task files in `/home/gregg/Projects/docs/tasks/`

2. **Knowledge Sharing**
   - Document key insights from the review
   - Share lessons learned with the team
   - Update coding guidelines if needed

3. **Process Improvement**
   - Identify patterns in review findings
   - Consider updates to templates or hooks-util to prevent common issues
   - Evaluate if review process could be improved

Remember that code review is not just about finding issues, but also about learning, knowledge sharing, and collective improvement of our codebase.

## Metrics Collection

After using this prompt, please record its effectiveness to help us improve our documentation:

```bash
# Add a new entry to the metrics file
[editor] /home/gregg/Projects/docs/metrics/prompt-metrics.md
```

Add a new entry with the following format:

```markdown
### YYYY-MM-DD - code-review

- **Task**: Brief description of the code reviewed
- **Completion**: ✅ Successful / ❌ Unsuccessful
- **Time Saved**: Estimated time saved (in minutes)
- **Errors Prevented**: Description of any errors the prompt helped avoid
- **Satisfaction**: Rating (1-5)
- **Notes**: Any observations or suggestions for improvement
```

This data helps us continuously improve our workflow prompts.