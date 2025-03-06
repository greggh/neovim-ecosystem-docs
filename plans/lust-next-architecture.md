
# Lust-Next Architecture

## Overview

Lust-Next is an enhanced Lua testing framework built on the foundations of the original lust framework. It provides a comprehensive set of features for testing Lua code, including test discovery, tagging, async testing, mocking, and reporting.

## Core Architecture

### Main Components

The lust-next framework consists of the following primary components:

1. **Core Test Framework** (`lust-next.lua`):
   - Contains the core testing functionality
   - Implements describe/it pattern for BDD-style tests
   - Provides assertion system for validations
   - Handles test execution and reporting

1. **Discovery Module** (internal):
   - Handles automatic test file discovery
   - Supports platform-independent file finding
   - Implements pattern matching for test files
   - Provides utilities for path manipulation

1. **Tagging Module** (internal):
   - Implements test filtering based on tags
   - Supports inclusion and exclusion patterns
   - Provides tag inheritance in nested describe blocks
   - Handles tag-based reporting

1. **Async Module** (internal):
   - Provides coroutine-based async testing functionality
   - Implements `async()`, `await()`, and `wait_until()`
   - Handles timeout detection and reporting
   - Supports multiple Lua versions with compatibility layer

1. **Mocking System** (internal):
   - Implements comprehensive mock/spy/stub functionality
   - Provides expectation setting and verification
   - Handles call tracking and sequence verification
   - Supports complex object mocking with method tracking

1. **Module Management** (internal):
   - Implements `reset_module()` for clean state between tests
   - Provides `with_fresh_module()` for isolated module testing
   - Handles module cache manipulation for reloading

1. **Coverage Module** (`src/coverage.lua`):
   - Tracks code execution using debug hooks
   - Calculates coverage statistics for lines and functions
   - Implements file filtering with pattern matching
   - Gathers structured coverage data for reporting

1. **Quality Module** (`src/quality.lua`):
   - Implements tiered quality validation system
   - Analyzes test structure and assertion patterns
   - Validates against quality level requirements
   - Collects quality metrics for reporting

1. **Reporting Module** (`src/reporting.lua`):
   - Centralized module for all report generation
   - Handles file I/O operations and directory creation
   - Implements multiple output formats (summary, JSON, HTML, LCOV)
   - Provides format conversion for both coverage and quality data

## Data Flow Architecture

### Test Execution Flow

```text
[Test Files] → [Discovery] → [Test Runner] → [Execution] → [Results] → [Reporting]

```text

1. **Test Discovery Phase**:
   - Scan directories for test files based on patterns
   - Load discovered test files
   - Register tests in internal structures

1. **Test Execution Phase**:
   - Initialize test environment
   - Execute `describe` and `it` blocks based on filters
   - Track assertion results and errors
   - Collect test execution metadata

1. **Reporting Phase**:
   - Gather test results
   - Format results based on configuration
   - Output results to console and/or files

### Coverage Data Flow

```text
[Source Code] → [Debug Hooks] → [Coverage Tracking] → [Stats Calculation] → [Reporting Module] → [Multiple Formats]

```text

1. **Instrumentation Phase**:
   - Register debug hooks for line and function tracking
   - Set up file filtering patterns

1. **Data Collection Phase**:
   - Track executed lines during test execution
   - Record function calls and returns
   - Associate execution with source files

1. **Processing Phase**:
   - Calculate coverage statistics
   - Determine covered/uncovered lines
   - Generate structured coverage data

1. **Reporting Phase**:
   - Send data to reporting module
   - Generate reports in multiple formats
   - Save reports to files

### Quality Data Flow

```text
[Test Files] → [Static Analysis] → [Runtime Tracking] → [Quality Rules] → [Validation] → [Reporting Module] → [Reports]

```text

1. **Analysis Phase**:
   - Perform static analysis of test files
   - Track assertion patterns during execution
   - Collect test structure information

1. **Validation Phase**:
   - Apply quality level requirements
   - Check test structure against rules
   - Validate assertion types and counts

1. **Reporting Phase**:
   - Generate structured quality data
   - Send data to reporting module
   - Create quality reports with improvement suggestions

## Modular Reporting Architecture

