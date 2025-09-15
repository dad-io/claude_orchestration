#!/usr/bin/env bash
set -euo pipefail
date +"%Y-%m-%dT%H:%M:%S" > .claude/last_action.txt
echo "[Hook] Stop: updated .claude/last_action.txt"
exit 0
