Real-time agent performance monitoring and bottleneck identification.

$ARGUMENTS: [view_type] [agent_name]

## Usage

### Real-Time Dashboard
$USAGE: `orchestrate monitor`

**Output:** Live monitoring dashboard with real-time agent performance metrics:
```
🔍 Agent Performance Dashboard - Live View

System Overview                              Agent Pool Status
├─ Active Workflows: 3                      ├─ Total Agents: 9 (6 core + 3 dynamic)
├─ Queue Depth: 12 tasks                    ├─ Available: 6
├─ Avg Response: 8.2s                       ├─ Busy: 3
└─ Success Rate: 97.3%                      └─ Failed: 0

Core Agent Performance (Last 1 Hour)
┌─────────────────────┬─────────┬─────────┬─────────┬────────────┬─────────────┐
│ Agent               │ Tasks   │ Avg Time│ Success │ Queue      │ Status      │
├─────────────────────┼─────────┼─────────┼─────────┼────────────┼─────────────┤
│ 🎯 orchestrator     │ 45/45   │ 2.1s    │ 100%    │ 0 pending  │ 🟢 ACTIVE   │
│ 🏗️  architect       │ 12/12   │ 15.3s   │ 100%    │ 2 pending  │ 🟡 BUSY     │
│ 🔍 code-reviewer    │ 23/24   │ 11.7s   │ 95.8%   │ 1 pending  │ 🟡 BUSY     │
│ 🛡️  security-scout  │ 18/18   │ 22.4s   │ 100%    │ 0 pending  │ 🟢 ACTIVE   │
│ ✅ validator-test   │ 31/33   │ 18.9s   │ 93.9%   │ 3 pending  │ 🟡 BUSY     │
│ 📖 doc-scribe       │ 8/8     │ 7.2s    │ 100%    │ 0 pending  │ 🟢 ACTIVE   │
└─────────────────────┴─────────┴─────────┴─────────┴────────────┴─────────────┘

Dynamic Agent Performance
┌─────────────────────┬─────────┬─────────┬─────────┬────────────┬─────────────┐
│ Agent               │ Tasks   │ Avg Time│ Success │ Queue      │ Status      │
├─────────────────────┼─────────┼─────────┼─────────┼────────────┼─────────────┤
│ 🐍 builder-python   │ 15/16   │ 25.1s   │ 93.8%   │ 4 pending  │ 🔴 OVERLOAD │
│ 🚀 api-specialist   │ 7/7     │ 19.3s   │ 100%    │ 1 pending  │ 🟡 BUSY     │
│ ⚡ perf-optimizer   │ 3/3     │ 45.2s   │ 100%    │ 0 pending  │ 🟢 ACTIVE   │
└─────────────────────┴─────────┴─────────┴─────────┴────────────┴─────────────┘

🚨 Alerts:
- builder-python: Queue overload (4 tasks) - consider parallel scaling
- validator-test: 2 recent failures - check test environment
- System: Average response time trending up (+2.3s from baseline)

Last Updated: 2025-09-15 14:45:23 (auto-refresh every 10s)
Press 'q' to quit, 'r' to refresh, 'd' for detailed view
```

### Detailed Agent View
$USAGE: `orchestrate monitor [agent_name]`

**Examples:**
- `orchestrate monitor builder-python` - Detailed Python builder performance
- `orchestrate monitor code-reviewer` - Code reviewer metrics and patterns

**Sample Output:**
```
🐍 builder-python - Detailed Performance Analysis

Agent Information
├─ Type: Dynamic (Language Builder)
├─ Created: 2025-09-15 13:22:15
├─ Uptime: 1h 23m 8s
├─ Specializations: Django, FastAPI, pytest
└─ Current Workflow: workflow-abc123 (feature development)

Performance Metrics (Last 24 Hours)
┌─────────────────────┬─────────┬─────────┬─────────┬─────────────┐
│ Time Period         │ Tasks   │ Avg Time│ Success │ Throughput  │
├─────────────────────┼─────────┼─────────┼─────────┼─────────────┤
│ Last Hour           │ 15/16   │ 25.1s   │ 93.8%   │ 2.4 tasks/h │
│ Last 4 Hours        │ 48/52   │ 22.7s   │ 92.3%   │ 12.5 task/h │
│ Last 24 Hours       │ 127/135 │ 24.1s   │ 94.1%   │ 5.6 tasks/h │
└─────────────────────┴─────────┴─────────┴─────────┴─────────────┘

Task Distribution
├─ Implementation: 65% (avg 28.3s)
├─ Testing: 20% (avg 15.2s)
├─ Debugging: 10% (avg 45.1s)
└─ Refactoring: 5% (avg 12.8s)

Current Queue (4 tasks)
1. [HIGH] Implement user authentication middleware (2 min ago)
2. [MED]  Fix payment validation logic (5 min ago)
3. [LOW]  Update API documentation strings (8 min ago)
4. [MED]  Add integration tests for checkout flow (12 min ago)

Recent Failures (Last 24h)
1. Test execution timeout - pytest hung on database fixture (2h ago)
   └─ Auto-resolved: Restarted with fresh test environment
2. Import error - Missing dependency in virtual environment (6h ago)
   └─ Manual fix: Added missing package to requirements

Performance Trends
├─ Response Time: ↗️ +15% (trending up, monitor closely)
├─ Success Rate: ↘️ -2.1% (slight decline, investigate failures)
├─ Queue Depth: ↗️ +300% (significant increase, scaling needed)
└─ Memory Usage: ↗️ +8% (within normal range)

Recommendations
🎯 Scale horizontally: Create builder-python-2 instance
⚡ Optimize: Review test fixtures causing timeouts
🔧 Investigate: Recent dependency issues affecting success rate
```

