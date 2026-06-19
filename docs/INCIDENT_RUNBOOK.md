# Incident Response Runbook

## Scenario

RDS database accidentally becomes publicly accessible.

---

## Detection

CloudWatch Alarm triggers.

AWS Config detects configuration drift.

Security Hub raises findings.

---

## Investigation

1. Verify RDS Security Groups.
2. Check Publicly Accessible flag.
3. Review CloudTrail logs.
4. Verify recent Terraform changes.

---

## Recovery

Immediately:

- Disable Public Access.
- Restore Security Group.
- Restrict inbound traffic.
- Rotate database credentials.
- Verify application connectivity.

---

## Post Incident

- Perform Root Cause Analysis.
- Update Terraform.
- Review IAM permissions.
- Add preventive AWS Config Rules.