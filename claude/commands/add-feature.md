Orchestrated feature implementation workflow.

$ARGUMENTS: "<short feature description>"

Process:
1) Invoke **orchestrator** to coordinate feature development workflow.
2) **architect**: Analyze impact and create implementation plan.
3) **validator-test-runner**: Create failing tests using TDD approach.
4) **orchestrator**: Generate appropriate builder agent for implementation language.
5) **builder-{language}**: Implement minimal code to satisfy tests.
6) **code-reviewer**: Review implementation for quality and security.
7) **security-scout**: Perform security audit of new feature.
8) **validator-test-runner**: Verify all tests pass and coverage is adequate.
9) **doc-scribe**: Update documentation and changelog.
10) **orchestrator**: Mark FEAT-<slug> as Done and update plan.
