# GIT-003 — Introducing Pre-commit Quality Gates

## Category

Git / DevOps Tooling

## Severity

Medium

## Sprint

Sprint 3

## Date

2026-07-13

## Component

Pre-commit Framework

---

## Problem

After introducing the pre-commit framework, running:

```bash
pre-commit run --all-files
```

resulted in multiple failures even though the Terraform configuration itself was valid.

---

## Errors

### End of File Fixer

```
fix end of files.................................................Failed
```

Modified files:

- docs/security/checkov-baseline.md
- .gitignore

---

### Terraform fmt

```
Terraform fmt....................................................Failed
```

Modified file:

- providers.tf

---

### TFLint

```
terraform "required_version" attribute is required
```

Reported across multiple Terraform directories.

---

## Investigation

Performed the following steps:

- Verified `.pre-commit-config.yaml`
- Installed pre-commit hooks
- Executed all configured hooks
- Reviewed hook output
- Verified Terraform formatting
- Executed `terraform validate`
- Executed `tflint`
- Compared module structure against repository layout

---

## Root Cause

There were multiple independent causes:

### 1. Missing End-of-File Newline

Some files did not end with a newline character.

The `end-of-file-fixer` hook automatically corrected them.

---

### 2. Terraform Formatting

Some Terraform files were not formatted according to the canonical HashiCorp style.

The `terraform_fmt` hook reformatted them automatically.

---

### 3. TFLint Repository Scan

TFLint recursively scanned the entire repository.

Several placeholder AWS environments and modules created during the repository scaffolding phase did not yet contain a complete Terraform configuration.

Those directories triggered warnings such as:

```
terraform "required_version" attribute is required
```

These warnings originated from incomplete placeholder environments rather than the Azure infrastructure developed during Sprint 3.

---

## Resolution

Completed the following actions:

- Restored `.pre-commit-config.yaml`
- Installed Git hooks using:

```bash
pre-commit install
```

- Allowed the hooks to automatically fix formatting issues.
- Restaged modified files.
- Identified placeholder Terraform directories that require completion in future sprints.
- Planned repository-wide quality gate cleanup before merging to `main`.

---

## Validation

Executed successfully:

```bash
pre-commit install
```

```bash
terraform fmt
```

```bash
terraform validate
```

The remaining failures were limited to incomplete placeholder modules and environments.

---

## Lessons Learned

Introducing automated quality gates early significantly improves repository quality.

Pre-commit is not only a validation tool—it can automatically correct formatting issues before code reaches version control.

Repository-wide linters also validate unfinished directories, making it important to distinguish between completed modules and future scaffolding.

---

## Interview Talking Points

While implementing repository quality gates, I introduced pre-commit with Terraform, TFLint, and YAML validation hooks.

The first execution exposed formatting inconsistencies and repository-wide lint warnings from placeholder infrastructure.

Instead of disabling the checks, I analyzed each warning, corrected formatting automatically, and documented which findings represented technical debt for future sprints versus genuine implementation defects.

This established a CI-ready quality gate for the repository.
