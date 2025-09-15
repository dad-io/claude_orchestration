#!/usr/bin/env bash
set -euo pipefail

# Agent Lifecycle Hook: Dynamic Agent Generation
echo "[Hook] Dynamic agent generated"

# Environment variables provided by orchestrator
WORKFLOW_ID="${WORKFLOW_ID:-unknown}"
AGENT_NAME="${AGENT_NAME:-unknown}"
AGENT_TYPE="${AGENT_TYPE:-unknown}"
AGENT_DOMAIN="${AGENT_DOMAIN:-unknown}"
GENERATION_TIME="${GENERATION_TIME:-unknown}"

# Create agent record
mkdir -p ".claude/orchestrator/${WORKFLOW_ID}/agents"

cat > ".claude/orchestrator/${WORKFLOW_ID}/agents/${AGENT_NAME}.json" << EOF
{
  "agent_name": "${AGENT_NAME}",
  "agent_type": "${AGENT_TYPE}",
  "domain": "${AGENT_DOMAIN}",
  "generated_at": "$(date -Iseconds)",
  "generation_time": "${GENERATION_TIME}",
  "workflow_id": "${WORKFLOW_ID}",
  "status": "generated",
  "capabilities": [],
  "tasks_assigned": [],
  "tasks_completed": []
}
EOF

# Log agent generation
echo "$(date -Iseconds): Agent generated - ${AGENT_NAME} (${AGENT_TYPE}/${AGENT_DOMAIN}) in ${GENERATION_TIME}" >> ".claude/orchestrator/${WORKFLOW_ID}/agent_lifecycle.log"

# Update workflow state with new agent
if [[ -f ".claude/orchestrator/${WORKFLOW_ID}/state.json" ]] && command -v jq >/dev/null 2>&1; then
    jq --arg agent "$AGENT_NAME" \
       '.generated_agents += [$agent] | .total_agents_generated += 1' \
       ".claude/orchestrator/${WORKFLOW_ID}/state.json" > ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" && \
       mv ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" ".claude/orchestrator/${WORKFLOW_ID}/state.json"
fi

# Register agent in communication system
mkdir -p ".claude/orchestrator/${WORKFLOW_ID}/messages/agents"
touch ".claude/orchestrator/${WORKFLOW_ID}/messages/agents/${AGENT_NAME}.queue"

echo "[Hook] Agent ${AGENT_NAME} registered and ready for activation"
exit 0