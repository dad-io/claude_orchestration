# Claude Code Orchestrated Templates Documentation

This document provides a comprehensive overview of the orchestrated workflow templates available in this repository. All templates are version 2.0 and fully integrated with the orchestrator system for sophisticated multi-agent coordination.

## Overview

The template system provides pre-defined workflows for common development tasks, leveraging the orchestrator's capabilities for:
- **Multi-agent coordination** with core and dynamic agents
- **State management** with checkpoints and rollback capabilities
- **Parallel execution** for optimal performance
- **Error recovery** with fallback strategies
- **Dynamic agent generation** for specialized requirements

## Template Architecture

### Template Structure (v2.0)
All templates follow a standardized structure:

```yaml
name: Template Name
version: 2.0
orchestration_compatible: true
estimated_time: X minutes
parallel_safe: true/false

# Orchestrator Integration
coordination: orchestrator
required_core_agents: [list of core agents]
dynamic_agents: [specifications for generated agents]

# Orchestrated Workflow
orchestrator_workflow:
  state_machine: true
  checkpoints: [list of checkpoint names]
  error_recovery: true
  parallel_optimization: true

phases: [detailed phase definitions]
deliverables: [expected outputs]
```

### Key Features
- **Orchestration Integration**: Full compatibility with the orchestrator system
- **Agent Requirements**: Specifications for both core and dynamic agents
- **Checkpoint System**: State snapshots for recovery and monitoring
- **Parallel Execution**: Optimized for concurrent agent operation
- **Error Recovery**: Graceful handling of failures and rollbacks

## Available Templates

### 1. analyze.yaml - Comprehensive Analysis
**Purpose:** Multi-faceted codebase analysis with security, quality, and performance audits

**Orchestration Features:**
- **Estimated Time:** 40 minutes
- **Parallel Safe:** Yes
- **Core Agents:** orchestrator, security-scout, code-reviewer, validator-test-runner, architect, doc-scribe
- **Dynamic Agents:** performance-specialist (auto-generated)

**Workflow Phases:**
1. **Security Scan** (Checkpoint: security_scan_complete)
   - Vulnerability scanning
   - Dependency auditing
   - Authentication review
   - Secrets handling audit

2. **Quality Assessment** (Checkpoint: quality_assessment_done)
   - Code style review
   - Test coverage analysis
   - Code smell identification
   - Duplication detection

3. **Performance Audit**
   - Hot path profiling
   - Memory usage analysis
   - Algorithm review
   - Database query optimization

4. **Technical Debt Assessment**
   - TODO/FIXME identification
   - Refactoring opportunity assessment
   - Architecture review
   - Missing test identification

5. **Report Generation** (Checkpoint: analysis_complete)
   - Findings compilation
   - Issue prioritization
   - Action item creation
   - Summary generation

**Deliverables:**
- `analysis-report.md`
- `issues-priority.md`
- `recommendations.md`
- `metrics-dashboard.md`

### 2. build.yaml - Feature Building
**Purpose:** Complete feature development with TDD workflow and quality gates

**Orchestration Features:**
- **Estimated Time:** 90 minutes
- **Requires Input:** Yes (interactive prompts)
- **Core Agents:** orchestrator, architect, validator-test-runner, code-reviewer, security-scout, doc-scribe
- **Dynamic Agents:** builder-{language}, api-design-specialist (auto-generated)

**Interactive Questions:**
- Feature description and requirements
- Dependencies and constraints
- Component interactions

**Workflow Phases:**
1. **Planning** (Checkpoint: design_approved)
   - Requirements analysis
   - Architecture design
   - Interface definition
   - Task breakdown creation

2. **Test Definition**
   - Acceptance test creation
   - Unit test stub generation
   - Test scenario definition
   - Coverage goal setting

3. **Implementation**
   - Core logic development
   - Edge case handling
   - Error handling implementation
   - Performance optimization

4. **Quality Assurance**
   - Complete test execution
   - Code quality review
   - Security validation
   - Performance verification

5. **Documentation**
   - API documentation
   - Usage examples
   - README updates
   - Changelog entries

**Key Features:**
- **Language Detection:** Automatically detects project language
- **TDD Workflow:** Test-first development approach
- **Multi-phase Validation:** Quality gates at each stage

### 3. deploy.yaml - Deployment Preparation
**Purpose:** Production deployment with comprehensive validation and documentation

