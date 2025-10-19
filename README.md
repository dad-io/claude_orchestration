## Overview

This is a Claude Code orchestration system featuring a **dynamic multi-agent architecture** for collaborative development. The system includes a core set of essential agents, dynamic agent generation capabilities, sophisticated workflow orchestration, and comprehensive state management.

## Common Development Commands

This orchestration system operates entirely through command scripts - no traditional build tools like npm/cargo/make are used.

### Primary Orchestration Commands
```bash
# Main workflow orchestration (most common)
orchestrate feature "feature description"        # Full TDD feature development
orchestrate bugfix "bug description"             # Systematic bug resolution
orchestrate security "security audit"            # Comprehensive security review
orchestrate performance "optimization task"      # Performance improvements

# Template-based workflows
orchestrate template build "task"                # Feature development workflow
orchestrate template fix "issue"                 # Issue resolution workflow
orchestrate template deploy "deployment"         # Production deployment workflow
orchestrate template analyze "analysis"          # Code analysis workflow

# System management
orchestrate list                                  # List available templates (new)
orchestrate status                               # Show active workflows (new)
orchestrate resume [workflow-id]                 # Resume interrupted workflow (new)
```

### Specialized Commands
```bash
# System initialization
architect-bootstrap "project setup"              # Initialize orchestrator and agents

# Direct agent workflows
add-feature "feature description"                 # Orchestrated feature development
fix-issue "issue description"                     # Coordinated bug resolution
full-review                                       # Multi-agent code review
write-tests "test requirements"                   # TDD test development

# Project scaffolding
init-new-project "project description"           # Multi-language project setup
```

### Hook Integration
The system integrates with Claude Code through hook scripts in `hooks/`:
- Session lifecycle management through `session_start.sh`
- Code formatting via `post_edit_format.sh`
- Security guards through `pre_tool_guard.sh`
- Orchestrator state transitions via `orchestrator_*.sh`

## Architecture

### Core Components

- **Orchestrator** (`orchestrator.md`): Central coordinator with state management, learning capabilities, parallel execution, and dynamic agent generation
- **Core Agent Ecosystem** (`agents/`): Essential agents for fundamental development tasks
- **Capability Matrix** (`agents/capability_matrix.yaml`): Comprehensive agent capability definitions and coordination patterns
- **Command Templates** (`commands/`): Orchestrated workflow definitions with multi-agent coordination
- **Templates** (`templates/`): Reusable workflow templates with phases and deliverables
- **Hooks** (`hooks/`): Claude Code integration scripts for session events

### Agent Ecosystem

#### Core Agents (Always Available)
Essential agents that form the foundation of the orchestration system:

- **orchestrator**: Central coordinator with agent generation, state management, and workflow orchestration
- **architect**: System design, technical planning, and architecture assessment
- **code-reviewer**: Code quality review, security analysis, and best practices enforcement
- **security-scout**: Vulnerability scanning, dependency auditing, and security compliance
- **validator-test-runner**: Test creation, execution, and quality assurance (TDD specialist)
- **doc-scribe**: Documentation generation, API docs, and changelog maintenance

#### Dynamic Agents (Generated On-Demand)
Specialized agents created by the orchestrator when needed:

- **builder-{language}**: Language-specific implementation (Python, TypeScript, Rust, Web)
- **{domain}-specialist**: Domain expertise agents (performance, API design, deployment, etc.)
- **{task}-optimizer**: Task-specific optimization agents

#### Archived Agents (`agents/_archive/`)
Previously used agents that can be reactivated when needed:
- Language builders, game-specific agents, and other specialized tools

### Orchestrated Workflow Templates

Templates are now fully integrated with the orchestrator for coordinated execution:

#### Template Structure (v2.0)
All templates now include orchestration metadata:
```yaml
name: Template Name
version: 2.0
orchestration_compatible: true
coordination: orchestrator
required_core_agents: [orchestrator, architect, security-scout]
dynamic_agents:
  - type: builder
    language: "${detected_language}"
    generate_if_missing: true

orchestrator_workflow:
  state_machine: true
  checkpoints: [analysis_complete, implementation_done]
  error_recovery: true
  parallel_optimization: true
```

#### Key Orchestrated Templates:
- **`fix.yaml`**: Issue resolution with TDD and security validation
- **`deploy.yaml`**: Production deployment with validation gates
- **`build.yaml`**: Feature development with parallel coordination
- **`analyze.yaml`**: Comprehensive code analysis with multiple agents
- **`research.yaml`**: Planning and architecture with decision matrices
- **`improve.yaml`**: Code quality improvement with metrics tracking
- **`document.yaml`**: Documentation generation with API specs
- **`report.yaml`**: Status reporting with visualization

