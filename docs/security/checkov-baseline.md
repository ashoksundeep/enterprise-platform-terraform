# Checkov Baseline

## Azure Container Registry

### CKV_AZURE_139
Status: Planned
Sprint: Sprint 5

Reason:
Public network access will be disabled after implementing Private Endpoints.

---

### CKV_AZURE_165
Status: Planned
Sprint: Sprint 5

Reason:
Geo-replication requires Premium SKU and secondary region deployment.

---

### CKV_AZURE_166
Status: Planned
Sprint: Sprint 6

Reason:
Requires Microsoft Defender for Containers.

---

### CKV_AZURE_164
Status: Planned
Sprint: Sprint 6

Reason:
Image signing will be implemented using Cosign and GitHub Actions.

| Check ID | Status | Sprint | Reason |
|----------|--------|--------|--------|
| CKV_AZURE_139 | Implemented | Sprint 3 | Public networking disabled |
| CKV_AZURE_165 | Planned | Sprint 6 | Premium SKU + Geo replication |
| CKV_AZURE_166 | Planned | Sprint 8 | Defender for Containers |
| CKV_AZURE_164 | Planned | Sprint 8 | Cosign image signing |
| CKV_AZURE_233 | Planned | Sprint 6 | Premium SKU required |
| CKV_AZURE_237 | Implemented (where supported) | Sprint 3 | Dedicated data endpoint |
| CKV_AZURE_167 | Planned | Sprint 8 | Requires Azure capability beyond current Terraform resource |