**Orchestration Features:**
- **Estimated Time:** 30 minutes
- **Parallel Safe:** No (sequential deployment steps)
- **Requires Confirmation:** Yes (deployment approval gates)
- **Core Agents:** orchestrator, architect, validator-test-runner, security-scout, doc-scribe
- **Dynamic Agents:** deployment-specialist (auto-generated)

**Workflow Phases:**
1. **Pre-Deployment Validation** (Checkpoint: validation_passed)
   - Full test suite execution
   - Security vulnerability scanning
   - Environment variable validation
   - Secrets exposure check

2. **Build & Package** (Checkpoint: build_complete)
   - Production build creation
   - Asset optimization
   - Dependency bundling
   - Build manifest generation

3. **Configuration** (Checkpoint: configuration_ready)
   - Environment config generation
   - API documentation updates
   - Deployment script creation
   - Monitoring setup

4. **Performance Validation**
   - Benchmark execution
   - Baseline validation
   - Resource requirement verification
   - Optimization as needed

5. **Documentation**
   - Deployment guide updates
   - Release notes creation
   - Configuration documentation
   - Rollback procedure creation

6. **Final Review** (Checkpoint: deployment_approved)
   - Deployment checklist review
   - Requirement validation
   - Security sign-off
   - Deployment report generation

**Safety Features:**
- **Confirmation Gates:** Human approval required at critical points
- **Pre-checks:** Comprehensive validation before deployment
- **Rollback Procedures:** Documented recovery strategies
- **Post-deployment Monitoring:** Health check guidelines

**Deliverables:**
- `deployment-package.tar.gz`
- `release-notes.md`
- `deployment-guide.md`
- `rollback-procedures.md`
- `deployment-report.md`

### 4. document.yaml - Documentation Generation
**Purpose:** Comprehensive documentation creation for code, APIs, and users

**Orchestration Features:**
- **Estimated Time:** 30 minutes
- **Parallel Safe:** Yes
- **Core Agents:** orchestrator, doc-scribe, architect
- **Dynamic Agents:** api-design-specialist (auto-generated)

**Workflow Phases:**
1. **Analysis** (Checkpoint: analysis_complete)
   - Codebase structure scanning
   - Undocumented code identification
   - Documentation gap assessment
   - Structure planning

2. **API Documentation** (Checkpoint: api_docs_ready)
   - REST endpoint documentation
   - OpenAPI specification creation
   - Schema documentation
   - Example request creation

3. **Code Documentation** (Checkpoint: code_documented)
   - JSDoc/docstring addition
   - Complex function documentation
   - Inline comment creation
   - Type definition documentation

4. **User Documentation** (Checkpoint: user_docs_complete)
   - README creation/updates
   - Installation guide writing
   - Usage example creation
   - Troubleshooting guide development

5. **Developer Documentation**
   - Architecture documentation
   - Development guide creation
   - Contribution guidelines
   - Testing procedure documentation

6. **Changelog & Release Notes**
   - CHANGELOG.md updates
   - Release note creation
   - Breaking change documentation
   - Feature listing

**Documentation Types:**
- API Reference
- User Guides
- Developer Guides
- Architecture Docs
- Inline Code Comments
- Configuration Docs

**Quality Checks:**
- Completeness verification
- Accuracy validation
- Clarity assessment
- Example provision
- Currency verification

### 5. fix.yaml - Issue Resolution
**Purpose:** Systematic bug fixing with TDD approach and comprehensive validation

**Orchestration Features:**
- **Estimated Time:** 60 minutes
- **Priority:** High
- **Parallel Safe:** No (sequential debugging steps)
- **Core Agents:** orchestrator, architect, validator-test-runner, code-reviewer, security-scout
- **Dynamic Agents:** builder-{language} (auto-generated)

**Interactive Questions:**
- Issue description and error details
- Timeline and expected behavior
- Error messages and stack traces

**Workflow Phases:**
1. **Issue Analysis**
   - Issue reproduction
   - Error log analysis
   - Root cause identification
   - Recent change review

2. **Test Creation** (Checkpoint: regression_tests_created)
   - Failing test creation for bug
   - Success criteria definition
   - Regression test development

3. **Fix Implementation** (Checkpoint: fix_implemented)
   - Fix development
   - Edge case handling
   - Error handling enhancement
   - Component updates

