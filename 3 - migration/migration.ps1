
az account set --subscription a61be14b-136e-44e9-a88e-187fa0384d06

az group create --name 'mvp-rg-unmanaged-resources' --location 'westeurope'

az deployment group create --name 'stack-migration' `
                           --resource-group 'mvp-rg-unmanaged-resources' `
                           --template-file '.\3 - migration\main.bicep' `
                           --parameters '.\3 - migration\main-param.bicepparam'
                      

az stack group create --name 'stack-migration' `
                      --resource-group 'mvp-rg-unmanaged-resources' `
                      --template-file '.\3 - migration\main.bicep' `
                      --parameters '.\3 - migration\main-param.bicepparam' `
                      --action-on-unmanage 'deleteAll' `
                      --deny-settings-mode 'denyWriteAndDelete' `
                      --deny-settings-excluded-principals '23aa11c6-ccfa-40ab-b4ba-ef39e73267a7'

