# Sprint 02 – Azure Enterprise Networking

## Objective

Build a reusable Azure networking module.

## Deliverables

- Resource Group
- VNet
- AKS Subnet
- Shared Services Subnet
- Azure Bastion Subnet
- NSGs
- Route Table
- Outputs

## Challenges

- Azure Provider Registration (409 Conflict)
- Module variable mismatches
- Resource naming corrections
- Backend configuration

## Lessons Learned

- Difference between root modules and reusable modules
- Implicit dependency graph
- Azure Resource Providers
- Remote state locking
- Module outputs
- Provider version pinning

## Validation

- terraform fmt {Success}
- terraform validate {Success}
- terraform plan {Success}

## Next Sprint

Deploy the network and begin AKS platform provisioning.
