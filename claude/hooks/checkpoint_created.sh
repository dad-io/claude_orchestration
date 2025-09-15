#!/usr/bin/env bash
set -euo pipefail

# Orchestrator Checkpoint Hook: State Checkpoint Created
echo "[Hook] Orchestrator checkpoint created"

# Environment variables provided by orchestrator
WORKFLOW_ID="${WORKFLOW_ID:-unknown}"
CHECKPOINT_ID="${CHECKPOINT_ID:-unknown}"
CHECKPOINT_NAME="${CHECKPOINT_NAME:-unknown}"
CURRENT_PHASE="${CURRENT_PHASE:-unknown}"
ACTIVE_AGENTS="${ACTIVE_AGENTS:-}"

# Create checkpoint directory
mkdir -p ".claude/orchestrator/${WORKFLOW_ID}/checkpoints"

# Save checkpoint state
cat > ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}.json" << EOF
{
  "checkpoint_id": "${CHECKPOINT_ID}",
  "checkpoint_name": "${CHECKPOINT_NAME}",
  "workflow_id": "${WORKFLOW_ID}",
  "created_at": "$(date -Iseconds)",
  "phase": "${CURRENT_PHASE}",
  "active_agents": "$(echo "${ACTIVE_AGENTS}" | tr ',' '\n' | jq -R . | jq -s .)",
  "state_snapshot": {}
}
EOF

# Copy current workflow state to checkpoint
if [[ -f ".claude/orchestrator/${WORKFLOW_ID}/state.json" ]]; then
    if command -v jq >/dev/null 2>&1; then
        # Merge current state into checkpoint
        jq --slurpfile state ".claude/orchestrator/${WORKFLOW_ID}/state.json" \
           '.state_snapshot = $state[0]' \
           ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}.json" > \
           ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}.json.tmp" && \
           mv ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}.json.tmp" \
              ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}.json"
    else
        # Fallback: copy state file
        cp ".claude/orchestrator/${WORKFLOW_ID}/state.json" \
           ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}-state.json"
    fi
fi

# Archive agent states at checkpoint
if [[ -d ".claude/orchestrator/${WORKFLOW_ID}/agents" ]]; then
    mkdir -p ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}-agents"
    cp -r ".claude/orchestrator/${WORKFLOW_ID}/agents/"* \
          ".claude/orchestrator/${WORKFLOW_ID}/checkpoints/${CHECKPOINT_ID}-agents/" 2>/dev/null || true
fi

# Log checkpoint creation
echo "$(date -Iseconds): Checkpoint created - ${CHECKPOINT_NAME} (${CHECKPOINT_ID}) at phase ${CURRENT_PHASE}" >> ".claude/orchestrator/${WORKFLOW_ID}/checkpoints.log"

# Update main state with checkpoint reference
if [[ -f ".claude/orchestrator/${WORKFLOW_ID}/state.json" ]] && command -v jq >/dev/null 2>&1; then
    jq --arg checkpoint_id "$CHECKPOINT_ID" \
       --arg checkpoint_name "$CHECKPOINT_NAME" \
       '.checkpoints += [{"id": $checkpoint_id, "name": $checkpoint_name, "created_at": now | strftime("%Y-%m-%dT%H:%M:%SZ")}] | .last_checkpoint = $checkpoint_id' \
       ".claude/orchestrator/${WORKFLOW_ID}/state.json" > ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" && \
       mv ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" ".claude/orchestrator/${WORKFLOW_ID}/state.json"
fi

# Cleanup old checkpoints (keep last 10)
cd ".claude/orchestrator/${WORKFLOW_ID}/checkpoints" 2>/dev/null && \
ls -t *.json 2>/dev/null | tail -n +11 | xargs rm -f 2>/dev/null || true

echo "[Hook] Checkpoint ${CHECKPOINT_NAME} (${CHECKPOINT_ID}) saved for workflow ${WORKFLOW_ID}"
exit 0