4. **Validation** (Checkpoint: validation_passed)
   - Complete test execution
   - Fix verification
   - Regression checking
   - Code review

5. **Security Check**
   - Vulnerability scanning
   - Security issue prevention
   - Input handling validation

6. **Documentation**
   - Fix documentation
   - Changelog updates
   - Runbook creation

**Error Recovery Strategies:**
- **Unable to Reproduce:** Information gathering with debugging specialist
- **Fix Causes Regression:** Rollback and retry with regression analysis
- **Test Failures:** Failure analysis with manual testing fallback
- **Agent Generation Failure:** Fallback to core agents

**Success Criteria:**
- All tests passing
- Issue no longer reproducible
- No new security vulnerabilities
- Performance not degraded
- Code review approved

### 6. improve.yaml - Code Quality Improvement
**Purpose:** Comprehensive code quality enhancement with refactoring and optimization

**Orchestration Features:**
- **Estimated Time:** 45 minutes
- **Parallel Safe:** Yes
- **Core Agents:** orchestrator, code-reviewer, architect, validator-test-runner, security-scout, doc-scribe
- **Dynamic Agents:** performance-specialist, builder-{language} (auto-generated)

**Workflow Phases:**
1. **Code Analysis** (Checkpoint: analysis_complete)
   - Code smell identification
   - Duplication detection
   - Complexity metrics checking
   - Naming convention review

2. **Refactoring Planning**
   - Opportunity identification
   - Structural improvement planning
   - Design pattern application
   - Dependency optimization

3. **Code Cleanup**
   - Dead code removal
   - Linting issue fixes
   - Formatting standardization
   - API updates

4. **Performance Optimization** (Checkpoint: improvements_implemented)
   - Algorithm optimization
   - Database query improvement
   - Caching strategy implementation
   - Resource usage optimization

5. **Testing Enhancement**
   - Test coverage increase
   - Unit test addition
   - Integration test improvement
   - Performance benchmark creation

6. **Security Hardening**
   - Vulnerability fixes
   - Dependency updates
   - Input validation improvement
   - Security header implementation

7. **Documentation Updates**
   - Code comment updates
   - Refactored code documentation
   - API documentation updates
   - Migration guide creation

**Improvement Areas:**
- Code Structure
- Performance
- Security
- Maintainability
- Test Coverage
- Documentation
- Error Handling
- Resource Usage

**Metrics Tracking:**
- Before/after complexity scores
- Test coverage percentages
- Performance benchmarks
- Security ratings

### 7. report.yaml - Status Report Generation
**Purpose:** Comprehensive project status reporting with metrics and visualizations

**Orchestration Features:**
- **Estimated Time:** 15 minutes
- **Parallel Safe:** Yes
- **Core Agents:** orchestrator, code-reviewer, validator-test-runner, security-scout, doc-scribe
- **Dynamic Agents:** performance-specialist (auto-generated)

**Workflow Phases:**
1. **Data Collection** (Checkpoint: data_collected)
   - Execution metrics gathering
   - Agent performance data collection
   - Task completion review
   - Error log compilation

2. **Code Metrics**
   - Lines of code statistics
   - Test coverage metrics
   - Complexity analysis
   - Technical debt assessment

3. **Security Status**
   - Vulnerability summary
   - Compliance status
   - Dependency audit results
   - Security recommendations

4. **Performance Analysis**
   - Performance benchmarks
   - Resource utilization
   - Bottleneck identification
   - Optimization opportunities

5. **Progress Summary**
   - Task completion tracking
   - Progress analysis
   - Blocked item identification
   - Milestone tracking

6. **Report Compilation**
   - Executive summary creation
   - Detailed report generation
   - Visualization creation
   - Recommendation compilation

**Report Sections:**
- Executive Summary
- Project Status
- Completed Tasks
- Pending Items
- Metrics & KPIs
- Issues & Risks
- Recommendations
- Next Steps

**Visualizations:**
- Progress charts
- Burndown graphs
- Quality trends
- Performance graphs
- Resource usage charts

### 8. research.yaml - Research and Planning
**Purpose:** Comprehensive project research with architecture design and risk assessment

**Orchestration Features:**
- **Estimated Time:** 30 minutes
- **Parallel Safe:** Yes
- **Core Agents:** orchestrator, architect, security-scout
- **Dynamic Agents:** api-design-specialist, performance-specialist (auto-generated)

