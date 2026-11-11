#!/usr/bin/env bash
# Starts or deallocates every VM in a resource group.
# Deallocating (rather than just stopping) releases the compute so it is no longer billed.
# Usage: ./start-stop-vms.sh <start|stop> <resource-group>
set -euo pipefail

if [ $# -ne 2 ] || { [ "$1" != "start" ] && [ "$1" != "stop" ]; }; then
  echo "Usage: $0 <start|stop> <resource-group>" >&2
  exit 1
fi

ACTION="$1"
RG="$2"

IDS=$(az vm list --resource-group "$RG" --query "[].id" --output tsv)

if [ -z "$IDS" ]; then
  echo "No VMs found in resource group '$RG'."
  exit 0
fi

if [ "$ACTION" = "start" ]; then
  az vm start --ids $IDS
else
  az vm deallocate --ids $IDS
fi

az vm list --resource-group "$RG" --show-details \
  --query "[].{name:name, state:powerState}" --output table
