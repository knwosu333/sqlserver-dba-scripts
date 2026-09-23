-- Current requests involved in blocking
SELECT
    r.session_id,
    r.blocking_session_id,
    r.status,
    r.command,
    r.wait_type,
    r.wait_time,
    r.wait_resource,
    DB_NAME(r.database_id) AS database_name,
    t.text AS sql_text
FROM sys.dm_exec_requests r
OUTER APPLY sys.dm_exec_sql_text(r.sql_handle) t
WHERE r.blocking_session_id <> 0
ORDER BY r.wait_time DESC;
