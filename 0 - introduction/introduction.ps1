
#principal - demo user 69995275-0992-4318-ab63-9f8d64c007c6 - demo@familie-vandergaag.nl 
#principal - self f275e010-27ad-4b3b-8c33-e9aac30fded4

az account set --subscription f124b668-7e3d-4b53-ba80-09c364def1f3

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


# Stack delete but resources are not deleted (unmanaged resources)
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --yes

# Stack delete and all included resources, resource groups and subscriptions
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --delete-all --yes

# Stack delete and all included resources and resource groups
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --delete-resource-groups --yes

# Stack delete and all included resources
az stack group delete --name 'stack-demo-01' --resource-group 'mvp-rg-stack-01' --delete-resources --yes