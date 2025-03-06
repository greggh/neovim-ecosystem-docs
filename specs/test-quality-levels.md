
# Test Quality Levels Specification

## Overview

The test quality validation system in lust-next implements a tiered approach to measuring and enforcing test quality, inspired by static analysis tools like PHPStan. This system defines five progressive quality levels, allowing projects to gradually improve their test quality while providing clear guidance on what's needed to reach the next level.

## Core Principles

1. **Progressive Requirements**: Each level builds upon the previous one, adding more stringent requirements
2. **Clear Criteria**: Every level has specific, measurable criteria for validation
3. **Actionable Feedback**: Validation failures provide clear guidance on how to improve
4. **Configurability**: Quality levels can be adjusted based on project needs
5. **Custom Rules**: Projects can add custom requirements beyond the standard levels

## Quality Level Definitions

### Level 1: Basic Testing

Level 1 represents the minimum acceptable quality for tests, focusing on basic test presence and structure.

**Requirements:**

- Each test file must contain at least one test
- Each test must have at least one assertion
- Test names must be descriptive (minimum length check)
- No empty describe or it blocks
- Basic structural validation (proper nesting)

**Purpose:**
Ensures that tests exist and have minimal validation logic. This level is suitable for projects just starting with testing or with minimal test requirements.

### Level 2: Standard Testing

Level 2 builds on Level 1 by requiring more comprehensive test coverage and improved test structure.

**Requirements:**

- All Level 1 requirements
- Multiple assertions per test (at least 2 on average)
- Use of multiple assertion types (not just assert.equals)
- Error case testing for functions that can fail
- Proper test organization with describe blocks
- Consistent naming patterns for tests and blocks

**Purpose:**
Ensures that tests cover more than just the happy path and use a variety of assertion types. This level is suitable for most projects as a baseline quality standard.

### Level 3: Comprehensive Testing

Level 3 introduces more rigorous requirements for testing edge cases and proper test isolation.

**Requirements:**

- All Level 2 requirements
- Edge case testing (boundary values, empty inputs, etc.)
- Type checking assertions where appropriate
- Setup and teardown for test isolation
- Proper use of mocks and stubs for dependencies
- Testing of all exported functions

**Purpose:**
Ensures thorough testing with good isolation between tests. This level is suitable for projects where reliability is important, and represents a solid testing practice.

### Level 4: Advanced Testing

Level 4 adds requirements for comprehensive verification and advanced testing scenarios.

**Requirements:**

- All Level 3 requirements
- Boundary condition testing (min/max values, array limits)
- Complete mock verification (all expected calls verified)
- Separate unit and integration tests
- Performance validation where applicable
- Testing of behavior with invalid inputs
- Mock reset verification between tests

**Purpose:**
Ensures very thorough testing that validates both correctness and behavior. This level is suitable for critical libraries and tools where reliability is essential.

### Level 5: Complete Testing

Level 5 represents the highest standard of test quality with comprehensive coverage and specialized tests.

**Requirements:**

- All Level 4 requirements
- Security vulnerability testing
- 100% branch coverage (or explicit excluded branches)
- Comprehensive API contract testing
- Full dependency isolation
- Negative testing (test that errors occur when they should)
- Documentation examples tested

**Purpose:**
Ensures the most rigorous testing standards for mission-critical projects. This level is suitable for security-sensitive or high-reliability requirements.

## Implementation Details

### Quality Validation Process

The quality validation process follows these steps:

1. **Test Analysis**:
   - Static analysis of test files to detect structure and patterns
   - Runtime tracking of assertions and test behavior
   - Collection of metrics like assertion counts, types, and patterns

1. **Level Validation**:
   - Check all requirements for the configured quality level
   - Identify any missing requirements
   - Calculate an overall quality score

1. **Report Generation**:
   - Generate detailed report of passing/failing requirements
   - Provide actionable suggestions for improvement
   - Highlight specific files or tests that need enhancement

