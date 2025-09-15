Fix a bug or issue.

$ARGUMENTS: "<issue id or short description>"

Steps:
1) Summarize context. If ID, locate relevant files/traces.
2) Reproduce locally; if not reproducible yet, write a failing regression test.
3) Identify likely root cause (point to lines).
4) Implement minimal fix.
5) Run tests; ensure regression covered.
6) Lint/format.
7) Update `MULTI_AGENT_PLAN.md` with a concise fix summary.
