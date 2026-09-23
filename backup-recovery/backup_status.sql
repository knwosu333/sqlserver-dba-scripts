-- Latest successful full, differential, and log backups per database
WITH b AS (
    SELECT
        database_name,
        type,
        MAX(backup_finish_date) AS last_backup_finish
    FROM msdb.dbo.backupset
    WHERE is_copy_only = 0
    GROUP BY database_name, type
)
SELECT
    d.name AS database_name,
    MAX(CASE WHEN b.type = 'D' THEN b.last_backup_finish END) AS last_full_backup,
    MAX(CASE WHEN b.type = 'I' THEN b.last_backup_finish END) AS last_diff_backup,
    MAX(CASE WHEN b.type = 'L' THEN b.last_backup_finish END) AS last_log_backup,
    d.recovery_model_desc
FROM sys.databases d
LEFT JOIN b ON d.name = b.database_name
WHERE d.database_id > 4
GROUP BY d.name, d.recovery_model_desc
ORDER BY d.name;
