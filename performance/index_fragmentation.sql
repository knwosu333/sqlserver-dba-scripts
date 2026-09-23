-- Index fragmentation candidates for the current database.
-- Review page count and workload before deciding on maintenance.
SELECT
    OBJECT_SCHEMA_NAME(ips.object_id) AS schema_name,
    OBJECT_NAME(ips.object_id) AS table_name,
    i.name AS index_name,
    ips.index_type_desc,
    ips.avg_fragmentation_in_percent,
    ips.page_count
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL, 'LIMITED') ips
JOIN sys.indexes i
  ON ips.object_id = i.object_id
 AND ips.index_id = i.index_id
WHERE ips.index_id > 0
  AND ips.page_count >= 1000
ORDER BY ips.avg_fragmentation_in_percent DESC;
