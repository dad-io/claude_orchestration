#!/usr/bin/env bash
set -euo pipefail
echo "[Hook] PreToolUse: $*"
# Guard a few common footguns:
if echo " $* " | grep -Eq '\brm\s+-rf\s+/( |\Z)'; then
  echo "[Hook] Blocked dangerous command"
  exit 2
fi
exit 0