### Core Principles

1. **Separation of Concerns**:
   - Coverage module collects data only (no report generation)
   - Quality module analyzes test quality only (no report generation)
   - Reporting module handles all formatting and file operations

1. **Standardized Data Interfaces**:
   - Coverage data follows consistent structure
   - Quality data follows consistent structure
   - Both integrate with reporting module through standard interfaces

1. **Pluggable Formatters**:
   - Reporting module supports multiple output formats
   - New formats can be added without changing data collection
   - Each format has dedicated formatter function

1. **Robust File Operations**:
   - Centralized directory creation with multiple fallback mechanisms
   - Standardized error handling for file operations
   - Platform-independent path handling

### Data Structure Interfaces

#### Coverage Data Structure

```lua
{
  stats = {
    files = 10,             -- Total files tracked
    lines = {
      total = 500,          -- Total lines of code
      covered = 400,        -- Covered lines
      percent = 80          -- Coverage percentage
    },
    functions = {
      total = 50,           -- Total functions
      covered = 45,         -- Called functions
      percent = 90          -- Function coverage percentage
    }
  },
  files = {
    ["path/to/file.lua"] = {
      lines = {
        total = 100,        -- Lines in this file
        covered = 80,       -- Covered lines
        percent = 80,       -- Coverage percentage
        hit = {10, 11, 12}, -- Line numbers that were hit
        miss = {13, 14, 15} -- Line numbers that were missed
      },
      functions = {
        total = 5,          -- Functions in this file
        covered = 4,        -- Called functions
        percent = 80,       -- Function coverage percentage
        -- Function details
        details = {
          ["functionName"] = {
            line = 10,      -- Starting line
            covered = true  -- Whether it was called
          }
        }
      }
    }
  }
}

```text

#### Quality Data Structure

```lua
{
  level = 3,                -- Configured quality level
  passed = true,            -- Whether tests meet the level
  score = 85,               -- Quality score percentage
  summary = {
    tests = 50,             -- Total tests
    assertions = 150,       -- Total assertions
    assertion_types = 10,   -- Different assertion types used
    avg_assertions = 3,     -- Average assertions per test
    edge_cases = 15         -- Identified edge case tests
  },
  levels = {
    -- Results for each level
    [1] = { passed = true, score = 100 },
    [2] = { passed = true, score = 95 },
    [3] = { passed = true, score = 85 },
    [4] = { passed = false, score = 60 },
    [5] = { passed = false, score = 40 }
  },
  issues = {
    -- Quality issues found
    {
      file = "test/api_spec.lua",
      test = "should handle errors",
      issue = "No boundary testing",
      level = 4,
      fix = "Add tests for boundary conditions"
    }
  }
}

```text

### Report Format Implementations

The reporting module implements multiple output formats for both coverage and quality data:

1. **Console Summary**:
   - Text-based summary for terminal output
   - Color-coded for clarity
   - Concise overview of results

1. **JSON Format**:
   - Complete data representation in machine-readable format
   - Structured for easy parsing and integration
   - Contains all collected metrics and details

1. **HTML Format**:
   - Visual representation with interactive elements
   - File-by-file breakdown with syntax highlighting
   - Line-by-line coverage visualization
   - Quality metrics with detailed suggestions
   - Sortable and filterable tables

1. **LCOV Format**:
   - Industry-standard format for coverage data
   - Compatible with external tools like Coveralls and Codecov
   - Line-by-line coverage information

## Module Interaction

### Core Dependencies

```text
      ┌──────────────┐
      │  lust-next   │
      └──────┬───────┘
             │
    ┌────────┴────────┐
    ▼                 ▼
┌─────────┐    ┌────────────┐
│coverage │    │  quality   │
└────┬────┘    └─────┬──────┘
     │               │
     └───────┬───────┘
             ▼
      ┌────────────┐
      │ reporting  │
      └────────────┘

```text

- `lust-next.lua` is the main entry point for test execution
- `coverage.lua` and `quality.lua` are optional modules for enhanced functionality
- `reporting.lua` provides centralized reporting capabilities
- All modules can be used independently or together

### Integration Points

