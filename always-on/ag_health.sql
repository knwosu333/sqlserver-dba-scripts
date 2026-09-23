-- Always On Availability Group replica/database health
SELECT
    ag.name AS availability_group,
    ar.replica_server_name,
    ars.role_desc,
    ars.connected_state_desc,
    ars.synchronization_health_desc
FROM sys.availability_groups ag
JOIN sys.availability_replicas ar
  ON ag.group_id = ar.group_id
LEFT JOIN sys.dm_hadr_availability_replica_states ars
  ON ar.replica_id = ars.replica_id
ORDER BY ag.name, ar.replica_server_name;

SELECT
    DB_NAME(drs.database_id) AS database_name,
    ar.replica_server_name,
    drs.synchronization_state_desc,
    drs.synchronization_health_desc,
    drs.is_suspended,
    drs.log_send_queue_size,
    drs.redo_queue_size
FROM sys.dm_hadr_database_replica_states drs
JOIN sys.availability_replicas ar
  ON drs.replica_id = ar.replica_id
ORDER BY database_name, ar.replica_server_name;
