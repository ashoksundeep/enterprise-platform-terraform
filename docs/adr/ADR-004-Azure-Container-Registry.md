# ADR-004: Azure Container Registry

## Status

Accepted

## Context

The Enterprise Platform requires a secure, scalable and highly available container registry to store application images before deployment into Azure Kubernetes Service (AKS).

## Decision

Azure Container Registry (ACR) has been selected because:

- Native Azure integration
- Managed identity support
- Azure RBAC integration
- Private Link support
- Geo-replication (Premium SKU)
- Image vulnerability scanning support

## Consequences

The platform will use ACR as the central image repository for:

- Platform services
- Microservices
- GitHub Actions pipelines
- ArgoCD deployments

Future work includes:

- Private Endpoints
- Geo-replication
- Image retention policies
- Content Trust