1. **lust-next → coverage**:
   - Initializes coverage tracking when enabled
   - Passes file patterns and configuration options
   - Triggers coverage calculation after tests complete

1. **lust-next → quality**:
   - Passes test results for quality analysis
   - Provides configuration for quality level
   - Initiates quality validation after tests

1. **coverage → reporting**:
   - Sends structured coverage data for report generation
   - Specifies report formats and output options
   - Receives confirmation of report generation

1. **quality → reporting**:
   - Sends structured quality data for report generation
   - Specifies report formats and output options
   - Receives confirmation of report generation

### Extensibility

The architecture is designed for extensibility:

1. **New Report Formats**:
   - Add new formatter functions to the reporting module
   - Maintain the same data structure interface
   - Register with the format registry

1. **Additional Metrics**:
   - Extend the coverage or quality data structures
   - Add new collection mechanisms
   - Update formatters to include new metrics

1. **Custom Validation Rules**:
   - Add custom rules to quality validation
   - Implement rule checking functions
   - Register with the quality module

## Test Discovery and Execution

### Test Discovery Process

```text
[Pattern] → [Find Matching Files] → [Load Test Files] → [Register Tests] → [Execute Tests]

```text

1. The discovery process begins with a pattern (e.g., `test_*.lua` or `spec/**/*_spec.lua`)
2. Files matching the pattern are found using platform-specific methods
3. Each test file is loaded using Lua's `require` or `dofile`
4. Tests are registered in internal structures as they're defined
5. Tests are executed based on filtering criteria

### Test Filtering Process

```text
[All Tests] → [Tag Filtering] → [Pattern Filtering] → [Focus Filtering] → [Filtered Tests]

```text

1. The complete set of tests is gathered from registered tests
2. Tests are filtered based on specified tags (inclusion and exclusion)
3. Tests may be further filtered by pattern matching test names
4. Focus mode can override other filters (fdescribe/fit)
5. The resulting filtered set of tests is executed

## Async Testing Implementation

### Coroutine-Based Architecture

The async testing system uses Lua coroutines to enable asynchronous test patterns:

```text
[async test] → [Create Coroutine] → [Resume Until Yield] → [Wait/Poll] → [Resume] → [Completion]

```text

1. Async tests are wrapped in coroutines
2. Test execution yields when waiting for operations
3. The test runner periodically checks wait conditions
4. When conditions are met, execution resumes
5. Timeout detection prevents infinite waiting

### Key Functions

- `async()` - Wraps a function to be executed asynchronously
- `await(seconds)` - Pauses execution for a specified time
- `wait_until(condition)` - Waits until a condition function returns true
- `parallel_async()` - Runs multiple async operations concurrently

## Mock/Spy System

### Object Replacement Architecture

The mocking system uses Lua's metatable capabilities to create sophisticated mock objects:

```text
[Original Object] → [Create Mock/Spy] → [Set Expectations] → [Use in Tests] → [Verify Calls]

```text

1. Original functions or objects are captured
2. Mock objects are created with metatables for tracking
3. Expectations can be set for method calls
4. Mock objects are used in test code
5. Call patterns are verified against expectations

### Key Components

- `spy.on(obj, method)` - Creates a spy that tracks calls to a method
- `spy.new()` - Creates a standalone spy function
- `mock(obj)` - Creates a complete mock of an object
- `stub(obj, method, impl)` - Replaces a method with a stub implementation
- `expect(spy).to.be.called()` - Sets up expectation for verification

## Future Architecture Extensions

### Planned Enhancements

1. **Plugin System**:
   - Extensible architecture for custom plugins
   - Registration mechanism for hooks into test lifecycle
   - Standard interface for plugin interaction

1. **Enhanced Reporting**:
   - Additional output formats (e.g., Cobertura XML)
   - Enhanced visualization in HTML reports
   - Historical trend tracking across runs

1. **Performance Optimization**:
   - Improved data structures for large codebases
   - Optimized file scanning algorithms
   - Better memory management for coverage data

1. **Integration Enhancements**:
   - LuaRocks package publication
   - Direct CI platform integration
   - IDE plugin support

This architecture document provides a comprehensive overview of the lust-next design, emphasizing its modular approach and separation of concerns.

