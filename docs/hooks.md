# Claude Code Hooks Documentation

This document provides a comprehensive overview of the Claude Code hook system implemented in this repository. The hooks provide lifecycle management for both core Claude Code operations and advanced orchestrator workflows.

## Overview

The hook system consists of two categories:
1. **Core Claude Code Hooks** - Basic session and tool lifecycle management
2. **Orchestrator Lifecycle Hooks** - Advanced multi-agent workflow coordination

All hooks are designed to be fast, idempotent, and provide extensive logging for debugging and monitoring.

## Core Claude Code Hooks

These hooks map directly to Claude Code Hook events and provide essential session management functionality.

### session_start.sh
**Event:** SessionStart
**Purpose:** Initialize session environment and ensure plan file presence

**Functionality:**
- Creates `MULTI_AGENT_PLAN.md` if it doesn't exist
- Provides a shared planning document for multi-agent coordination
- Ensures consistent session initialization

**Usage:**
```bash
#!/usr/bin/env bash
set -euo pipefail
echo "[Hook] SessionStart: ensuring plan presence"
[[ -f "MULTI_AGENT_PLAN.md" ]] || echo "# Multi‑Agent Shared Plan & State" > MULTI_AGENT_PLAN.md
```

### pre_tool_guard.sh
**Event:** PreToolUse
**Purpose:** Security guard against dangerous commands

**Functionality:**
- Blocks dangerous `rm -rf /` commands
- Provides safety checks before tool execution
- Returns exit code 2 to block dangerous operations
- Logs all tool use attempts for audit

**Safety Features:**
- Pattern matching for destructive filesystem operations
- Extensible guard system for additional safety checks

### post_edit_format.sh
**Event:** PostToolUse (after Edit operations)
**Purpose:** Automatic code formatting and linting

**Functionality:**
- **Python**: Runs `black` (formatting) and `ruff` (linting) if available
- **TypeScript/JavaScript**: Runs `prettier` (formatting) and `eslint` (linting)
- **Rust**: Runs `cargo fmt` (formatting) and `cargo clippy` (linting)
- **Package Manager Support**: Prefers `pnpm` over `npm` when available
- **Best-effort execution**: Continues on failures to avoid blocking development

**Language Detection:**
- Python: Detects `*.py` files
- JS/TS: Detects `package.json`
- Rust: Detects `Cargo.toml`

### notify_pause.sh
**Event:** Notification
**Purpose:** System notifications when Claude pauses for input

**Functionality:**
- Displays macOS notifications via `osascript`
- Customizable notification messages
- Graceful fallback if notification system unavailable
- Helps maintain awareness during long-running sessions

### stop_signal.sh
**Event:** Stop
**Purpose:** Session cleanup and state preservation

**Functionality:**
- Updates `.claude/last_action.txt` with timestamp
- Provides session termination logging
- Maintains audit trail of Claude Code usage

## Orchestrator Lifecycle Hooks

Advanced hooks for sophisticated multi-agent workflow coordination. These hooks receive environment variables from the orchestrator system.

### Environment Variables

All orchestrator hooks receive these environment variables:
```bash
ORCHESTRATOR_STATE=EXECUTING        # Current orchestrator state
WORKFLOW_ID=workflow-1234567        # Unique workflow identifier
CURRENT_PHASE=implementation        # Current workflow phase
ACTIVE_AGENTS=architect,builder-python  # Comma-separated active agents
CHECKPOINT_ID=checkpoint-abc123     # Checkpoint identifier
WORKFLOW_TYPE=feature_development   # Type of workflow
PARALLEL_LIMIT=4                    # Maximum parallel agents
```

### orchestrator_planning.sh
**State Transition:** IDLE → PLANNING
**Purpose:** Initialize workflow planning state

**Functionality:**
- Creates orchestrator working directory structure
- Initializes workflow state JSON with metadata
- Sets up agent communication directories
- Creates dependency graph structure
- Logs state transitions with timestamps

**Directory Structure Created:**
```
.claude/orchestrator/{WORKFLOW_ID}/
├── state.json              # Main workflow state
├── transitions.log         # State transition history
├── dependencies.json       # Phase dependency graph
├── agents/                 # Agent-specific data
└── messages/              # Inter-agent communication
```

### orchestrator_executing.sh
**State Transition:** PLANNING → EXECUTING
**Purpose:** Initialize workflow execution state

**Functionality:**
- Updates workflow state to EXECUTING
- Starts background execution monitoring
- Initializes resource management
- Creates execution flags and monitors
- Sets up parallel execution limits

**Features:**
- **jq Integration**: Uses `jq` for JSON manipulation when available
- **Background Monitoring**: Starts execution monitor process
- **Resource Tracking**: Monitors agent count and parallel limits
- **Fallback Logging**: Maintains logs even without `jq`

### orchestrator_completed.sh
**State Transition:** EXECUTING → COMPLETED
**Purpose:** Finalize workflow and cleanup

**Functionality:**
- Updates final workflow state with success/failure status
- Generates comprehensive workflow summary
- Archives successful workflows as compressed files
- Sends completion notifications
- Performs cleanup of temporary files

