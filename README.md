# Azure

Notes, Azure CLI references and small scripts for Microsoft Azure.

## Notes

- [Core concepts](notes/core-concepts.md) — hierarchy, regions, resource groups, RBAC
- [Core services](notes/core-services.md) — compute, networking, storage, identity at a glance

## CLI

- [Azure CLI cheat sheet](cli/az-cli-cheat-sheet.md)

## Scripts

| Script | What it does |
|---|---|
| [create-vm.sh](scripts/create-vm.sh) | Creates a resource group and an Ubuntu VM with SSH access |
| [start-stop-vms.sh](scripts/start-stop-vms.sh) | Starts or deallocates every VM in a resource group |

The scripts need the [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
and a signed-in session (`az login`). They create or change real resources, which can cost money.
