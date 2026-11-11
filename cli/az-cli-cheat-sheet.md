# Azure CLI cheat sheet

## Sign in and select a subscription

```bash
az login
az account list --output table
az account set --subscription "<name-or-id>"
az account show
```

## Output and queries

```bash
az vm list --output table              # table, json, tsv, yaml
az vm list --query "[].{name:name, rg:resourceGroup}" --output table
az configure --defaults group=my-rg location=eastus
```

## Resource groups

```bash
az group create --name my-rg --location eastus
az group list --output table
az resource list --resource-group my-rg --output table
az group delete --name my-rg --yes --no-wait   # deletes everything in the group
```

## Virtual machines

```bash
az vm create --resource-group my-rg --name my-vm --image Ubuntu2204 \
  --size Standard_B1s --admin-username azureuser --generate-ssh-keys
az vm list --resource-group my-rg --show-details --output table
az vm start      --resource-group my-rg --name my-vm
az vm stop       --resource-group my-rg --name my-vm   # still billed for compute
az vm deallocate --resource-group my-rg --name my-vm   # stops compute billing
az vm open-port  --resource-group my-rg --name my-vm --port 80
az vm delete     --resource-group my-rg --name my-vm --yes
```

## Networking

```bash
az network vnet create --resource-group my-rg --name my-vnet \
  --address-prefix 10.0.0.0/16 --subnet-name default --subnet-prefix 10.0.0.0/24
az network nsg create --resource-group my-rg --name my-nsg
az network nsg rule create --resource-group my-rg --nsg-name my-nsg --name allow-ssh \
  --priority 1000 --access Allow --protocol Tcp --destination-port-ranges 22
az network public-ip list --resource-group my-rg --output table
```

## Storage

```bash
az storage account create --resource-group my-rg --name mystorage123 --sku Standard_LRS
az storage container create --account-name mystorage123 --name data --auth-mode login
az storage blob upload --account-name mystorage123 --container-name data \
  --name file.txt --file ./file.txt --auth-mode login
az storage blob list --account-name mystorage123 --container-name data \
  --auth-mode login --output table
```

## AKS

```bash
az aks create --resource-group my-rg --name my-aks --node-count 2 --generate-ssh-keys
az aks get-credentials --resource-group my-rg --name my-aks
az aks stop  --resource-group my-rg --name my-aks
az aks start --resource-group my-rg --name my-aks
```

## Container registry

```bash
az acr create --resource-group my-rg --name myregistry123 --sku Basic
az acr login --name myregistry123
az acr repository list --name myregistry123 --output table
```

## Access control

```bash
az role assignment list --assignee <user-or-app-id> --output table
az role assignment create --assignee <user-or-app-id> --role Reader \
  --scope /subscriptions/<sub-id>/resourceGroups/my-rg
az ad sp create-for-rbac --name my-sp --role Contributor \
  --scopes /subscriptions/<sub-id>/resourceGroups/my-rg
```

## Help

```bash
az find "az vm"
az vm create --help
```
