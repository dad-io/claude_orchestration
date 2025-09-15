#!/usr/bin/env bash
set -euo pipefail

# Orchestrator State Transition Hook: IDLE → PLANNING
echo "[Hook] Orchestrator transitioning to PLANNING state"

# Environment variables provided by orchestrator
ORCHESTRATOR_STATE="${ORCHESTRATOR_STATE:-PLANNING}"
WORKFLOW_ID="${WORKFLOW_ID:-unknown}"
WORKFLOW_TYPE="${WORKFLOW_TYPE:-unknown}"
REQUESTED_AGENTS="${REQUESTED_AGENTS:-}"

# Create orchestrator working directory
mkdir -p ".claude/orchestrator/${WORKFLOW_ID}"

# Initialize workflow state file
cat > ".claude/orchestrator/${WORKFLOW_ID}/state.json" << EOF
{
  "workflow_id": "${WORKFLOW_ID}",
  "workflow_type": "${WORKFLOW_TYPE}",
  "state": "PLANNING",
  "start_time": "$(date -Iseconds)",
  "requested_agents": "${REQUESTED_AGENTS}",
  "phases": [],
  "checkpoints": [],
  "active_agents": []
}
EOF

# Log transition
echo "$(date -Iseconds): State transition to PLANNING" >> ".claude/orchestrator/${WORKFLOW_ID}/transitions.log"

# Create agent communication directory
mkdir -p ".claude/orchestrator/${WORKFLOW_ID}/agents"
mkdir -p ".claude/orchestrator/${WORKFLOW_ID}/messages"

# Initialize dependency graph
cat > ".claude/orchestrator/${WORKFLOW_ID}/dependencies.json" << EOF
{
  "phases": [],
  "dependencies": {},
  "parallel_groups": []
}
EOF

echo "[Hook] Planning state initialized for workflow ${WORKFLOW_ID}"
exit 0