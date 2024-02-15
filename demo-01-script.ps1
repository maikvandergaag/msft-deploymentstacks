
#principal - demo user 69995275-0992-4318-ab63-9f8d64c007c6
#principal - self f275e010-27ad-4b3b-8c33-e9aac30fded4
#az account set --subscription a61be14b-136e-44e9-a88e-187fa0384d06

az group create --name 'mvp-rg-stack-01' --location 'westeurope'

az stack group create --name 'stack-demo-01' `
                      --resource-group 'mvp-rg-stack-01' `
                      --template-file '.\demo-01\main.bicep' `
                      --parameters '.\demo-01\main-param.bicepparam' `
                      --deny-settings-mode 'none'
                      
az stack group create --name 'stack-demo-01' `
                      --resource-group 'mvp-rg-stack-01' `
                      --template-file '.\demo-01\main.bicep' `
                      --parameters '.\demo-01\main-param.bicepparam' `
                      --deny-settings-mode 'denyWriteAndDelete' `
                      --deny-settings-excluded-principals '69995275-0992-4318-ab63-9f8d64c007c6' `
                      --deny-settings-excluded-actions 'Microsoft.Resources/tags/*'


# Stack delete but resources are not deleted (unmanaged resources)
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --yes

# Stack delete and all included resources, resource groups and subscriptions
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --delete-all --yes

# Stack delete and all included resources and resource groups
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --delete-resource-groups --yes

# Stack delete and all included resources
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --delete-resources --yes