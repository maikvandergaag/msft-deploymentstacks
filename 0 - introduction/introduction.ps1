
#principal - demo user 69995275-0992-4318-ab63-9f8d64c007c6 - demo@familie-vandergaag.nl 
#principal - self f275e010-27ad-4b3b-8c33-e9aac30fded4

az account set --subscription a61be14b-136e-44e9-a88e-187fa0384d06

az group create --name 'mvp-rg-stack-01' --location 'westeurope'

az stack group create --name 'stack-demo-introduction' `
                      --resource-group 'mvp-rg-stack-01' `
                      --template-file '.\0 - introduction\main.bicep' `
                      --parameters '.\0 - introduction\main-param.bicepparam' `
                      --action-on-unmanage 'deleteAll' `
                      --deny-settings-mode 'none'

# Stack delete and all included resources, resource groups and subscriptions
az stack group delete --name 'stack-demo-introduction' --resource-group 'mvp-rg-stack-01' --action-on-unmanage deleteAll

# Stack delete and all included resources set subscription and management groups unmanaged
az stack group delete --name 'stack-demo-introduction' --resource-group 'mvp-rg-stack-01' --action-on-unmanage deleteResources

# Stack delete and unmanage resources
az stack group delete --name 'stack-demo-introduction' --resource-group 'mvp-rg-stack-01' --action-on-unmanage detachAll