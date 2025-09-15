Resume interrupted workflows from checkpoints with state recovery.

$ARGUMENTS: [workflow_id]

## Usage

### Resume Interactive Selection
$USAGE: `orchestrate resume`

**Behavior:** Shows available workflows to resume with their progress and allows interactive selection.

**Sample Output:**
```
🔄 Available Workflows to Resume:

Active Workflows:
1. workflow-abc123 [EXECUTING - 60% complete]
   Type: feature development
   Task: "user authentication system"
   Last checkpoint: implementation_phase_complete
   Started: 2025-09-15 14:30:15
   Last activity: 3 minutes ago

2. workflow-def456 [PLANNING - 25% complete]
   Type: security audit
   Task: "comprehensive security review"
   Last checkpoint: analysis_phase_started
   Started: 2025-09-15 13:45:22
   Last activity: 45 minutes ago

Interrupted Workflows:
3. workflow-ghi789 [INTERRUPTED - 80% complete]
   Type: deployment
   Task: "production release v2.1"
   Last checkpoint: validation_complete
   Started: 2025-09-15 12:15:30
   Last activity: 2 hours ago
   Error: Agent timeout during final validation

Select workflow to resume [1-3]: _
```

### Resume Specific Workflow
$USAGE: `orchestrate resume [workflow_id]`

**Examples:**
- `orchestrate resume workflow-abc123` - Resume specific workflow by ID
- `orchestrate resume latest` - Resume the most recently active workflow

**Behavior:**
1. Validates workflow state and checkpoint integrity
2. Restores agent state and inter-agent communication queues
3. Resumes from last successful checkpoint
4. Continues execution with full state recovery

### Show Workflow Status
$USAGE: `orchestrate status`

**Output:** Comprehensive view of all workflow states:
```
📊 Orchestrator Status Dashboard

System State: ACTIVE (2 executing, 1 interrupted, 5 completed today)
Active Sessions: 2
Available Agents: 6 core + 3 dynamic

🟢 Active Workflows:
┌──────────────┬─────────────────┬─────────────┬──────────────┬─────────────┐
│ Workflow ID  │ Type            │ Progress    │ Current Phase│ Last Update │
├──────────────┼─────────────────┼─────────────┼──────────────┼─────────────┤
│ workflow-123 │ feature dev     │ ████████ 75%│ validation   │ 2 min ago   │
│ workflow-456 │ security audit  │ ███     25% │ analysis     │ 45 min ago  │
└──────────────┴─────────────────┴─────────────┴──────────────┴─────────────┘

🟡 Interrupted Workflows:
┌──────────────┬─────────────────┬─────────────┬──────────────┬─────────────┐
│ Workflow ID  │ Type            │ Progress    │ Last Phase   │ Reason      │
├──────────────┼─────────────────┼─────────────┼──────────────┼─────────────┤
│ workflow-789 │ deployment      │ ████████ 80%│ validation   │ Agent timeout│
└──────────────┴─────────────────┴─────────────┴──────────────┴─────────────┘

🟢 Completed Today: 5 workflows (3 features, 1 bugfix, 1 deployment)
📈 Success Rate: 95% (19/20 workflows completed successfully)
⚡ Avg Completion Time: 23 minutes
```

## Resume Process Details

### State Recovery
The resume process performs comprehensive state restoration:

1. **Checkpoint Validation**
   - Verifies checkpoint integrity and consistency
   - Validates agent state snapshots
   - Checks dependency graph completeness

2. **Agent Restoration**
   - Recreates dynamic agents from saved configurations
   - Restores agent memory and context
   - Reestablishes inter-agent communication channels

3. **Workflow Continuation**
   - Resumes from last successful checkpoint
   - Validates current system state vs. saved state
   - Handles any environmental changes since interruption

4. **Error Recovery**
   - Automatically resolves common interruption causes
   - Retries failed operations with exponential backoff
   - Falls back to previous checkpoint if current state is corrupted

### Checkpoint Strategy
Checkpoints are automatically created at:
- Phase completion (mandatory)
- Every 5 minutes during long-running operations
- Before potentially destructive operations
- When agent state changes significantly
- On user request or system shutdown

### Resume Modes

#### Standard Resume
- Continues from last checkpoint
- Validates all agent states
- Full error checking and recovery

#### Fast Resume
$USAGE: `orchestrate resume [workflow_id] --fast`
- Minimal state validation
- Assumes clean interruption
- Faster startup time

#### Safe Resume
$USAGE: `orchestrate resume [workflow_id] --safe`
- Extra validation and rollback checks
- Conservative continuation strategy
- Recommended for critical workflows

#### Rollback Resume
$USAGE: `orchestrate resume [workflow_id] --rollback [checkpoint_id]`
- Resume from specific earlier checkpoint
- Useful when recent work needs to be discarded
- Maintains audit trail of rollback reason

## Advanced Features

### Resume with Modifications
$USAGE: `orchestrate resume [workflow_id] --modify`

**Capabilities:**
- Change workflow parameters mid-execution
- Add or remove agent requirements
- Adjust parallel execution limits
- Update target specifications

### Resume Notifications
- System automatically prompts for resume when starting new session with interrupted workflows
- Configurable notifications for long-running workflows
- Integration with Claude Code session management

### Resume Analytics
- Track resume success rates and common interruption patterns
- Identify workflow phases most prone to interruption
- Optimize checkpoint frequency based on historical data

## Directory Structure

Resume functionality uses the existing state management structure:
```
.claude/orchestrator/
├── active/
│   ├── workflow-abc123/
│   │   ├── state.json              # Current workflow state
│   │   ├── transitions.log         # State transition history
│   │   ├── checkpoints/           # State snapshots
│   │   │   ├── phase_1_complete.json
│   │   │   ├── phase_2_complete.json
│   │   │   └── latest.json
│   │   ├── agents/                # Agent state and communication
│   │   │   ├── orchestrator.json
│   │   │   ├── architect.json
│   │   │   └── builder-python.json
│   │   └── messages/              # Inter-agent message queues
├── interrupted/                    # Failed or interrupted workflows
└── completed/                     # Successfully completed workflows
```

## Error Handling

### Common Resume Scenarios
1. **Clean Interruption**: Claude Code session ended normally
   - Fast resume with state validation
   - Continue from last checkpoint

2. **System Crash**: Unexpected termination
   - Safe resume with full validation
   - Rollback to last known good state if necessary

3. **Agent Failure**: Specific agent encountered error
   - Regenerate failed agent
   - Resume from checkpoint before agent failure

4. **Environment Changes**: System state changed since interruption
   - Detect and adapt to changes
   - Update workflow parameters as needed

5. **Corrupted State**: Checkpoint or state files damaged
   - Automatic rollback to previous checkpoint
   - Graceful degradation with user notification

This functionality provides robust workflow continuity and enables long-running orchestrated processes to survive interruptions while maintaining full state consistency.