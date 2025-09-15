# Agent Documentation

This document provides comprehensive documentation for the multi-agent orchestration system, including core agents, dynamic agent generation, and coordination patterns.

## Overview

The agent ecosystem consists of two primary categories:

1. **Core Agents**: Essential agents that are always available and form the foundation of the orchestration system
2. **Dynamic Agents**: Specialized agents generated on-demand by the orchestrator when specific capabilities are needed

All agents operate under the coordination of the **orchestrator** agent, which manages task distribution, state management, and inter-agent communication.

## Core Agent Ecosystem

### 1. Orchestrator Agent (`orchestrator.md`)

**Priority**: 1 (Highest)
**Status**: Active
**Tools**: Read, Write, Edit, Grep, Glob, LS, Bash

#### Capabilities
- **orchestration**: System-wide coordination and task distribution
- **learning**: Pattern recognition and execution optimization
- **parallel_execution**: Dependency graph construction and resource-aware scheduling
- **state_management**: Full state machine control (IDLE → PLANNING → EXECUTING → COMPLETED)
- **agent_generation**: Dynamic creation and lifecycle management of specialized agents
- **checkpoint_management**: Workflow state persistence and recovery
- **inter_agent_communication**: Message bus and event coordination

#### Key Features
- **State Management**: Checkpoint/resume functionality with transaction-like rollback
- **Learning & Adaptation**: Time prediction, agent performance tracking, solution caching
- **Parallel Execution**: Work-stealing queue implementation and dynamic agent pool sizing
- **Agent Communication**: Event-driven coordination with capability-based routing

#### Proactive Triggers
- Multi-step complex tasks requiring coordination
- When specialized agents need to be created
- Session management and checkpoint operations

#### Integration Points
- All agents report to orchestrator
- Manages agent communication bus
- Handles error recovery and fallback strategies

---

### 2. Architect Agent (`architect.md`)

**Priority**: High
**Status**: Active
**Tools**: Read, Write, Grep, Glob, LS

#### Capabilities
- **system_design**: Architecture design and component relationships
- **technical_planning**: Implementation planning and task breakdown
- **architecture_assessment**: Current system analysis and dependency mapping
- **refactoring_strategy**: Technical debt assessment and remediation planning
- **technology_evaluation**: Research and recommendation of technical solutions

#### Specializations
- System architecture design and documentation
- Implementation planning with phase breakdown
- Technical debt assessment and remediation strategies
- Component relationship analysis and dependency mapping
- Integration point design and API contracts

#### Decision Frameworks
- **Technology Selection**: Requirements → Research → Trade-offs → Recommendation
- **Refactoring Priority Matrix**: Impact vs Effort analysis
- **Task Breakdown**: Foundation → Core → Integration → Testing → Documentation

#### Integration Points
- Coordinates with: All agents for architectural guidance
- Provides plans to: Builder agents for implementation
- Works with: Security-scout for architecture security reviews
- Reports to: Orchestrator for system-wide planning

#### Proactive Triggers
- New feature requirements involving multiple components
- System refactoring or architectural changes
- Technical debt assessment requests
- Integration planning between systems

---

### 3. Code Reviewer Agent (`code-reviewer.md`)

**Priority**: High
**Status**: Active
**Tools**: Read, Grep, Glob, Bash

#### Capabilities
- **code_quality_review**: Readability, maintainability, and best practices assessment
- **security_analysis**: Security vulnerability identification and prevention
- **best_practices_enforcement**: Language-specific standards and conventions
- **performance_review**: Performance and memory consideration analysis
- **test_coverage_analysis**: Test sufficiency and quality verification

#### Review Checklist
- **Code Quality**: Readability, simplicity, clear naming, small functions
- **Error Handling**: Input validation and proper error management
- **Security**: No secrets/keys in code, secure patterns
- **Testing**: Sufficient coverage and meaningful assertions
- **Performance**: Memory considerations and optimization opportunities
- **Language-Specific**: Rust safety, Python type hints, TS strict types, Web accessibility

#### Process
1. `git diff` inspection of recent changes
2. Prioritized findings: Critical / Warnings / Suggestions
3. Minimal diff proposals (avoid broad rewrites)
4. Plan updates with review summary and required actions

#### Integration Points
- Triggered by: Orchestrator after code changes
- Works with: Security-scout for comprehensive security review
- Coordinates with: Validator-test-runner for test quality assessment

#### Proactive Triggers
- After any significant code changes or commits
- Before merge requests or production deployments
- When security-scout identifies potential issues

---

### 4. Security Scout Agent (`security-scout.md`)

**Priority**: High
**Status**: Active
**Tools**: Read, Grep, Bash, Write

#### Capabilities
- **vulnerability_scanning**: OWASP compliance and common vulnerability detection
- **dependency_auditing**: Dependency audit and license compliance checking
- **secrets_detection**: Hardcoded secrets and credentials scanning
- **compliance_checking**: Security standards and regulatory compliance
- **security_reporting**: Comprehensive vulnerability reports and recommendations

