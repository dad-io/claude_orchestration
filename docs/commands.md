# Command Documentation

This document provides comprehensive documentation for all commands in the orchestration system, including their workflows, agent coordination patterns, and usage guidelines.

## Overview

The command system consists of two categories:

1. **Primary Orchestration Command**: The main `orchestrate` command that provides sophisticated multi-agent workflow coordination
2. **Specialized Commands**: Targeted commands for specific development tasks with orchestrator integration

All commands leverage the orchestrator for coordination, state management, and dynamic agent generation.

---

## Primary Command: orchestrate

**File**: `commands/orchestrate.md`
**Purpose**: Complex multi-agent workflow coordination with state management
**Usage**: `orchestrate <workflow_type> "<specific_requirements>"`

### Core Workflow Types

#### 1. Feature Development
**Usage**: `orchestrate feature "user authentication system"`

**Workflow Phases**:
```yaml
1. Planning (parallel):
   - architect: Design system architecture and data flow
   - security-scout: Identify security requirements and compliance needs

2. Design (sequential):
   - architect: Create detailed implementation plan with acceptance criteria
   - validator-test-runner: Draft comprehensive test suite (TDD approach)

3. Implementation (parallel):
   - orchestrator: Generate builder-{language} agent based on tech stack
   - builder-{language}: Implement feature to satisfy failing tests
   - security-scout: Continuous security monitoring during development

4. Validation (sequential):
   - validator-test-runner: Execute test suite and verify coverage
   - code-reviewer: Quality review and security audit
   - security-scout: Final security verification

5. Documentation (parallel):
   - doc-scribe: Update API docs and user guides
   - doc-scribe: Generate changelog entries
```

#### 2. Bug Fix Workflow
**Usage**: `orchestrate bugfix "payment processing error in checkout"`

**Workflow Phases**:
```yaml
1. Investigation:
   - architect: Analyze system context and potential impact areas
   - validator-test-runner: Create regression test to reproduce issue

2. Resolution:
   - orchestrator: Generate appropriate specialist agent if needed
   - builder-{language}: Implement minimal fix
   - validator-test-runner: Verify fix resolves issue without regressions

3. Verification:
   - code-reviewer: Review fix for quality and side effects
   - security-scout: Ensure fix doesn't introduce security vulnerabilities
```

#### 3. Security Audit
**Usage**: `orchestrate security "comprehensive security review"`

**Workflow Phases**:
```yaml
1. Scanning (parallel):
   - security-scout: Vulnerability scan and dependency audit
   - code-reviewer: Security-focused code review
   - architect: Architecture security assessment

2. Analysis:
   - orchestrator: Aggregate findings and prioritize by severity
   - security-scout: Generate detailed security report

3. Remediation:
   - orchestrator: Create specialized agents for complex security fixes
   - builder-{language}: Implement security improvements
   - validator-test-runner: Create security-focused tests
```

#### 4. Performance Optimization
**Usage**: `orchestrate performance "optimize API response times"`

**Workflow Phases**:
```yaml
1. Profiling:
   - orchestrator: Generate performance-specialist agent
   - performance-specialist: Identify bottlenecks and hot paths

2. Optimization:
   - architect: Design optimization strategy
   - builder-{language}: Implement performance improvements
   - validator-test-runner: Create performance benchmarks

3. Validation:
   - performance-specialist: Verify improvements and measure gains
   - code-reviewer: Ensure optimizations don't compromise correctness
```

#### 5. Custom Workflow
**Usage**: `orchestrate custom "deploy microservice with monitoring"`

**Dynamic Orchestration**:
```yaml
1. orchestrator: Analyze requirements and generate workflow plan
2. orchestrator: Create specialized agents as needed:
   - deploy-specialist for deployment automation
   - monitoring-specialist for observability setup
3. orchestrator: Execute workflow with real-time coordination
4. orchestrator: Monitor progress and handle error recovery
```

### Template Integration
**Usage**: `orchestrate template <template_name> "<requirements>"`

Examples:
```bash
orchestrate template fix "payment processing bug"
orchestrate template deploy "production release v2.1"
orchestrate template analyze "security audit Q4"
```

### Advanced Features

#### Orchestration Features
- **State Management**: Checkpoints, resume, rollback capabilities
- **Parallel Execution**: Dependency resolution, resource management, progress monitoring
- **Agent Generation**: Dynamic creation, template-based, custom agents
- **Communication**: Message bus, event system, status reporting

#### Advanced Usage Examples
```bash
# Workflow customization
orchestrate custom "implement GraphQL API" --phases="design,implement,test,document" --parallel="design+security"

# Conditional execution
orchestrate feature "user dashboard" --if-tests-pass --require-security-approval --parallel-limit=3

# Learning integration
orchestrate feature "payment integration" --use-cache --learn-from="previous-payment-features" --optimize-for="speed"
```

