#!/usr/bin/env bash
set -euo pipefail
msg="${1:-Claude paused for input}"
echo "[Hook] Notification: ${msg}"
if command -v osascript >/dev/null 2>&1; then
  osascript -e "display notification \"${msg}\" with title \"Claude Code\""
fi
exit 0