#### Security Checks
- **Secrets & Keys**: Repository scanning for exposed credentials, `.env` files
- **Language-Specific**: Rust `unsafe`, Python/TS `eval`/`exec`, shell injection
- **Dependencies**: Pinning verification, license compliance
- **Web Security**: DOM XSS, CSP headers, insecure cookies
- **Authentication**: Secure authentication and authorization patterns

#### Scan Protocols
```bash
# Vulnerability Detection
- SQL injection risks assessment
- XSS opportunities identification
- CSRF token verification
- Insecure dependency analysis

# Dependency Auditing
npm audit (Node.js projects)
safety check (Python projects)
cargo audit (Rust projects)

# Secrets Scanning
grep patterns for API keys, passwords, tokens
git history analysis for exposed secrets
```

#### Integration Points
- Works with: Code-reviewer for comprehensive security reviews
- Reports to: Orchestrator and architect for security guidance
- Triggers: Remediation tasks for critical vulnerabilities

#### Proactive Triggers
- Before production deployments
- After dependency updates or new package additions
- When processing user input or external data
- During API endpoint development

---

### 5. Validator Test Runner Agent (`validator-test-runner.md`)

**Priority**: High
**Status**: Active
**Tools**: Read, Edit, Write, Grep, Glob, LS, Bash

#### Capabilities
- **test_creation**: Test-driven development (TDD) implementation
- **test_execution**: Multi-language test framework expertise
- **coverage_analysis**: Test coverage analysis and gap identification
- **tdd_implementation**: Failing test creation before implementation
- **quality_assurance**: Acceptance criteria validation and verification

#### Test Framework Support
- **Python**: `pytest -q` for unit and integration testing
- **TypeScript/JavaScript**: `npm test` / `pnpm test` for frontend testing
- **Rust**: `cargo test -q` for systems testing
- **Integration**: End-to-end and cross-component testing

#### TDD Process
1. Turn acceptance criteria into failing tests (unit/integration)
2. Run test suites for verification
3. On failure: isolate cause and coordinate with builders
4. Add regression tests for each fixed bug
5. Update coverage reports and identify gaps

#### Integration Points
- Coordinates with: All builders for test-first development
- Works with: Code-reviewer for test quality assessment
- Reports to: Orchestrator for validation status

#### Proactive Triggers
- Before any feature implementation (TDD approach)
- After bug fixes to create regression tests
- When acceptance criteria are defined
- During CI/CD pipeline execution

---

### 6. Doc Scribe Agent (`doc-scribe.md`)

**Priority**: Medium
**Status**: Active
**Tools**: Read, Edit, Write, Grep, Glob

#### Capabilities
- **documentation_generation**: Automated documentation creation and updates
- **api_documentation**: OpenAPI specs and endpoint documentation
- **changelog_maintenance**: Version tracking and release notes
- **user_guide_creation**: User-facing documentation and tutorials
- **code_commenting**: Inline documentation and code comments

#### Documentation Types
- **README Updates**: Usage examples and getting started guides
- **API Reference**: REST endpoint documentation and schemas
- **Changelog Entries**: Feature additions, bug fixes, breaking changes
- **User Guides**: Installation, configuration, and usage tutorials
- **Developer Docs**: Architecture, contribution guidelines, style guides

#### Process
1. Read recent diffs and acceptance criteria
2. Update docs with concise, actionable content and examples
3. Keep documentation DRY (link to code where possible)
4. Update plan with documentation summary and TODOs

#### Integration Points
- Triggered by: Orchestrator after feature completion
- Works with: Architect for system documentation
- Coordinates with: All agents for feature-specific documentation

#### Proactive Triggers
- After feature implementation completion
- When API changes or new endpoints are added
- Before release preparation
- When user-facing functionality changes

---

## Dynamic Agent Generation

The orchestrator can create specialized agents on-demand using predefined templates:

### Builder Template Pattern

**Name Pattern**: `builder-{language}`
**Description**: `{language} implementation specialist with {framework} expertise`
**Tools**: Read, Edit, Write, MultiEdit, Grep, Glob, LS, Bash

#### Supported Languages

**Python**
- Test Command: `pytest -v`
- Formatters: `ruff`, `black`
- Frameworks: django, flask, fastapi, pydantic

**TypeScript**
- Test Command: `npm test`
- Formatters: `prettier`, `eslint`
- Frameworks: react, vue, express, nestjs

**Rust**
- Test Command: `cargo test`
- Formatters: `cargo fmt`, `cargo clippy`
- Frameworks: tokio, actix, axum, serde

**Web**
- Test Command: `npm test`
- Formatter: `prettier`
- Frameworks: vite, webpack, rollup

#### Generation Triggers
- Language-specific implementation needed
- Framework-specific features required
- When no suitable builder exists

### Specialist Template Pattern

**Name Pattern**: `{specialty}-specialist`
**Description**: `{specialty} expert for {domain} tasks`
**Tools**: Context-specific based on domain

#### Common Specialties
- **performance-specialist**: Performance optimization and profiling
- **api-designer**: API design and contract specification
- **database-specialist**: Database migration and optimization
- **deployment-specialist**: Deployment automation and infrastructure
- **monitoring-specialist**: Observability and monitoring setup
- **infrastructure-specialist**: Cloud and infrastructure management

