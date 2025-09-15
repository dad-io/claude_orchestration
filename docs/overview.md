# System Overview

This document provides a comprehensive overview of the Claude Code orchestration system, explaining how all components integrate to provide sophisticated multi-agent collaborative development.

## System Architecture

### Core Philosophy

The system implements a **dynamic multi-agent orchestration architecture** designed for collaborative software development. It features:

- **Central Orchestrator**: Coordinates all agent activities with state management
- **Core Agent Ecosystem**: Essential agents for fundamental development tasks
- **Dynamic Agent Generation**: On-demand creation of specialized agents
- **Template-Driven Workflows**: Standardized processes for common tasks
- **Sophisticated State Management**: Checkpoints, rollbacks, and recovery
- **Claude Code Integration**: Seamless integration with Claude Code hooks

### Component Integration

```
┌─────────────────────────────────────────────────────────────┐
│                    Claude Code Interface                     │
├─────────────────────────────────────────────────────────────┤
│                     Hook System                             │
│  SessionStart → PreToolUse → PostToolUse → Notification     │
│                  ↓                                          │
├─────────────────────────────────────────────────────────────┤
│                  Orchestrator Core                          │
│  State: IDLE → PLANNING → EXECUTING → COMPLETED             │
│  Features: Learning, Parallel Execution, Agent Generation   │
│                  ↓                                          │
├─────────────────────────────────────────────────────────────┤
│              Core Agent Ecosystem                           │
│  architect → code-reviewer → security-scout                 │
│  validator-test-runner ↔ doc-scribe                        │
│                  ↓                                          │
├─────────────────────────────────────────────────────────────┤
│             Dynamic Agent Generation                        │
│  builder-{language} | {specialty}-specialist               │
│                  ↓                                          │
├─────────────────────────────────────────────────────────────┤
│              Template System                                │
│  fix.yaml → build.yaml → deploy.yaml → analyze.yaml        │
└─────────────────────────────────────────────────────────────┘
```

## Agent Ecosystem

### Core Agents (Always Available)

1. **orchestrator** - Central coordinator
   - State management and workflow orchestration
   - Dynamic agent generation and lifecycle management
   - Learning from execution patterns
   - Parallel task scheduling and dependency resolution

2. **architect** - System designer
   - Architecture design and technical planning
   - Component relationship analysis
   - Technical debt assessment
   - Implementation strategy development

3. **code-reviewer** - Quality assurance
   - Code quality and security analysis
   - Best practices enforcement
   - Performance review
   - Test coverage assessment

4. **security-scout** - Security specialist
   - Vulnerability scanning and auditing
   - Dependency security analysis
   - OWASP compliance checking
   - Secrets detection

5. **validator-test-runner** - Testing specialist
   - Test-driven development implementation
   - Test creation and execution
   - Coverage analysis and quality assurance
   - Multi-language test framework support

6. **doc-scribe** - Documentation specialist
   - API documentation generation
   - User guide creation
   - Changelog maintenance
   - Code commenting

### Dynamic Agents (Generated On-Demand)

**Builder Template**: `builder-{language}`
- Language-specific implementation specialists
- Supported: Python, TypeScript, Rust, Web
- Framework integration and best practices
- Automatic formatting and testing

**Specialist Template**: `{specialty}-specialist`
- Domain expertise agents
- Performance optimization, API design, deployment
- Infrastructure management, monitoring setup
- Custom agents from natural language descriptions

### Agent Communication

The system uses a sophisticated communication matrix:
- **Message Bus**: Centralized communication system
- **Event-Driven Coordination**: Trigger-based workflow progression
- **Status Reporting**: Real-time progress and error notifications
- **Context Sharing**: Shared knowledge base for coordination

## Template System (v2.0)

### Available Templates

1. **analyze.yaml** - Comprehensive codebase analysis
   - Security, quality, and performance audits
   - Parallel execution with multiple specialist agents
   - Detailed reporting and recommendations

2. **build.yaml** - Feature development
   - TDD workflow with quality gates
   - Interactive requirements gathering
   - Language detection and builder generation

3. **deploy.yaml** - Production deployment
   - Comprehensive validation and safety checks
   - Configuration generation and documentation
   - Rollback procedures and monitoring setup

4. **document.yaml** - Documentation generation
   - API reference and user guide creation
   - Code documentation and examples
   - Architecture and developer guides

5. **fix.yaml** - Issue resolution
   - Systematic bug fixing with regression tests
   - Root cause analysis and validation
   - Security verification and documentation

6. **improve.yaml** - Code quality enhancement
   - Refactoring and optimization
   - Performance improvements
   - Security hardening and test coverage

7. **report.yaml** - Status reporting
   - Project metrics and visualizations
   - Progress tracking and KPI analysis
   - Executive summaries and recommendations

8. **research.yaml** - Planning and architecture
   - Problem analysis and solution research
   - Architecture design and risk assessment
   - Technology evaluation and decision support

### Template Integration Features

- **Orchestration Compatible**: Full orchestrator integration
- **Dynamic Agent Generation**: Automatic specialist creation
- **State Management**: Checkpoints and rollback capabilities
- **Parallel Execution**: Optimized concurrent processing
- **Error Recovery**: Graceful handling and fallback strategies

