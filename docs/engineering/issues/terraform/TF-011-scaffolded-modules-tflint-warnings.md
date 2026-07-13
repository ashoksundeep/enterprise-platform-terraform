# TF-011 — TFLint Warnings from Scaffolded Terraform Modules

## Category

Terraform

## Severity

Low

## Sprint

Sprint 3

## Date

2026-07-13

## Component

Repository Quality Gates

---

## Problem

After enabling repository-wide validation using:

```bash
pre-commit run --all-files
```

TFLint reported warnings from several AWS modules and live environments that had not yet been implemented.

---

## Errors

Example:

```
terraform "required_version" attribute is required
```

Reported in:

- terraform/modules/aws/network
- terraform/live/10-network/aws/dev
- terraform/live/10-network/aws/qa
- terraform/live/10-network/aws/prod
- terraform/live/10-network/azure/qa
- terraform/live/10-network/azure/prod

---

## Investigation

Verified that:

- Azure Network module was complete.
- Azure Container Registry module was complete.
- AWS repository structure had only been scaffolded.
- QA and Production environments had placeholder Terraform files awaiting future implementation.

Repository inspection confirmed these directories were intentionally created during repository bootstrapping.

---

## Root Cause

The repository was designed with a complete enterprise directory structure from the beginning.

Several modules and environments were intentionally scaffolded for future sprints and therefore did not yet contain complete Terraform configurations.

TFLint recursively scanned every Terraform directory and correctly reported warnings for unfinished components.

These warnings did **not** indicate defects in the implemented Azure infrastructure.

---

## Resolution

No code changes were made during Sprint 3.

The warnings were accepted as planned technical debt.

Each placeholder module will be completed during its corresponding implementation sprint.

Examples:

- AWS Network Module
- Azure Production Environment
- Azure QA Environment
- AWS Live Environments

---

## Validation

Verified that:

- Azure Network Module passes validation.
- Azure ACR Module passes validation.
- Terraform Apply completed successfully.
- Remaining TFLint warnings originate only from scaffolded directories.

---

## Lessons Learned

Repository-wide quality tools validate every Terraform configuration, including unfinished scaffolding.

Not every warning requires an immediate fix.

Engineering teams should distinguish between:

- defects
- planned future work
- technical debt

Documenting intentional technical debt is preferable to suppressing warnings without explanation.

---

## Interview Talking Points

During the implementation of repository-wide quality gates, TFLint reported warnings from multiple Terraform directories.

Rather than treating these as defects, I investigated the repository layout and determined that the warnings originated from scaffolded modules created for future AWS and production implementations.

I documented these findings as technical debt and scheduled them for resolution in later sprints instead of introducing unnecessary placeholder code solely to satisfy the linter.