### System-Wide Performance
$USAGE: `orchestrate monitor system`

**Output:** Comprehensive system performance analysis:
```
🖥️  System Performance Overview

Resource Utilization
├─ CPU: ████████░░ 78% (8 cores active)
├─ Memory: ██████░░░░ 64% (5.2GB / 8GB)
├─ Disk I/O: ███░░░░░░░ 31% (normal activity)
└─ Network: ██░░░░░░░░ 23% (agent communication)

Agent Communication Matrix (Message/sec)
                 orch arch code secu vali docs py-b api-s perf
orchestrator      -   2.1  1.8  1.2  3.4  0.8  4.2  1.1  0.3
architect        2.1   -   0.4  0.7  0.9  1.2  2.8  0.6  0.1
code-reviewer    1.8  0.4   -   1.9  2.1  0.3  3.2  0.8  0.2
security-scout   1.2  0.7  1.9   -   0.8  0.2  1.9  0.4  0.1
validator-test   3.4  0.9  2.1  0.8   -   0.5  4.8  1.2  0.2
doc-scribe       0.8  1.2  0.3  0.2  0.5   -   1.1  0.3  0.1
builder-python   4.2  2.8  3.2  1.9  4.8  1.1   -   2.1  0.4
api-specialist   1.1  0.6  0.8  0.4  1.2  0.3  2.1   -   0.2
perf-optimizer   0.3  0.1  0.2  0.1  0.2  0.1  0.4  0.2   -

Workflow Performance Patterns
┌─────────────────────┬─────────┬─────────┬─────────┬─────────────┐
│ Workflow Type       │ Count   │ Avg Time│ Success │ Bottleneck  │
├─────────────────────┼─────────┼─────────┼─────────┼─────────────┤
│ Feature Development │ 23      │ 18.4m   │ 95.7%   │ testing     │
│ Bug Fixes           │ 15      │ 8.7m    │ 93.3%   │ analysis    │
│ Security Audits     │ 4       │ 31.2m   │ 100%    │ scanning    │
│ Deployments         │ 7       │ 12.1m   │ 100%    │ validation  │
└─────────────────────┴─────────┴─────────┴─────────┴─────────────┘

System Health Indicators
🟢 Agent Availability: 95.2% (excellent)
🟡 Queue Management: 78.3% (good, monitor growth)
🟢 Error Recovery: 98.7% (excellent)
🟡 Resource Efficiency: 72.1% (good, room for improvement)
```

### Historical Analysis
$USAGE: `orchestrate monitor history [timeframe]`

**Examples:**
- `orchestrate monitor history 24h` - Last 24 hours
- `orchestrate monitor history 7d` - Last week
- `orchestrate monitor history 30d` - Last month

### Performance Alerts
$USAGE: `orchestrate monitor alerts`

**Output:** Current performance alerts and thresholds:
```
🚨 Active Performance Alerts

Critical (Action Required)
├─ builder-python queue depth: 4 tasks (threshold: 3)
   └─ Recommendation: Scale horizontally or optimize task distribution

Warnings (Monitor Closely)
├─ System response time: 8.2s avg (threshold: 10s)
├─ validator-test failure rate: 6.1% (threshold: 5%)
└─ Memory usage trending up: +15% over 2 hours

Resolved (Last 24h)
├─ ✅ orchestrator communication lag resolved (auto-scaling applied)
├─ ✅ code-reviewer timeout issues fixed (configuration update)
└─ ✅ System disk space warning cleared (log rotation)

Alert Configuration
├─ Response Time: >10s (warning), >20s (critical)
├─ Success Rate: <95% (warning), <90% (critical)
├─ Queue Depth: >3 tasks (warning), >5 tasks (critical)
├─ Memory Usage: >80% (warning), >90% (critical)
└─ Agent Failures: >2/hour (warning), >5/hour (critical)
```

## Advanced Monitoring Features

### Custom Dashboards
$USAGE: `orchestrate monitor dashboard [name]`
- Create custom monitoring views for specific needs
- Save and share dashboard configurations
- Export performance data for external analysis

### Performance Profiles
$USAGE: `orchestrate monitor profile [workflow_type]`
- Deep dive into specific workflow type performance
- Identify optimization opportunities
- Compare performance across different project types

### Predictive Analysis
$USAGE: `orchestrate monitor predict`
- Forecast system load and potential bottlenecks
- Recommend scaling actions before issues occur
- Trend analysis and capacity planning

## Integration Points

### Hook Integration
Performance monitoring integrates with orchestrator hooks:
- Real-time metric collection during workflow execution
- Automatic alert generation and notification
- Performance data collection at checkpoint creation

### State Management
Monitoring data stored alongside workflow state:
```
.claude/orchestrator/
├── monitoring/
│   ├── metrics.db              # Time-series performance data
│   ├── alerts.json            # Active alerts and thresholds
│   ├── dashboards/            # Custom dashboard configurations
│   └── reports/               # Generated performance reports
```

This monitoring system provides comprehensive visibility into agent performance, system health, and workflow efficiency, enabling proactive optimization and issue resolution.