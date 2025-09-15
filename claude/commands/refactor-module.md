Refactor a module conservatively.

$ARGUMENTS: "<path/to/module>"

Steps:
1) Snapshot behavior with tests if coverage is low.
2) Apply small refactors without behavior change.
3) Run tests; confirm no functional diff.
4) Document improvements in `MULTI_AGENT_PLAN.md` (Scribe).
