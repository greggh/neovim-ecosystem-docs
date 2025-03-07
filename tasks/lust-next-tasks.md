
# Lust-Next Tasks

## Current Focus: Comprehensive Lua Code Quality Module (Codefix)

Our top priority is now developing a comprehensive Lua code quality module (codefix.lua) that integrates with hooks-util and provides advanced fixing capabilities beyond what existing tools offer.

## High Priority Tasks

1. **Create Core Codefix Module**
   - [x] Design codefix.lua architecture with strong separation of concerns
   - [x] Implement core file analysis functionality 
   - [x] Create flexible configuration system
   - [x] Build plugin system for custom rules and fixers
   - [x] Develop command-line interface for standalone use
   - [x] Add hooks-util integration layer

2. **Integrate Existing Tools**
   - [x] Create StyLua integration for formatting
   - [x] Implement Luacheck integration for linting
   - [x] Add selectable rule configurations
   - [x] Build validation layer to verify fixes
   - [x] Create reporting capabilities for issues

3. **Implement Custom Fixers**
   - [x] Multiline string whitespace fixing
   - [x] Unused variable handling with underscore prefixing
   - [x] String concatenation optimization
   - [x] Type annotation generation and validation
   - [x] Lua version compatibility handling
   - [x] Neovim-specific module configuration

4. **Create Testing Framework**
   - [ ] Develop test fixtures with common Lua errors
   - [ ] Create validation tests for each fixer
   - [ ] Add integration tests with hooks-util
   - [ ] Build performance benchmarks for large codebases

## Medium Priority Tasks

1. **Documentation**
   - [ ] Create comprehensive API documentation
   - [ ] Develop examples for each fixer type
   - [ ] Add troubleshooting guide
   - [ ] Create visual guides for common errors

2. **Improve Reporting Module** *(Previous focus, now secondary)*
   - [ ] Create additional test cases for reporting module validation
   - [ ] Add Cobertura XML output format for CI systems
   - [ ] Enhance HTML reports with source highlighting
   - [ ] Add configuration for report file naming

## Medium Priority Tasks

1. **Performance Benchmarking Module**
   - [ ] Implement benchmark runner functionality with precise timing
   - [ ] Create timing utilities with nanosecond precision when available
   - [ ] Support benchmark suites with multiple test cases
   - [ ] Add statistical analysis of benchmark results (mean, median, std dev)
   - [ ] Implement comparison between benchmark runs
   - [ ] Create visual benchmark reports in HTML format
   - [ ] Add performance regression detection
   - [ ] Support profiling integration for deeper analysis

1. **Performance Optimization**
   - [ ] Optimize coverage data processing for large codebases
   - [ ] Improve file scanning performance with better caching
   - [ ] Add option for lightweight reporting mode for faster execution

1. **Integration Improvements**
   - [ ] Create streamlined API for third-party tools to consume reports
   - [ ] Add export capabilities for common code quality platforms
   - [ ] Implement report merging for distributed test execution

1. **Usability Enhancements**
   - [ ] Add progress indicators during report generation
   - [ ] Improve report file organization with configurable structures
   - [ ] Create report comparison utilities to track improvements

## Low Priority Tasks

1. **Advanced Features**
   - [ ] Add support for Git integration in reports (show who last modified lines)
   - [ ] Implement historical trend tracking for coverage and quality metrics
   - [ ] Create dashboard view for multi-project report aggregation

1. **Extensibility**
   - [ ] Add plugin system for custom report formats
   - [ ] Create hooks for pre/post report generation
   - [ ] Implement custom metrics collection framework