#### Constraints
- Maximum 6 parallel agents to prevent resource exhaustion
- Automatic checkpoint creation every 5 minutes during execution
- Fallback to sequential execution if parallel dependencies create deadlocks
- Generated agents are automatically archived after workflow completion

---

## Specialized Commands

### 1. add-feature
**File**: `commands/add-feature.md`
**Purpose**: Orchestrated feature implementation workflow
**Usage**: `add-feature "<short feature description>"`

**Orchestrated Process**:
```yaml
1. orchestrator: Coordinate feature development workflow
2. architect: Analyze impact and create implementation plan
3. validator-test-runner: Create failing tests using TDD approach
4. orchestrator: Generate appropriate builder agent for implementation language
5. builder-{language}: Implement minimal code to satisfy tests
6. code-reviewer: Review implementation for quality and security
7. security-scout: Perform security audit of new feature
8. validator-test-runner: Verify all tests pass and coverage is adequate
9. doc-scribe: Update documentation and changelog
10. orchestrator: Mark FEAT-<slug> as Done and update plan
```

**Agent Coordination**: Full orchestrator coordination with dynamic agent generation
**State Management**: Integrated with orchestrator state machine
**Parallel Execution**: Supported where dependencies allow

### 2. architect-bootstrap
**File**: `commands/architect-bootstrap.md`
**Purpose**: Bootstrap the orchestrator and initialize agent ecosystem
**Usage**: `architect-bootstrap "<short initialization note>"`

**Initialization Process**:
```yaml
1. Ensure MULTI_AGENT_PLAN.md exists with required sections
2. Verify core agents are available:
   - orchestrator (coordination and agent generation)
   - architect (system design and planning)
   - code-reviewer (quality and security review)
   - security-scout (vulnerability scanning)
   - validator-test-runner (test creation and execution)
   - doc-scribe (documentation generation)
3. Initialize orchestrator state management and communication bus
4. Create initial task backlog with 1-3 TASK blocks for immediate actions
5. Announce which agent should act first via orchestrator coordination
```

**Dependencies**: None (bootstrap command)
**Output**: Initialized orchestrator environment with core agents ready

### 3. fix-issue (Legacy)
**File**: `commands/fix-issue.md`
**Purpose**: Fix a bug or issue (non-orchestrated legacy command)
**Usage**: `fix-issue "<issue id or short description>"`

**Simple Process**:
```yaml
1. Summarize context and locate relevant files/traces
2. Reproduce locally; write failing regression test if not reproducible
3. Identify likely root cause (point to lines)
4. Implement minimal fix
5. Run tests; ensure regression covered
6. Lint/format
7. Update MULTI_AGENT_PLAN.md with concise fix summary
```

**Note**: This is a legacy command. For orchestrated bug fixes, use `orchestrate bugfix` instead.

### 4. full-review
**File**: `commands/full-review.md`
**Purpose**: Orchestrated comprehensive code review workflow
**Usage**: `full-review "<path or 'repo'>"`

**Orchestrated Review Process**:
```yaml
1. orchestrator: Coordinate multi-agent review process
2. code-reviewer: Analyze recent diffs for correctness, style, and quality
3. security-scout: Perform security vulnerability scan and audit
4. validator-test-runner: Check test coverage and quality
5. architect: Review architectural decisions and technical debt
6. orchestrator: Aggregate findings and prioritize issues
7. code-reviewer: Apply safe fixes for critical issues
8. doc-scribe: Generate comprehensive review report
9. orchestrator: Create follow-up tasks for non-blocking issues
```

**Agent Coordination**: Full orchestrator coordination with parallel execution
**Output**: Comprehensive review report with prioritized findings

### 5. init-new-project
**File**: `commands/init-new-project.md`
**Purpose**: Create a new project scaffold
**Usage**: `init-new-project "<project_name>" "<project_type: python|typescript|rust|web>"`

**Project Scaffolding Process**:
```yaml
1. Create folder {project_name} if missing; initialize minimal skeleton:
   - python: src/{project_name}/__init__.py, tests/, pyproject.toml
   - typescript: package.json, src/index.ts, test/, tsconfig.json
   - rust: Cargo.toml, src/lib.rs, tests/
   - web: index.html, src/main.ts, vite.config.ts
2. Add local test commands for the project type
3. Append INIT-{project_name} to MULTI_AGENT_PLAN.md with In Progress status
4. Print next steps for development
```

**Constraints**:
- No dependencies added without confirmation
- Minimal and runnable diffs
- Type-specific best practices applied

### 6. refactor-module (Legacy)
**File**: `commands/refactor-module.md`
**Purpose**: Refactor a module conservatively
**Usage**: `refactor-module "<path/to/module>"`

