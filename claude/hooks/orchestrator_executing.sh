#!/usr/bin/env bash
set -euo pipefail

# Orchestrator State Transition Hook: PLANNING → EXECUTING
echo "[Hook] Orchestrator transitioning to EXECUTING state"

# Environment variables provided by orchestrator
ORCHESTRATOR_STATE="${ORCHESTRATOR_STATE:-EXECUTING}"
WORKFLOW_ID="${WORKFLOW_ID:-unknown}"
CURRENT_PHASE="${CURRENT_PHASE:-unknown}"
ACTIVE_AGENTS="${ACTIVE_AGENTS:-}"
PARALLEL_LIMIT="${PARALLEL_LIMIT:-4}"

# Update workflow state
if [[ -f ".claude/orchestrator/${WORKFLOW_ID}/state.json" ]]; then
    # Update state using jq if available, fallback to manual update
    if command -v jq >/dev/null 2>&1; then
        jq --arg state "EXECUTING" \
           --arg phase "$CURRENT_PHASE" \
           --arg agents "$ACTIVE_AGENTS" \
           --arg exec_time "$(date -Iseconds)" \
           '.state = $state | .current_phase = $phase | .active_agents = ($agents | split(",")) | .execution_start_time = $exec_time' \
           ".claude/orchestrator/${WORKFLOW_ID}/state.json" > ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" && \
           mv ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" ".claude/orchestrator/${WORKFLOW_ID}/state.json"
    else
        # Fallback: append execution info
        echo "execution_start_time: $(date -Iseconds)" >> ".claude/orchestrator/${WORKFLOW_ID}/execution.log"
        echo "current_phase: ${CURRENT_PHASE}" >> ".claude/orchestrator/${WORKFLOW_ID}/execution.log"
        echo "active_agents: ${ACTIVE_AGENTS}" >> ".claude/orchestrator/${WORKFLOW_ID}/execution.log"
    fi
fi

# Log transition
echo "$(date -Iseconds): State transition to EXECUTING - Phase: ${CURRENT_PHASE}" >> ".claude/orchestrator/${WORKFLOW_ID}/transitions.log"

# Initialize execution monitoring
cat > ".claude/orchestrator/${WORKFLOW_ID}/execution_monitor.sh" << 'EOF'
#!/usr/bin/env bash
# Monitor execution progress
WORKFLOW_ID="$1"
while [[ -f ".claude/orchestrator/${WORKFLOW_ID}/executing.flag" ]]; do
    echo "$(date -Iseconds): Monitoring workflow ${WORKFLOW_ID}" >> ".claude/orchestrator/${WORKFLOW_ID}/monitor.log"
    sleep 30
done
EOF

chmod +x ".claude/orchestrator/${WORKFLOW_ID}/execution_monitor.sh"

# Create execution flag
touch ".claude/orchestrator/${WORKFLOW_ID}/executing.flag"

# Start background monitor if not running
if ! pgrep -f "execution_monitor.sh ${WORKFLOW_ID}" >/dev/null; then
    ".claude/orchestrator/${WORKFLOW_ID}/execution_monitor.sh" "${WORKFLOW_ID}" &
fi

# Initialize resource monitoring
echo "parallel_limit: ${PARALLEL_LIMIT}" > ".claude/orchestrator/${WORKFLOW_ID}/resources.conf"
echo "active_agents_count: $(echo "${ACTIVE_AGENTS}" | tr ',' '\n' | wc -l)" >> ".claude/orchestrator/${WORKFLOW_ID}/resources.conf"

echo "[Hook] Execution state initialized for workflow ${WORKFLOW_ID}, phase: ${CURRENT_PHASE}"
exit 0