**Features:**
- **Summary Generation**: Creates markdown summary with metrics
- **Archive Management**: Compresses completed workflows
- **Notification System**: macOS notifications for completion status
- **Cleanup**: Removes files older than 24 hours

### agent_generated.sh
**Event:** Dynamic Agent Creation
**Purpose:** Track dynamically generated agents

**Functionality:**
- Creates agent record with metadata
- Logs agent generation with timing
- Updates workflow state with new agent count
- Sets up agent communication queue
- Registers agent in message bus

**Agent Record Structure:**
```json
{
  "agent_name": "builder-python",
  "agent_type": "builder",
  "domain": "python",
  "generated_at": "2024-01-15T10:30:00Z",
  "workflow_id": "workflow-1234567",
  "status": "generated",
  "capabilities": [],
  "tasks_assigned": [],
  "tasks_completed": []
}
```

### checkpoint_created.sh
**Event:** Workflow Checkpoint Creation
**Purpose:** Save workflow state snapshots

**Functionality:**
- Creates checkpoint directory structure
- Saves complete workflow state snapshot
- Archives agent states at checkpoint time
- Maintains checkpoint history (keeps last 10)
- Updates main workflow state with checkpoint reference

**Checkpoint Structure:**
```
.claude/orchestrator/{WORKFLOW_ID}/checkpoints/
├── {CHECKPOINT_ID}.json           # Checkpoint metadata
├── {CHECKPOINT_ID}-state.json     # State snapshot
└── {CHECKPOINT_ID}-agents/        # Agent state archive
```

## Configuration and Usage

### Hook Mapping
Configure these hooks in your Claude Code settings:

```yaml
hooks:
  SessionStart: ./hooks/session_start.sh
  PreToolUse: ./hooks/pre_tool_guard.sh
  PostToolUse: ./hooks/post_edit_format.sh
  Notification: ./hooks/notify_pause.sh
  Stop: ./hooks/stop_signal.sh
```

### Orchestrator Integration
Orchestrator hooks are triggered automatically during workflow execution:

```bash
# Trigger orchestrator workflow
orchestrate feature "user authentication system"

# Hooks are called automatically during state transitions:
# 1. orchestrator_planning.sh (IDLE → PLANNING)
# 2. agent_generated.sh (for each dynamic agent)
# 3. orchestrator_executing.sh (PLANNING → EXECUTING)
# 4. checkpoint_created.sh (at each checkpoint)
# 5. orchestrator_completed.sh (EXECUTING → COMPLETED)
```

## Directory Structure

The hooks create and maintain this directory structure:

```
.claude/
├── last_action.txt                 # Session timestamps
└── orchestrator/
    ├── completed/                  # Archived workflows
    └── {WORKFLOW_ID}/
        ├── state.json              # Current workflow state
        ├── transitions.log         # State change history
        ├── dependencies.json       # Phase dependencies
        ├── execution.log           # Execution details
        ├── summary.md              # Final workflow summary
        ├── agents/                 # Agent records
        │   └── {AGENT_NAME}.json
        ├── messages/               # Inter-agent communication
        │   └── agents/
        │       └── {AGENT_NAME}.queue
        └── checkpoints/            # State snapshots
            ├── {CHECKPOINT_ID}.json
            └── {CHECKPOINT_ID}-agents/
```

## Monitoring and Debugging

### Log Files
- **State Transitions**: `.claude/orchestrator/{WORKFLOW_ID}/transitions.log`
- **Agent Lifecycle**: `.claude/orchestrator/{WORKFLOW_ID}/agent_lifecycle.log`
- **Execution Monitor**: `.claude/orchestrator/{WORKFLOW_ID}/monitor.log`
- **Checkpoints**: `.claude/orchestrator/{WORKFLOW_ID}/checkpoints.log`

### State Inspection
View current workflow state:
```bash
# View workflow state
cat .claude/orchestrator/{WORKFLOW_ID}/state.json

# View agent records
ls .claude/orchestrator/{WORKFLOW_ID}/agents/

# View checkpoints
ls .claude/orchestrator/{WORKFLOW_ID}/checkpoints/
```

### Troubleshooting
- Check hook execution with `set -x` in scripts
- Monitor resource usage in `resources.conf`
- Review transition logs for state flow issues
- Examine agent communication queues for bottlenecks

## Best Practices

### Hook Development
1. **Use `set -euo pipefail`** for robust error handling
2. **Log all significant actions** with timestamps
3. **Provide fallback behavior** when tools are unavailable
4. **Use meaningful exit codes** (0=success, 2=blocked)
5. **Create idempotent operations** that can run multiple times safely

### State Management
1. **Use JSON for structured data** with `jq` for manipulation
2. **Maintain backwards compatibility** with fallback logging
3. **Archive successful workflows** for pattern learning
4. **Clean up temporary files** regularly
5. **Preserve audit trails** with comprehensive logging

### Performance
1. **Run hooks in parallel** when possible
2. **Use background processes** for monitoring
3. **Limit checkpoint retention** to avoid disk bloat
4. **Cache expensive operations** when appropriate
5. **Monitor resource usage** during execution

The hook system provides comprehensive lifecycle management for both basic Claude Code operations and advanced orchestrator workflows, enabling sophisticated multi-agent coordination while maintaining simplicity and reliability.