#### Template Integration Features:
- **Dynamic Agent Generation**: Templates specify agent requirements, orchestrator creates them
- **Dependency Management**: Automatic phase ordering and parallel execution
- **State Management**: Checkpoints and rollback capabilities
- **Error Recovery**: Fallback strategies and graceful degradation
- **Progress Tracking**: Real-time monitoring and completion notifications

## Development Commands

### Primary Command: Orchestrate
The main interface for coordinating complex multi-agent workflows:

```bash
# Feature development with full coordination
orchestrate feature "user authentication system"

# Bug resolution workflow
orchestrate bugfix "payment processing error in checkout"

# Comprehensive security audit
orchestrate security "comprehensive security review"

# Performance optimization workflow
orchestrate performance "optimize API response times"

# Custom workflow with dynamic agent generation
orchestrate custom "deploy microservice with monitoring"

# Use templates directly with orchestration
orchestrate template fix "payment processing bug"
orchestrate template deploy "production release v2.1"
orchestrate template analyze "security audit Q4"
```

The orchestrate command provides:
- **Multi-phase execution** with dependency management
- **Parallel agent coordination** for optimal efficiency
- **Dynamic agent generation** for specialized requirements
- **State management** with checkpoints and resume capability
- **Real-time monitoring** and progress tracking
- **Template integration** for standardized workflows

### Orchestrated Commands
All commands now leverage the orchestrator for coordination:

- **architect-bootstrap.md**: Initialize orchestrator and agent ecosystem
- **add-feature.md**: Orchestrated feature development with TDD workflow
- **fix-issue.md**: Coordinated bug resolution with regression testing
- **full-review.md**: Multi-agent comprehensive code review
- **refactor-module.md**: Safe refactoring with validation
- **write-tests.md**: TDD test development workflow
- **init-new-project.md**: Project scaffolding for multiple languages

### Hook Scripts
Map these scripts to Claude Code Hook events:

#### Core Claude Code Hooks:
- `session_start.sh` → SessionStart
- `pre_tool_guard.sh` → PreToolUse
- `post_edit_format.sh` → PostToolUse (after `Edit`)
- `notify_pause.sh` → Notification
- `stop_signal.sh` → Stop

#### Orchestrator Lifecycle Hooks:
- `orchestrator_planning.sh` → Orchestrator state: IDLE → PLANNING
- `orchestrator_executing.sh` → Orchestrator state: PLANNING → EXECUTING
- `orchestrator_completed.sh` → Orchestrator state: EXECUTING → COMPLETED
- `agent_generated.sh` → Dynamic agent creation
- `checkpoint_created.sh` → Workflow checkpoint save

#### Hook Environment Variables:
All orchestrator hooks receive these environment variables:
```bash
ORCHESTRATOR_STATE=EXECUTING
WORKFLOW_ID=workflow-1234567
CURRENT_PHASE=implementation
ACTIVE_AGENTS=architect,builder-python
CHECKPOINT_ID=checkpoint-abc123
```

## Working with the System

### Capability Matrix (`agents/capability_matrix.yaml`)
The capability matrix defines:
- **Agent capabilities and specializations** for each core agent
- **Communication patterns** between agents and message types
- **Coordination workflows** for common development tasks (feature development, bug fixes, security audits)
- **Dynamic agent templates** for on-demand generation
- **Performance targets** and optimization strategies

### State Management
The orchestrator provides sophisticated state management:
- **Checkpoint/resume functionality** with automatic save points
- **Session persistence** across restarts and interruptions
- **Transaction-like rollback** capability for error recovery
- **State transitions**: IDLE → PLANNING → EXECUTING → COMPLETED
- **Workflow monitoring** with real-time progress tracking

### Dynamic Agent Generation
The orchestrator can create specialized agents on-demand:
- **Language-specific builders**: `builder-python`, `builder-typescript`, `builder-rust`, `builder-web`
- **Domain specialists**: `performance-specialist`, `api-designer`, `deploy-specialist`
- **Custom agents**: Generated from natural language descriptions
- **Template-based creation**: Using predefined agent templates
- **Automatic lifecycle management**: Generated agents are archived after completion

### Parallel Execution & Coordination
Advanced coordination capabilities:
- **Dependency graph construction** for optimal task scheduling
- **Resource-aware parallel execution** with configurable limits
- **Inter-agent communication** via message bus and event system
- **Intelligent agent selection** based on task requirements
- **Load balancing** and dynamic scaling of agent pools

### Learning & Optimization
Continuous improvement through:
- **Pattern recognition** from past executions
- **Time prediction** with confidence scoring
- **Agent performance tracking** and optimization
- **Solution caching** for common problems
- **Workflow optimization** based on learned patterns

