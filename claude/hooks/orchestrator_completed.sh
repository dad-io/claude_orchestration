#!/usr/bin/env bash
set -euo pipefail

# Orchestrator State Transition Hook: EXECUTING → COMPLETED
echo "[Hook] Orchestrator transitioning to COMPLETED state"

# Environment variables provided by orchestrator
ORCHESTRATOR_STATE="${ORCHESTRATOR_STATE:-COMPLETED}"
WORKFLOW_ID="${WORKFLOW_ID:-unknown}"
SUCCESS="${SUCCESS:-true}"
DURATION="${DURATION:-unknown}"
TOTAL_AGENTS="${TOTAL_AGENTS:-0}"

# Remove execution flag
rm -f ".claude/orchestrator/${WORKFLOW_ID}/executing.flag"

# Update workflow state
if [[ -f ".claude/orchestrator/${WORKFLOW_ID}/state.json" ]]; then
    if command -v jq >/dev/null 2>&1; then
        jq --arg state "COMPLETED" \
           --arg success "$SUCCESS" \
           --arg duration "$DURATION" \
           --arg end_time "$(date -Iseconds)" \
           '.state = $state | .success = ($success == "true") | .duration = $duration | .end_time = $end_time' \
           ".claude/orchestrator/${WORKFLOW_ID}/state.json" > ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" && \
           mv ".claude/orchestrator/${WORKFLOW_ID}/state.json.tmp" ".claude/orchestrator/${WORKFLOW_ID}/state.json"
    else
        # Fallback: append completion info
        echo "end_time: $(date -Iseconds)" >> ".claude/orchestrator/${WORKFLOW_ID}/completion.log"
        echo "success: ${SUCCESS}" >> ".claude/orchestrator/${WORKFLOW_ID}/completion.log"
        echo "duration: ${DURATION}" >> ".claude/orchestrator/${WORKFLOW_ID}/completion.log"
    fi
fi

# Log final transition
echo "$(date -Iseconds): State transition to COMPLETED - Success: ${SUCCESS}, Duration: ${DURATION}" >> ".claude/orchestrator/${WORKFLOW_ID}/transitions.log"

# Generate workflow summary
cat > ".claude/orchestrator/${WORKFLOW_ID}/summary.md" << EOF
# Workflow Summary

**Workflow ID:** ${WORKFLOW_ID}
**Status:** $([ "$SUCCESS" = "true" ] && echo "✅ COMPLETED" || echo "❌ FAILED")
**Duration:** ${DURATION}
**Total Agents Used:** ${TOTAL_AGENTS}
**Completed:** $(date -Iseconds)

## Files Generated
$(find ".claude/orchestrator/${WORKFLOW_ID}" -type f -name "*.log" -o -name "*.json" -o -name "*.md" | sed 's/^/- /')

## State Transitions
$(cat ".claude/orchestrator/${WORKFLOW_ID}/transitions.log" 2>/dev/null || echo "No transitions logged")
EOF

# Archive successful workflows
if [[ "$SUCCESS" = "true" ]]; then
    mkdir -p ".claude/orchestrator/completed"
    if command -v tar >/dev/null 2>&1; then
        tar -czf ".claude/orchestrator/completed/${WORKFLOW_ID}-$(date +%Y%m%d-%H%M%S).tar.gz" \
            -C ".claude/orchestrator" "${WORKFLOW_ID}" 2>/dev/null || true
    fi
fi

# Cleanup temporary files older than 24 hours
find ".claude/orchestrator" -name "*.tmp" -mtime +1 -delete 2>/dev/null || true

# Send completion notification if osascript available
if command -v osascript >/dev/null 2>&1; then
    if [[ "$SUCCESS" = "true" ]]; then
        osascript -e "display notification \"Workflow ${WORKFLOW_ID} completed successfully\" with title \"Orchestrator\""
    else
        osascript -e "display notification \"Workflow ${WORKFLOW_ID} failed\" with title \"Orchestrator\""
    fi
fi

echo "[Hook] Workflow ${WORKFLOW_ID} completed. Status: ${SUCCESS}, Duration: ${DURATION}"
exit 0