-- Most recent SQL Server Agent outcome for enabled jobs
WITH h AS (
    SELECT
        job_id,
        run_status,
        run_date,
        run_time,
        ROW_NUMBER() OVER (PARTITION BY job_id ORDER BY instance_id DESC) AS rn
    FROM msdb.dbo.sysjobhistory
    WHERE step_id = 0
)
SELECT
    j.name AS job_name,
    j.enabled,
    h.run_status,
    msdb.dbo.agent_datetime(h.run_date, h.run_time) AS last_run_datetime
FROM msdb.dbo.sysjobs j
LEFT JOIN h ON j.job_id = h.job_id AND h.rn = 1
WHERE j.enabled = 1
ORDER BY h.run_status, j.name;
-- run_status: 0=Failed, 1=Succeeded, 2=Retry, 3=Canceled, 4=In Progress
