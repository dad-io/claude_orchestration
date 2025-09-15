# Hook Scripts

Map these scripts to Claude Code Hook events:
- `session_start.sh` → SessionStart
- `pre_tool_guard.sh` → PreToolUse
- `post_edit_format.sh` → PostToolUse (after `Edit`)
- `notify_pause.sh` → Notification
- `stop_signal.sh` → Stop

Keep hooks fast and idempotent.
