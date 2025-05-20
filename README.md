# msft-deploymentstacks

This repository contains demo files for exploring and deploying Azure Deployment Stacks using Bicep and PowerShell scripts. The demos cover resource group, subscription, and management group scopes, as well as deny settings and stack deletion scenarios.

## Repository Structure

- **0 - introduction/**  
  Introductory demo for deploying a storage account to a resource group.
- **1 - subscription scope stack/**  
  Demonstrates deploying resources at the subscription scope, including resource groups and a storage account module.
- **3 - deny settings/**  
  Shows how to use deny settings with deployment stacks.
- **4 - management groups/**  
  Example of deploying stacks at the management group scope.

## Getting Started

### Prerequisites

- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- [Bicep CLI](https://learn.microsoft.com/azure/azure-resource-manager/bicep/install)
- Sufficient Azure permissions to deploy resources at the required scopes

### Usage

Each folder contains a `main.bicep` file and a PowerShell script to deploy the stack. Example usage:

```powershell
# Set the Azure subscription
az account set --subscription <your-subscription-id>

# Create a resource group (if needed)
az group create --name 'mvp-rg-stack-01' --location 'westeurope'

# Deploy a stack to a resource group
az stack group create --name 'stack-demo-01' `
                      --resource-group 'mvp-rg-stack-01' `
                      --template-file '.\0 - introduction\main.bicep' `
                      --parameters '.\0 - introduction\main-param.bicepparam' `
                      --deny-settings-mode 'none'
```

Refer to the .ps1 scripts in each folder for more deployment scenarios and options.

### Bicep Configuration
The repository uses a bicepconfig.json file with strict analyzer rules and module aliases for best practices.

### Cleaning Up
To delete deployed stacks and resources, use the relevant az stack group delete, az stack sub delete, or az stack mg delete commands as shown in the scripts.

### License
Demo content for educational purpose