### Communication Patterns
Agents communicate through:
- **Message bus**: Centralized communication system
- **Event-driven coordination**: Trigger-based workflow progression
- **Status reporting**: Real-time progress and error notifications
- **Context sharing**: Shared knowledge base for coordination

## Integration Points

This system integrates with Claude Code through:
- **Hook integration** for session lifecycle management
- **Orchestrated workflows** for complex multi-step tasks
- **Dynamic agent creation** for specialized requirements
- **State persistence** across Claude Code sessions
- **Real-time monitoring** and progress feedback

## Development Patterns

### Working with Templates
1. **Use orchestrate template** for standardized workflows:
   ```bash
   orchestrate template fix "authentication bug"
   ```

2. **Customize templates** with workflow parameters:
   ```bash
   orchestrate template deploy "v2.1" --environment=production --confirm=true
   ```

3. **Monitor template execution** through hooks and checkpoints

### Extending the System
1. **Create custom templates** following v2.0 orchestration patterns
2. **Add specialized hooks** for specific workflow requirements
3. **Generate domain-specific agents** for unique project needs
4. **Use capability matrix** to understand agent coordination patterns

### Troubleshooting
1. **Check workflow state** in `.claude/orchestrator/[workflow-id]/`
2. **Review hook logs** for execution issues
3. **Monitor agent lifecycle** through generated logs
4. **Use checkpoints** to resume failed workflows

## Quick Start Guide

### Getting Started
1. **Initialize**: `architect-bootstrap "project setup"`
2. **Choose workflow**: Use appropriate template or orchestrate command
3. **Monitor progress**: Track execution through hooks and checkpoints
4. **Review results**: Validate deliverables and learn from execution

### Common Commands
```bash
# Initialize the system
architect-bootstrap "setting up project orchestration"

# Feature development (full TDD workflow)
orchestrate feature "user authentication system"
orchestrate template build "payment integration"

# Bug fixes with regression testing
orchestrate bugfix "checkout process error"
orchestrate template fix "authentication timeout issue"

# Code quality and security
orchestrate template analyze "comprehensive security audit"
orchestrate template improve "performance optimization"

# Documentation and deployment
orchestrate template document "API documentation update"
orchestrate template deploy "production release v2.1"

# Custom workflows
orchestrate custom "deploy microservice with monitoring"
orchestrate performance "optimize database queries"
```

### Template Selection Guide
- **New features**: `build.yaml` or `orchestrate feature`
- **Bug fixes**: `fix.yaml` or `orchestrate bugfix`
- **Code quality**: `improve.yaml` or `orchestrate custom`
- **Security audits**: `analyze.yaml` or `orchestrate security`
- **Documentation**: `document.yaml`
- **Deployment**: `deploy.yaml`
- **Planning**: `research.yaml`
- **Status reports**: `report.yaml`

## Project Structure

### Generated State Management
The system creates and manages these directories:
```
.claude/
├── last_action.txt                 # Session timestamps
└── orchestrator/
    ├── completed/                  # Archived successful workflows
    └── {WORKFLOW_ID}/
        ├── state.json              # Current workflow state
        ├── transitions.log         # State change history
        ├── dependencies.json       # Phase dependencies
        ├── agents/                 # Agent records and communication
        ├── messages/               # Inter-agent communication queues
        └── checkpoints/            # State snapshots for recovery
```

### Core Files to Understand
- `agents/capability_matrix.yaml`: Agent definitions and coordination patterns
- `templates/*.yaml`: Orchestrated workflow definitions
- `commands/*.md`: Available command documentation
- `hooks/*.sh`: Claude Code integration scripts
- `agents/*.md`: Individual agent specifications

## Best Practices

When working with this orchestration system:
1. **Start with templates** for common workflows (fix, deploy, analyze)
2. **Use orchestrate command** for complex multi-step tasks
3. **Leverage core agents** for fundamental operations
4. **Let the orchestrator generate** specialized agents as needed
5. **Monitor workflow progress** through hooks and state files
6. **Utilize checkpoints** for long-running workflows
7. **Review capability matrix** to understand agent relationships
8. **Archive successful workflows** for pattern learning

## Troubleshooting

### Common Issues
- **Workflow stuck**: Check `.claude/orchestrator/{workflow-id}/state.json`
- **Agent failures**: Review agent logs in `.claude/orchestrator/{workflow-id}/agents/`
- **Hook issues**: Examine execution logs and environment variables
- **State corruption**: Use latest checkpoint to resume workflow

### Recovery Commands
```bash
# View active workflows
ls .claude/orchestrator/

# Check workflow state
cat .claude/orchestrator/{workflow-id}/state.json

# Resume from checkpoint (if implementation exists)
orchestrate resume {workflow-id}
```