# SQL Server Performance Troubleshooting Runbook

## Scenario
Users report slow application response and elevated SQL Server CPU.

## Investigation Workflow
1. Establish the incident window and affected application/database.
2. Check host CPU, memory, disk latency, and SQL Server resource pressure.
3. Review active requests, waits, and blocking.
4. Identify high-CPU/high-duration queries from DMVs or Query Store where available.
5. Inspect actual/estimated execution plans as appropriate.
6. Check cardinality estimates, scans/seeks, joins, sorts, spills, implicit conversions, and parameter-sensitive behavior.
7. Review statistics and index design in workload context.
8. Check recent deployments, configuration changes, and workload shifts.
9. Apply a controlled remediation under change management.
10. Compare post-change measurements with the baseline.

## Senior DBA Principle
Do not treat symptoms blindly. For example, killing a blocker may restore service temporarily but does not explain why the transaction blocked others. Likewise, adding an index can improve one query while increasing write cost and storage requirements.