## Command System

### Primary Command: orchestrate

The main interface for complex multi-agent workflows:

```bash
# Feature development
orchestrate feature "user authentication system"

# Bug resolution
orchestrate bugfix "payment processing error"

# Security audit
orchestrate security "comprehensive security review"

# Performance optimization
orchestrate performance "optimize API response times"

# Template usage
orchestrate template fix "authentication bug"
```

### Specialized Commands

- **add-feature**: Orchestrated feature development
- **architect-bootstrap**: System initialization
- **full-review**: Comprehensive code review
- **init-new-project**: Project scaffolding

### Legacy Commands (Maintained for Compatibility)

- **fix-issue**: Simple bug fixing (use `orchestrate bugfix` instead)
- **refactor-module**: Basic refactoring (use `orchestrate custom` instead)
- **write-tests**: Test creation (integrated into orchestrated workflows)

## Hook System

### Core Claude Code Hooks

- **session_start.sh**: Initialize session environment
- **pre_tool_guard.sh**: Security guards for dangerous operations
- **post_edit_format.sh**: Automatic code formatting and linting
- **notify_pause.sh**: System notifications for user input
- **stop_signal.sh**: Session cleanup and state preservation

### Orchestrator Lifecycle Hooks

- **orchestrator_planning.sh**: IDLE → PLANNING transition
- **orchestrator_executing.sh**: PLANNING → EXECUTING transition
- **orchestrator_completed.sh**: EXECUTING → COMPLETED transition
- **agent_generated.sh**: Dynamic agent creation tracking
- **checkpoint_created.sh**: Workflow state snapshots

### Hook Environment Variables

All orchestrator hooks receive comprehensive environment data:
```bash
ORCHESTRATOR_STATE=EXECUTING
WORKFLOW_ID=workflow-1234567
CURRENT_PHASE=implementation
ACTIVE_AGENTS=architect,builder-python
CHECKPOINT_ID=checkpoint-abc123
```

## State Management

### Workflow States

```
IDLE → PLANNING → EXECUTING → COMPLETED
  ↑                              ↓
  └──────── Error Recovery ──────┘
```

### Features

- **Checkpoints**: Automatic state snapshots at key milestones
- **Resume Capability**: Restart from any checkpoint after interruption
- **Rollback Support**: Return to previous checkpoint on failure
- **Progress Tracking**: Real-time monitoring of workflow progression
- **Transaction Safety**: Atomic operations with rollback capability

### Directory Structure

```
.claude/
├── last_action.txt
└── orchestrator/
    ├── completed/
    └── {WORKFLOW_ID}/
        ├── state.json
        ├── transitions.log
        ├── dependencies.json
        ├── agents/
        ├── messages/
        └── checkpoints/
```

## Integration Patterns

### Claude Code Integration

1. **Hook Registration**: Map hooks to Claude Code events
2. **Session Lifecycle**: Automatic initialization and cleanup
3. **Tool Guards**: Security checks before dangerous operations
4. **Formatting Integration**: Automatic code formatting after edits
5. **Notification System**: User alerts for workflow events

### Workflow Integration

1. **Template Selection**: Match templates to task requirements
2. **Agent Coordination**: Orchestrator manages all agent interactions
3. **State Persistence**: Workflows survive session interruptions
4. **Error Recovery**: Automatic fallback and retry strategies
5. **Learning Integration**: Pattern recognition and optimization

## Performance Characteristics

### Targets

- **Agent Response Time**: < 30 seconds
- **Parallel Efficiency**: > 75%
- **Task Completion Rate**: > 95%
- **Cache Hit Rate**: > 40%
- **Agent Generation Time**: < 30 seconds

### Optimization Strategies

- **Intelligent Caching**: Common solutions and patterns
- **Parallel Execution**: Independent task coordination
- **Dynamic Scaling**: Agent pool management
- **Resource Management**: Memory and CPU optimization
- **Learning Optimization**: Pattern-based improvements

## Usage Patterns

### Getting Started

1. **Initialize**: `architect-bootstrap "project setup"`
2. **Choose Workflow**: Select appropriate template or orchestrate command
3. **Monitor Progress**: Use hooks and checkpoints for tracking
4. **Review Results**: Validate deliverables and learn from execution

### Best Practices

1. **Start with Templates**: Use standardized workflows for common tasks
2. **Leverage Orchestration**: Use `orchestrate` for complex multi-step tasks
3. **Monitor State**: Track workflow progress through hooks
4. **Use Checkpoints**: Save state for long-running workflows
5. **Review Patterns**: Learn from successful executions

### Troubleshooting

1. **Check State**: Review workflow state in `.claude/orchestrator/`
2. **Monitor Logs**: Examine transition logs and agent communication
3. **Use Checkpoints**: Resume from last successful state
4. **Review Dependencies**: Check agent coordination and dependencies
5. **Fallback Options**: Use sequential execution if parallel fails

This orchestration system provides a sophisticated foundation for collaborative development with advanced coordination, state management, and dynamic specialization capabilities.