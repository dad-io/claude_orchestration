Orchestrate a complex multi-agent workflow with state management and coordination.

$ARGUMENTS: "<workflow_type>" "<specific_requirements>"

## Workflow Types

### Feature Development
$USAGE: `orchestrate feature "user authentication system"`

**Phases:**
1) **Planning** (parallel):
   - **architect**: Design system architecture and data flow
   - **security-scout**: Identify security requirements and compliance needs

2) **Design** (sequential):
   - **architect**: Create detailed implementation plan with acceptance criteria
   - **validator-test-runner**: Draft comprehensive test suite (TDD approach)

3) **Implementation** (parallel):
   - **orchestrator**: Generate builder-{language} agent based on tech stack
   - **builder-{language}**: Implement feature to satisfy failing tests
   - **security-scout**: Continuous security monitoring during development

4) **Validation** (sequential):
   - **validator-test-runner**: Execute test suite and verify coverage
   - **code-reviewer**: Quality review and security audit
   - **security-scout**: Final security verification

5) **Documentation** (parallel):
   - **doc-scribe**: Update API docs and user guides
   - **doc-scribe**: Generate changelog entries

### Bug Fix Workflow
$USAGE: `orchestrate bugfix "payment processing error in checkout"`

**Phases:**
1) **Investigation**:
   - **architect**: Analyze system context and potential impact areas
   - **validator-test-runner**: Create regression test to reproduce issue

2) **Resolution**:
   - **orchestrator**: Generate appropriate specialist agent if needed
   - **builder-{language}**: Implement minimal fix
   - **validator-test-runner**: Verify fix resolves issue without regressions

3) **Verification**:
   - **code-reviewer**: Review fix for quality and side effects
   - **security-scout**: Ensure fix doesn't introduce security vulnerabilities

### Security Audit
$USAGE: `orchestrate security "comprehensive security review"`

**Phases:**
1) **Scanning** (parallel):
   - **security-scout**: Vulnerability scan and dependency audit
   - **code-reviewer**: Security-focused code review
   - **architect**: Architecture security assessment

2) **Analysis**:
   - **orchestrator**: Aggregate findings and prioritize by severity
   - **security-scout**: Generate detailed security report

3) **Remediation**:
   - **orchestrator**: Create specialized agents for complex security fixes
   - **builder-{language}**: Implement security improvements
   - **validator-test-runner**: Create security-focused tests

### Performance Optimization
$USAGE: `orchestrate performance "optimize API response times"`

**Phases:**
1) **Profiling**:
   - **orchestrator**: Generate performance-specialist agent
   - **performance-specialist**: Identify bottlenecks and hot paths

2) **Optimization**:
   - **architect**: Design optimization strategy
   - **builder-{language}**: Implement performance improvements
   - **validator-test-runner**: Create performance benchmarks

3) **Validation**:
   - **performance-specialist**: Verify improvements and measure gains
   - **code-reviewer**: Ensure optimizations don't compromise correctness

### Custom Workflow
$USAGE: `orchestrate custom "deploy microservice with monitoring"`

**Dynamic Orchestration:**
1) **orchestrator**: Analyze requirements and generate workflow plan
2) **orchestrator**: Create specialized agents as needed:
   - `deploy-specialist` for deployment automation
   - `monitoring-specialist` for observability setup
3) **orchestrator**: Execute workflow with real-time coordination
4) **orchestrator**: Monitor progress and handle error recovery

## Orchestration Features

### State Management
- **Checkpoints**: Save workflow state at each phase completion
- **Resume**: Continue from last checkpoint on interruption
- **Rollback**: Revert to previous stable state on failure

### Parallel Execution
- **Dependency Resolution**: Automatic task ordering based on dependencies
- **Resource Management**: Optimal agent allocation and load balancing
- **Progress Monitoring**: Real-time status updates and ETA predictions

### Agent Generation
- **Dynamic Creation**: Generate specialized agents for unique requirements
- **Template-Based**: Use predefined templates for common agent types
- **Custom Agents**: Create agents from natural language descriptions

### Communication
- **Message Bus**: Inter-agent communication and coordination
- **Event System**: Trigger-based workflow progression
- **Status Reporting**: Centralized progress and error reporting

## Advanced Usage

### Workflow Customization
```bash
# Define custom phases and agent assignments
orchestrate custom "implement GraphQL API" --phases="design,implement,test,document" --parallel="design+security" --agents="api-designer,builder-typescript,validator-test-runner,doc-scribe"
```

### Conditional Execution
```bash
# Execute workflow with conditions
orchestrate feature "user dashboard" --if-tests-pass --require-security-approval --parallel-limit=3
```

### Learning Integration
```bash
# Use learned patterns for optimization
orchestrate feature "payment integration" --use-cache --learn-from="previous-payment-features" --optimize-for="speed"
```

## Example: Complete Feature Development

**Command:** `orchestrate feature "real-time chat system"`

**Generated Workflow:**
1. **orchestrator** → Initialize state machine (PLANNING)
2. **architect** + **security-scout** → Parallel analysis
3. **architect** → Detailed design with WebSocket architecture
4. **validator-test-runner** → Create failing tests for chat functionality
5. **orchestrator** → Generate `builder-typescript` for React frontend
6. **orchestrator** → Generate `builder-python` for WebSocket backend
7. **builder-typescript** + **builder-python** → Parallel implementation
8. **validator-test-runner** → Execute comprehensive test suite
9. **code-reviewer** → Quality and security review
10. **security-scout** → WebSocket security audit
11. **doc-scribe** → API documentation and user guides
12. **orchestrator** → Final coordination and completion (COMPLETED)

**Output:** Complete real-time chat system with tests, documentation, and security validation.

## Constraints
- Maximum 6 parallel agents to prevent resource exhaustion
- Automatic checkpoint creation every 5 minutes during execution
- Fallback to sequential execution if parallel dependencies create deadlocks
- Generated agents are automatically archived after workflow completion