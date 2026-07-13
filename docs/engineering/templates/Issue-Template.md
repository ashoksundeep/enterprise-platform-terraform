# Terraform Issues

---

# Issue Template

## Issue Number

## Sprint

## Date

## Component

## Problem

## Error

## Root Cause

## Investigation

## Solution

## Validation

## Commands Used

## Lessons Learned

## Interview Talking Points

---

# Issue 001

Sprint:
Sprint 3

Component:
Azure Container Registry

Problem

Terraform returned:

Unsupported argument

resource_group_name

Root Cause

The reusable ACR module contained empty Terraform files.

Investigation

Verified module directory.

cat variables.tf

cat main.tf

cat outputs.tf

All files were empty.

Solution

Recreated the module interface and resource definitions.

Validation

terraform validate

Success

Lessons Learned

Terraform validates module interfaces before planning infrastructure.

Interview Talking Point

Reusable modules must explicitly declare every variable accepted from the caller. Missing declarations result in unsupported argument errors.

---

# Issue 002

Problem

Terraform returned

Unsupported block

retention_policy

Root Cause

Assumed every Checkov recommendation mapped directly to Terraform resources.

Investigation

Validated AzureRM Provider Schema.

terraform providers

terraform providers schema

Solution

Removed unsupported configuration.

Created a security backlog.

Lessons Learned

Security scanners recommend controls, but implementation depends on provider support.

Interview Talking Point

Always validate security recommendations against the Terraform provider schema before implementation.

---

# Issue 003

Problem

Seven Checkov findings.

Decision

Categorized findings into

Implemented

Planned

Deferred

Reason

Enterprise features require

Premium SKU

Private Endpoints

Defender

Geo Replication

Azure Policy

# Issue 006

## Sprint

Sprint 3

## Component

Azure Container Registry

## Problem

Terraform plan succeeded, but Terraform apply failed with:

```
public_network_access_enabled can only be disabled for a Premium SKU
```

## Investigation

Validated:

- Terraform module variables
- Live environment variables
- Terraform provider schema
- AzureRM documentation
- Terraform execution plan

Observed that Terraform generated a valid plan, but Azure rejected the API request during resource creation.

## Root Cause

Azure Container Registry only supports disabling public network access on the Premium SKU.

Although Terraform accepted:

```
public_network_access_enabled = false
```

Azure rejected the request because the deployment used the Standard SKU.

## Resolution

For Development:

```
sku = "Standard"
public_network_access_enabled = true
```

For Production:

```
sku = "Premium"
public_network_access_enabled = false
```

Updated the reusable module to support different capabilities based on SKU.

## Lessons Learned

Terraform validation and Azure service validation are different.

Passing Terraform validation does not guarantee that the Azure service accepts the configuration.

Always validate cloud provider limitations.

## Interview Talking Point

During implementation I discovered that several Azure Container Registry features are SKU-dependent.

Terraform generated a valid execution plan, but Azure rejected the deployment because disabling public network access requires the Premium SKU.

I redesigned the reusable module so environments can use different SKUs while automatically enabling only supported capabilities.

Future Sprint

Sprint 5

Sprint 6

Sprint 8
