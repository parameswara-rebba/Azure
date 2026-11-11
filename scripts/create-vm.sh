#!/usr/bin/env bash
# Creates a resource group and an Ubuntu VM with SSH access.
# Usage: ./create-vm.sh <resource-group> <vm-name> [location]
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <resource-group> <vm-name> [location]" >&2
  exit 1
fi

RG="$1"
VM="$2"
LOCATION="${3:-eastus}"

az group create --name "$RG" --location "$LOCATION" --output none

az vm create \
  --resource-group "$RG" \
  --name "$VM" \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username azureuser \
  --generate-ssh-keys \
  --output none

IP=$(az vm show --resource-group "$RG" --name "$VM" --show-details --query publicIps --output tsv)

echo "VM '$VM' created in '$RG' ($LOCATION)."
echo "Connect with: ssh azureuser@$IP"
echo "Delete everything with: az group delete --name $RG --yes"
