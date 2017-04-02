#!/bin/bash
##install azure cli
#curl -L https://aka.ms/InstallAzureCli | bash
#exec -l $SHELL

##install azure service principal tool
#npm install azure-sp-tool -g

##create service principal
#az login
#az account list
#azure-sp-tool create-sp

export RESOURCE_GROUP="PCF"
export LOCATION="westus"
#az group create --name $RESOURCE_GROUP --location $LOCATION
#export STORAGE_NAME="pcfdisks176"
#export STORAGE_NAME="pcfdeploymentdisks176"
#export STORAGE_NAME="xtrastrg6y2tyipuccdrs3"
#az provider register Microsoft.Storage
#az storage account create -l $LOCATION -g $RESOURCE_GROUP \
#    --sku Standard_LRS --kind Storage --name $STORAGE_NAME
#export CONNECTION_STRING=`az storage account show-connection-string --name $STORAGE_NAME --resource-group $RESOURCE_GROUP|jq -r ".connectionString"`
#az storage container create --name opsman-image \
#    --connection-string $CONNECTION_STRING
#az storage container create --name vhds \
#    --connection-string $CONNECTION_STRING
#az storage container create --name opsmanager \
#    --connection-string $CONNECTION_STRING
#az storage container create --name bosh \
#    --connection-string $CONNECTION_STRING
#az storage container create --name stemcell --public-access blob \
#    --connection-string $CONNECTION_STRING
#az storage table create --name stemcells --connection-string $CONNECTION_STRING
#
#export OPS_MAN_IMAGE_URL="https://opsmanagerwestus.blob.core.windows.net/images/ops-manager-1.10.0.vhd"
#
##--name opsmanager
#az storage blob copy start --source-uri $OPS_MAN_IMAGE_URL \
#    --connection-string  $CONNECTION_STRING \
#    --destination-container opsman-image \
#    --destination-blob image.vhd 
#
#az storage blob show --container-name opsman-image --name  image.vhd --connection-string $CONNECTION_STRING


az network nsg create --resource-group $RESOURCE_GROUP --name pcf-nsg --location $LOCATION
az network nsg rule create --resource-group $RESOURCE_GROUP --nsg-name pcf-nsg --name internet-to-lb \
    --protocol Tcp --priority 100 --destination-port-range '*'

