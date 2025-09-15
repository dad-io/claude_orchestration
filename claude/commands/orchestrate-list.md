List available templates and their descriptions for workflow discovery.

$ARGUMENTS: [template_type]

## Usage

### List All Templates
$USAGE: `orchestrate list`

**Output:** Shows all available templates with descriptions and use cases:
```
Available Templates:

🏗️  build.yaml        - Feature development with TDD workflow
    Use case: New feature implementation with full testing and validation
    Example: orchestrate template build "user authentication system"

🔧  fix.yaml          - Issue resolution with regression testing
    Use case: Bug fixes with systematic testing and validation
    Example: orchestrate template fix "payment processing error"

🚀  deploy.yaml       - Production deployment with validation gates
    Use case: Safe production deployments with rollback procedures
    Example: orchestrate template deploy "production release v2.1"

📊  analyze.yaml      - Comprehensive codebase analysis
    Use case: Security, quality, and performance audits
    Example: orchestrate template analyze "security audit Q4"

📖  document.yaml     - Documentation generation and maintenance
    Use case: API docs, user guides, and changelog updates
    Example: orchestrate template document "API documentation update"

⚡  improve.yaml      - Code quality enhancement and optimization
    Use case: Refactoring, performance improvements, security hardening
    Example: orchestrate template improve "performance optimization"

📋  report.yaml       - Status reporting with visualizations
    Use case: Project metrics, progress tracking, KPI analysis
    Example: orchestrate template report "quarterly review"

🔍  research.yaml     - Planning and architecture design
    Use case: Problem analysis, solution research, technology evaluation
    Example: orchestrate template research "microservices migration"
```

### List Specific Template Type
$USAGE: `orchestrate list [template_type]`

**Examples:**
- `orchestrate list build` - Show build template details
- `orchestrate list fix` - Show fix template details
- `orchestrate list deploy` - Show deployment template details

**Output for specific template:**
```
Template: build.yaml
Description: Feature development with TDD workflow
Version: 2.0

Phases:
1. Planning (parallel): architect + security-scout analysis
2. Design: detailed implementation plan with acceptance criteria
3. Implementation (parallel): dynamic builder generation + development
4. Validation: test execution + quality review + security audit
5. Documentation: API docs + changelog updates

Required Core Agents:
- orchestrator: Workflow coordination and state management
- architect: System design and implementation planning
- security-scout: Security requirements and compliance
- validator-test-runner: TDD implementation and quality assurance

Dynamic Agents:
- builder-{language}: Generated based on detected tech stack
- {specialty}-specialist: Created for domain-specific requirements

Use Cases:
✅ New feature development with full validation
✅ Complex multi-component implementations
✅ Features requiring security compliance
✅ TDD-driven development workflows

Example Usage:
orchestrate template build "real-time chat system"
orchestrate template build "payment integration with Stripe"
orchestrate template build "user dashboard with analytics"
```

## Template Recommendations

### Interactive Recommendation
$USAGE: `orchestrate recommend`

**Behavior:**
1. Analyzes current project structure and recent changes
2. Suggests appropriate templates based on:
   - File changes and git history
   - Project dependencies and technology stack
   - Common workflow patterns
   - Previous successful template usage

**Sample Output:**
```
🤖 Template Recommendations Based on Your Project:

Detected: TypeScript React project with authentication
Recent changes: Payment-related files modified

Recommended Templates:
1. 🔧 fix.yaml - You have failing tests in payment.test.ts
   Command: orchestrate template fix "payment processing test failures"

2. 🏗️ build.yaml - For adding the checkout feature you've been working on
   Command: orchestrate template build "checkout flow implementation"

3. 📊 analyze.yaml - Security review recommended for payment handling
   Command: orchestrate template analyze "payment security audit"

Based on similar projects, teams typically use:
- fix.yaml: 45% of workflows (bug fixes and quick improvements)
- build.yaml: 35% of workflows (new feature development)
- analyze.yaml: 15% of workflows (quality and security reviews)
- deploy.yaml: 5% of workflows (production releases)
```

## Help and Details

### Template Help
$USAGE: `orchestrate help [template_name]`

**Examples:**
- `orchestrate help build` - Detailed build template documentation
- `orchestrate help fix` - Detailed fix template documentation

### Workflow Examples
$USAGE: `orchestrate list examples`

**Output:** Shows common workflow patterns and real-world examples for each template type.

## Implementation Details

### Template Discovery
- Scans `templates/` directory for .yaml files
- Parses template metadata including description, version, and use cases
- Reads orchestration configuration and agent requirements
- Generates usage examples based on template capabilities

### Project Analysis (for recommendations)
- Analyzes git history and recent file changes
- Detects project technology stack from files and dependencies
- Identifies common patterns and workflow triggers
- Learns from previous successful template executions

### Caching and Performance
- Template metadata cached for fast response times
- Project analysis results cached for session duration
- Recommendations updated when significant project changes detected

This command enhances template discoverability and helps users choose the most appropriate workflow for their specific needs.