**Interactive Questions:**
- Problem statement and constraints
- Timeline and technology preferences
- Requirements and stakeholders

**Workflow Phases:**
1. **Problem Analysis** (Checkpoint: problem_defined)
   - Problem definition
   - Stakeholder identification
   - Requirements listing
   - Constraint documentation

2. **Solution Research** (Checkpoint: research_complete)
   - Existing solution research
   - Technology evaluation
   - Approach comparison
   - Trade-off analysis

3. **Architecture Design** (Checkpoint: architecture_designed)
   - System architecture design
   - Component definition
   - Data flow planning
   - Interface creation

4. **Security Analysis**
   - Threat modeling
   - Security requirement definition
   - Risk assessment
   - Mitigation strategy planning

5. **Performance Planning**
   - Performance requirement definition
   - Scalability planning
   - Bottleneck prediction
   - Optimization strategy development

6. **Implementation Planning**
   - Task breakdown
   - Effort estimation
   - Milestone definition
   - Dependency identification

7. **Risk Assessment**
   - Risk identification
   - Probability assessment
   - Impact determination
   - Mitigation planning

**Decision Points:**
- **Technology Selection:** Based on expertise, performance, scalability
- **Architecture Pattern:** Monolithic, microservices, serverless, event-driven
- **Data Storage:** Considering volume, queries, consistency, performance

## Usage Patterns

### Command-Line Interface
```bash
# Use templates with orchestration
orchestrate template analyze "security audit Q4"
orchestrate template build "user authentication system"
orchestrate template fix "payment processing bug"
orchestrate template deploy "production release v2.1"
orchestrate template improve "performance optimization"
orchestrate template document "API documentation update"
orchestrate template report "monthly status report"
orchestrate template research "microservices migration"
```

### Template Selection Guide
- **New Feature Development:** `build.yaml`
- **Bug Fixes:** `fix.yaml`
- **Code Quality Issues:** `improve.yaml`
- **Security Concerns:** `analyze.yaml`
- **Production Deployment:** `deploy.yaml`
- **Missing Documentation:** `document.yaml`
- **Project Planning:** `research.yaml`
- **Status Updates:** `report.yaml`

## Orchestrator Integration

### State Management
All templates leverage the orchestrator's state management:
- **Checkpoints:** Automatic state snapshots at key milestones
- **Resume Capability:** Restart from any checkpoint after interruption
- **Rollback Support:** Return to previous checkpoint on failure
- **Progress Tracking:** Real-time monitoring of workflow progression

### Agent Coordination
Templates coordinate multiple agents:
- **Core Agents:** Always available essential agents
- **Dynamic Agents:** Generated on-demand for specialized requirements
- **Parallel Execution:** Concurrent agent operation where safe
- **Dependency Management:** Automatic phase ordering and scheduling

### Error Recovery
Sophisticated error handling:
- **Graceful Degradation:** Fallback strategies for agent failures
- **Automatic Retry:** Retry failed operations with different approaches
- **Manual Intervention Points:** User confirmation for critical decisions
- **Comprehensive Logging:** Detailed error tracking and debugging

## Best Practices

### Template Usage
1. **Choose Appropriate Template:** Match template to task requirements
2. **Provide Complete Information:** Answer all interactive questions thoroughly
3. **Monitor Progress:** Use hooks and checkpoints for progress tracking
4. **Review Deliverables:** Validate all generated outputs
5. **Archive Successful Runs:** Preserve workflow artifacts for learning

### Customization
1. **Environment Variables:** Use template parameters for customization
2. **Agent Configuration:** Specify agent requirements for specialized needs
3. **Checkpoint Strategy:** Plan checkpoint locations for optimal recovery
4. **Parallel Optimization:** Enable parallel execution where appropriate
5. **Confirmation Gates:** Add human approval points for critical operations

### Performance Optimization
1. **Parallel Execution:** Leverage concurrent agent operation
2. **Resource Management:** Monitor agent resource usage
3. **Checkpoint Frequency:** Balance recovery capability with performance
4. **Agent Caching:** Reuse generated agents across similar workflows
5. **Incremental Processing:** Process changes incrementally when possible

The template system provides a comprehensive foundation for orchestrated development workflows, enabling sophisticated multi-agent coordination while maintaining simplicity and reliability for common development tasks.