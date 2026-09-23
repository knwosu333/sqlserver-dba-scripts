-- Database file size and configured growth
SELECT
    DB_NAME(database_id) AS database_name,
    name AS logical_file_name,
    type_desc,
    physical_name,
    size * 8.0 / 1024 AS size_mb,
    CASE WHEN is_percent_growth = 1
         THEN CAST(growth AS varchar(20)) + '%'
         ELSE CAST(growth * 8.0 / 1024 AS varchar(20)) + ' MB'
    END AS growth_setting,
    CASE WHEN max_size = -1 THEN 'UNLIMITED'
         ELSE CAST(max_size * 8.0 / 1024 AS varchar(30)) + ' MB'
    END AS max_size
FROM sys.master_files
ORDER BY database_name, type_desc, logical_file_name;
