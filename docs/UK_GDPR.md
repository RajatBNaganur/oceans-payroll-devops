# UK GDPR Considerations

## AWS Controls

- IAM Least Privilege
- Secrets Manager
- KMS Encryption
- CloudTrail
- AWS Config
- Security Hub
- GuardDuty

---

## Data Residency

Deploy resources in:

- eu-west-2 (London)

Backups should remain within approved UK/EU regions.

---

## Right to Erasure

Deletion process:

1. Remove database records.
2. Delete S3 objects.
3. Remove backups where permitted.
4. Revoke IAM access.
5. Record deletion in audit logs.