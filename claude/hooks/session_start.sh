#!/usr/bin/env bash
set -euo pipefail
echo "[Hook] SessionStart: ensuring plan presence"
[[ -f "MULTI_AGENT_PLAN.md" ]] || echo "# Multi‑Agent Shared Plan & State" > MULTI_AGENT_PLAN.md
