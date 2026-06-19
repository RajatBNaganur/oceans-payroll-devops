# Multi-Tenancy Design

## 1. Tenant Isolation Strategy

The platform supports three tenant types:

- Companies
- Bureaus
- Employees

Each tenant accesses its own portal through a dedicated EC2 instance.

### Database Strategy

A shared PostgreSQL database is used with strict `tenant_id` isolation.

Example:

Company A

tenant_id = company_001

Company B

tenant_id = company_002

Every application query automatically filters by tenant_id.

Example:

```sql
SELECT *
FROM payroll
WHERE tenant_id = :tenant_id;
```

The tenant context is established after authentication using a signed JWT token.

Each request carries the authenticated tenant_id, preventing access to records belonging to another tenant.

---

## Infrastructure Isolation

Separate IAM Roles exist for:

- Company Portal
- Bureau Portal
- Employee Portal

Each role has access only to its own AWS resources.

---

## S3 Isolation

Documents are stored using prefixes.

```
company/
bureau/
employee/
```

Bucket policies restrict access to only the appropriate prefix.

Example:

Company users can access

```
company/*
```

but cannot access

```
bureau/*
employee/*
```

---

## Tenant Onboarding

When a new Company or Bureau is created:

- User account created
- tenant_id generated
- IAM permissions assigned
- S3 folder created
- Database records initialized

---

## Tenant Offboarding

During offboarding:

- Disable user access
- Revoke IAM permissions
- Delete S3 documents
- Delete tenant database records
- Preserve audit logs where legally required