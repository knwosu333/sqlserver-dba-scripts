# Backup & Recovery Checklist

A successful backup job is not the same as a proven recovery strategy.

## Review
- Recovery model for each database
- Full/differential/log backup schedule
- Backup age against RPO
- Backup destination and capacity
- Backup failures
- CHECKSUM strategy where appropriate
- Restore testing
- Recovery time against RTO
- System database backups
- Encryption/key/certificate requirements where applicable

## Recovery Testing
Periodically restore backups to an isolated non-production environment, run integrity/validation checks appropriate to the environment, confirm application-level usability when required, and record actual restore/recovery duration.

## Interview Discussion
Be prepared to explain FULL vs SIMPLE recovery models, full/differential/log backups, tail-log backups, point-in-time restore, RPO vs RTO, and why restore testing is essential.
