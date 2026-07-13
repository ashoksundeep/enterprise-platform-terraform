# Decision Log

---

## DD-001

Decision

Use reusable Terraform modules.

Reason

Supports multi-environment deployments.

Alternatives

Separate Terraform code per environment.

Outcome

Reusable modules selected.

---

## DD-002

Decision

Use Azure Blob Storage backend.

Reason

Remote state
State locking
Team collaboration

---

## DD-003

Decision

Adopt Checkov and TFLint.

Reason

Infrastructure security validation.

---

## DD-004

Decision

Validate Checkov recommendations against the AzureRM provider schema before implementation.

Reason

Not every security recommendation is directly supported by the Terraform provider.

Outcome

Supported controls are implemented in Terraform; unsupported controls are documented in the security backlog and scheduled for later sprints.
