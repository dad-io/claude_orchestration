Bootstrap the orchestrator and initialize agent ecosystem.

$ARGUMENTS: "<short initialization note>"

Steps:
1) Ensure `MULTI_AGENT_PLAN.md` exists with sections: Backlog, Active, Decisions Log, per-agent Reports.
2) Verify core agents are available in `agents/`:
   - orchestrator (coordination and agent generation)
   - architect (system design and planning)
   - code-reviewer (quality and security review)
   - security-scout (vulnerability scanning)
   - validator-test-runner (test creation and execution)
   - doc-scribe (documentation generation)
3) Initialize orchestrator state management and communication bus.
4) Create initial task backlog with 1-3 **TASK** blocks for immediate actions.
5) Announce which agent should act first via orchestrator coordination.