### Detection Mechanisms

The system uses multiple mechanisms to detect quality issues:

#### Static Analysis

Examines test file structure and content before execution:

- Function call pattern matching
- AST-based analysis for structure
- Naming pattern validation
- Test organization validation

#### Runtime Tracking

Monitors test execution to capture behavior:

- Assertion type tracking
- Assertion count tracking
- Mock/stub usage tracking
- Error handling validation

#### Heuristic Analysis

Uses pattern-based heuristics to identify advanced test types:

- Security test detection (patterns that check for vulnerabilities)
- Performance test detection (patterns that measure execution time)
- Boundary test detection (patterns that check edge values)

### Configuration

Quality validation is configured in `.hooks-util.lua`:

```lua
test_quality = {
  enabled = true,      -- Enable test quality validation

  quality = {
    enabled = true,    -- Enable quality level validation
    level = 3,         -- Quality level to enforce (1-5)
    strict = false,    -- If true, fail on first issue

    -- Custom rules (optional)
    custom_rules = {
      require_pending_tests = false,  -- Require pending tests for unimplemented features
      security_test_pattern = "security_",  -- Custom pattern for security tests
      min_assertions = 3,             -- Override minimum assertions
    }
  }
}

```text

### Report Format

Quality reports are generated in multiple formats:

#### Summary Format

```text
Test Quality Level: 3 (Comprehensive)
Overall Quality Score: 82% (pass)

✓ Basic structure requirements (Level 1): PASS
✓ Standard testing requirements (Level 2): PASS
✓ Comprehensive testing requirements (Level 3): PASS
✗ Advanced testing requirements (Level 4): FAIL

  - Missing complete mock verification in 3 tests
  - No performance validation tests found

Files needing improvement:

- test/api_spec.lua: Missing edge case tests
- test/config_spec.lua: Incomplete mock verification

```text

#### Detailed JSON/HTML Format

More comprehensive reports include:

- File-by-file breakdown
- Test-by-test quality metrics
- Detailed suggestions for improvement
- Links to quality level documentation
- Visual indicators for quality scores

## Implementation Example

Here's a simplified example of how the quality module validates tests:

```lua
local quality = {}

quality.validate_level = function(test_results, level)
  local validation = {
    pass = true,
    issues = {},
    score = 0,
    details = {}
  }

  -- Check level 1 requirements
  if level >= 1 then
    validation.details.level1 = quality.validate_level1(test_results)
    if not validation.details.level1.pass then
      validation.pass = false
      for _, issue in ipairs(validation.details.level1.issues) do
        table.insert(validation.issues, issue)
      end
    end
  end

  -- Check higher levels similarly
  if level >= 2 and validation.pass then
    validation.details.level2 = quality.validate_level2(test_results)
    -- Same pattern for checking issues
  end

  -- Calculate overall score
  validation.score = quality.calculate_score(validation.details, level)

  return validation
end

quality.validate_level1 = function(test_results)
  local validation = {
    pass = true,
    issues = {},
  }

  -- Check if all test files have at least one test
  for file, file_results in pairs(test_results.files) do
    if #file_results.tests == 0 then
      validation.pass = false
      table.insert(validation.issues, {
        file = file,
        issue = "No tests found in file",
        fix = "Add at least one test using it()"
      })
    end
  end

  -- Check if all tests have at least one assertion
  for file, file_results in pairs(test_results.files) do
    for _, test in ipairs(file_results.tests) do
      if test.assertion_count == 0 then
        validation.pass = false
        table.insert(validation.issues, {
          file = file,
          test = test.name,
          issue = "Test has no assertions",
          fix = "Add at least one assertion"
        })
      end
    end
  end

  -- Additional level 1 checks would follow

  return validation
end

-- Additional validation functions for other levels

```text

This tiered approach allows projects to gradually improve their test quality while providing clear guidance on what's needed to reach the next level.

