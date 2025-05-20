
#principal - demo user 69995275-0992-4318-ab63-9f8d64c007c6
#principal - self f275e010-27ad-4b3b-8c33-e9aac30fded4
az account set --subscription a61be14b-136e-44e9-a88e-187fa0384d06

#az group create --name 'mvp-rg-stack-01' --location 'westeurope'

az stack sub create --name 'stack-demo-02' `
                    --template-file '.\demo-02\main.bicep' `
                    --parameters '.\demo-02\main-param.bicepparam' `
                    --location 'westeurope' `
                    --deny-settings-mode 'none' `
                    --delete-resources --yes
                      
az stack sub create --name 'stack-demo-02' `
                    --template-file '.\demo-02\main.bicep' `
                    --parameters '.\demo-02\main-param.bicepparam' `
                    --location 'westeurope' `
                    --deny-settings-mode 'denyWriteAndDelete' `
                    --deny-settings-apply-to-child-scopes  `
                    --deny-settings-excluded-actions 'Microsoft.Resources/tags/*'
