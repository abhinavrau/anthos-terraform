#!/bin/bash

export ARM_SUBSCRIPTION_ID=$(az account show --query "id" --output tsv)
export ARM_TENANT_ID=$(az account list --query "[?id=='${ARM_SUBSCRIPTION_ID}'].{tenantId:tenantId}" --output tsv)

echo -e "ARM_SUBSCRIPTION_ID is ${ARM_SUBSCRIPTION_ID}"
echo -e "ARM_TENANT_ID is ${ARM_TENANT_ID}"