**Conservative Refactoring Process**:
```yaml
1. Snapshot behavior with tests if coverage is low
2. Apply small refactors without behavior change
3. Run tests; confirm no functional differences
4. Document improvements in MULTI_AGENT_PLAN.md (Scribe)
```

**Note**: This is a legacy command. For orchestrated refactoring, use `orchestrate custom` with refactoring requirements.

### 7. write-tests (Legacy)
**File**: `commands/write-tests.md`
**Purpose**: Author tests in TDD style
**Usage**: `write-tests "<path or feature id>"`

**TDD Process**:
```yaml
1. Inspect module or acceptance criteria
2. Create focused failing tests (happy path + key edges)
3. Run tests to confirm failure reason
4. Hand off to Builder; when notified, re-run and extend cases
```

**Note**: This is a legacy command. For orchestrated TDD, the `validator-test-runner` agent is automatically coordinated in orchestrated workflows.

---

## Command Classification

### Primary Orchestrated Commands
**Recommended for all new workflows**:
- `orchestrate` - Primary command for all complex workflows
- `add-feature` - Orchestrated feature development
- `architect-bootstrap` - System initialization
- `full-review` - Comprehensive code review

### Legacy Commands
**Maintained for backward compatibility**:
- `fix-issue` - Use `orchestrate bugfix` instead
- `refactor-module` - Use `orchestrate custom` instead
- `write-tests` - Integrated into orchestrated workflows

### Utility Commands
**Specialized purpose**:
- `init-new-project` - Project scaffolding

---

## Command Selection Guide

### For Feature Development
**Recommended**: `orchestrate feature "description"`
- Full TDD workflow with parallel execution
- Security audit integration
- Documentation generation
- State management and checkpoints

**Alternative**: `add-feature "description"`
- Simplified orchestrated workflow
- Good for smaller features

### For Bug Fixes
**Recommended**: `orchestrate bugfix "description"`
- Regression test creation
- Root cause analysis
- Security verification
- Automatic rollback on failure

**Legacy**: `fix-issue "description"`
- Simple, non-orchestrated approach
- No state management or recovery

### For Code Review
**Recommended**: `full-review "path"`
- Multi-agent comprehensive review
- Parallel execution of different review types
- Prioritized findings and automated fixes

### For System Setup
**Required**: `architect-bootstrap "note"`
- Initialize orchestrator environment
- Verify agent availability
- Set up communication bus

### For Performance Work
**Recommended**: `orchestrate performance "description"`
- Specialized performance agent generation
- Benchmarking and validation
- Optimization strategy design

### For Security Audits
**Recommended**: `orchestrate security "description"`
- Comprehensive security scanning
- Vulnerability prioritization
- Automated remediation planning

---

## Agent Coordination Patterns

### Orchestrator-Managed Commands
Commands that use full orchestrator coordination:
- `orchestrate` (all variants)
- `add-feature`
- `full-review`
- `architect-bootstrap`

**Features**:
- State machine management
- Dynamic agent generation
- Parallel execution optimization
- Checkpoint and recovery
- Inter-agent communication

### Legacy Commands
Commands with minimal or no orchestration:
- `fix-issue`
- `refactor-module`
- `write-tests`
- `init-new-project`

**Characteristics**:
- Simple sequential execution
- No state management
- Limited agent coordination
- Manual workflow management

---

## Best Practices

### Command Selection
1. **Use orchestrated commands** for complex, multi-step workflows
2. **Start with architect-bootstrap** for new environments
3. **Leverage orchestrate variants** for specialized workflows
4. **Use legacy commands** only for simple, isolated tasks

### Workflow Optimization
1. **Enable parallel execution** for independent tasks
2. **Use checkpoints** for long-running workflows
3. **Monitor agent communication** for coordination issues
4. **Leverage dynamic agent generation** for specialized requirements

### Error Handling
1. **Use rollback capabilities** when available
2. **Monitor state transitions** for debugging
3. **Check agent logs** for coordination issues
4. **Fallback to sequential execution** if parallel fails

### Performance Considerations
1. **Limit parallel agents** to prevent resource exhaustion
2. **Use caching** for repeated patterns
3. **Monitor resource usage** during execution
4. **Optimize agent selection** based on capability matrix

---

## Future Enhancements

### Planned Command Features
- Template marketplace for custom workflows
- Machine learning optimization for agent selection
- Advanced conditional execution patterns
- Integration with external CI/CD systems

### Command Development Guidelines
1. **Integrate with orchestrator** for new commands
2. **Follow state management patterns** for consistency
3. **Support parallel execution** where applicable
4. **Include error recovery strategies** for robustness
5. **Document agent coordination** for maintainability

This command system provides a comprehensive foundation for orchestrated development workflows with sophisticated coordination, state management, and dynamic agent generation capabilities.