#### Capabilities
- **domain_expertise**: Deep knowledge in specific technical areas
- **specialized_analysis**: Targeted analysis for domain-specific problems
- **targeted_solutions**: Optimized solutions for specific use cases
- **best_practices_enforcement**: Domain-specific standards and patterns

---

## Agent Communication Patterns

### Communication Matrix

#### Orchestrator
- **Sends to**: All agents
- **Receives from**: All agents
- **Message Types**: task_assignment, status_request, coordination

#### Architect
- **Sends to**: orchestrator, builders, security-scout
- **Receives from**: orchestrator
- **Message Types**: design_guidance, implementation_plan

#### Code Reviewer
- **Sends to**: orchestrator, builders, security-scout
- **Receives from**: orchestrator, builders
- **Message Types**: review_results, improvement_suggestions

#### Security Scout
- **Sends to**: orchestrator, code-reviewer, architect
- **Receives from**: orchestrator, code-reviewer
- **Message Types**: vulnerability_report, security_recommendations

#### Validator Test Runner
- **Sends to**: orchestrator, builders
- **Receives from**: orchestrator, builders
- **Message Types**: test_results, coverage_report, test_requests

#### Doc Scribe
- **Sends to**: orchestrator
- **Receives from**: orchestrator, all_agents
- **Message Types**: documentation_updates, changelog_entries

---

## Workflow Coordination Patterns

### Feature Development Workflow
```yaml
sequence:
  - architect: "Design and plan implementation"
  - validator-test-runner: "Create failing tests (TDD)"
  - builder: "Implement feature" (dynamically generated)
  - code-reviewer: "Review implementation"
  - security-scout: "Security audit"
  - validator-test-runner: "Verify tests pass"
  - doc-scribe: "Update documentation"

parallel_phases:
  - [architect, security-scout]: "Design review"
  - [builder, validator-test-runner]: "Implementation and testing"
  - [code-reviewer, security-scout]: "Quality and security review"
```

### Bug Fix Workflow
```yaml
sequence:
  - validator-test-runner: "Create regression test"
  - builder: "Implement fix" (dynamically generated)
  - code-reviewer: "Review fix"
  - validator-test-runner: "Verify fix"
  - doc-scribe: "Update changelog"
```

### Security Audit Workflow
```yaml
parallel:
  - security-scout: "Vulnerability scan"
  - code-reviewer: "Code security review"
  - validator-test-runner: "Security test verification"
coordination: orchestrator
```

---

## Archived Agents

The following agents are archived in `agents/_archive/` and can be reactivated when needed:

### Language Builders (Archived)
- **api-designer.md**: API contract designer (replaced by dynamic generation)
- **builder-python.md**: Python implementation specialist
- **builder-typescript.md**: TypeScript implementation specialist
- **builder-rust.md**: Rust implementation specialist
- **builder-web.md**: Web UI specialist
- **perf-optimizer.md**: Performance optimization specialist

### Game-Specific Agents (Archived)
- **combat-system.md**: Combat mechanics implementation
- **detective-system.md**: Mystery and clue system implementation

### Duplicate Agents (Archived)
- **security_scout.md**: Duplicate of security-scout (shorter version)

---

## Performance Targets

- **Agent Response Time**: < 30 seconds
- **Parallel Efficiency**: > 75%
- **Task Completion Rate**: > 95%
- **Cache Hit Rate**: > 40%
- **Agent Generation Time**: < 30 seconds

---

## Usage Guidelines

### When to Use Core Agents
- Use **orchestrator** for complex multi-step workflows
- Use **architect** for system design and planning tasks
- Use **code-reviewer** for all code quality assessments
- Use **security-scout** for security audits and vulnerability scanning
- Use **validator-test-runner** for TDD and test automation
- Use **doc-scribe** for documentation generation and maintenance

### When to Generate Dynamic Agents
- Language-specific implementation tasks requiring specialized knowledge
- Domain expertise not covered by core agents
- Performance optimization requiring deep specialization
- Infrastructure tasks requiring specific cloud/deployment knowledge

### Agent Coordination Best Practices
1. Always start workflows through the orchestrator
2. Use parallel execution for independent tasks
3. Leverage checkpoints for long-running workflows
4. Monitor agent communication through the message bus
5. Review capability matrix for optimal agent selection

---

## Development and Extension

### Adding New Core Agents
1. Create agent markdown file with standard header format
2. Update `capability_matrix.yaml` with agent specifications
3. Define communication patterns and integration points
4. Add proactive triggers and coordination rules

### Creating Dynamic Agent Templates
1. Define template pattern in `capability_matrix.yaml`
2. Specify generation triggers and capabilities
3. Add to orchestrator agent generation logic
4. Test template generation and lifecycle management

### Extending Agent Capabilities
1. Review existing agent capabilities in capability matrix
2. Add new capabilities to appropriate agents
3. Update integration points and communication patterns
4. Document new workflows and coordination patterns

This agent ecosystem provides a comprehensive foundation for collaborative development with sophisticated coordination, dynamic specialization, and robust state management.