# Core concepts

## Resource hierarchy

```text
Microsoft Entra tenant
└── Management groups
    └── Subscriptions
        └── Resource groups
            └── Resources
```

- **Tenant**: one instance of Microsoft Entra ID (formerly Azure Active Directory); the identity boundary.
- **Management group**: groups subscriptions so policy and access can be applied to many at once.
- **Subscription**: billing and quota boundary.
- **Resource group**: a container for resources that share a lifecycle. Deleting the group deletes
  everything in it. A resource belongs to exactly one group.
- **Resource**: a single service instance (VM, storage account, virtual network, ...).

Policy and role assignments made at a higher level are inherited by everything below.

## Regions and availability

- **Region**: a set of datacenters in one geographic area, for example `eastus` or `centralindia`.
- **Availability zone**: physically separate datacenters inside a region.
- **Region pair**: two regions in the same geography used for disaster recovery.
- **Availability set**: spreads VMs across fault domains and update domains inside one datacenter.

## Access control (RBAC)

A role assignment = **who** (security principal) + **what** (role) + **where** (scope).

| Built-in role | Can do |
|---|---|
| Owner | Everything, including granting access |
| Contributor | Create and manage resources, but not grant access |
| Reader | View only |
| User Access Administrator | Manage access only |

## Governance tools

- **Azure Policy**: enforce or audit rules, for example allowed regions or required tags.
- **Resource locks**: `CanNotDelete` or `ReadOnly`, to prevent accidental changes.
- **Tags**: name/value pairs for cost reporting and organisation.

## Ways to deploy

Portal, Azure CLI, Azure PowerShell, ARM templates, Bicep, Terraform.
