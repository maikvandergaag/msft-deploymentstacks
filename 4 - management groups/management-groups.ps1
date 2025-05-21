
#principal - demo user 69995275-0992-4318-ab63-9f8d64c007c6
#principal - self f275e010-27ad-4b3b-8c33-e9aac30fded4
az account set --subscription f124b668-7e3d-4b53-ba80-09c364def1f3


az stack mg create --name 'stack-management-groups' `
                   --m 'Personal' `
                   --template-file '.\4 - management groups\main.bicep' `
                   --parameters '.\4 - management groups\main-param.bicepparam' `
                   --location 'westeurope' `
                   --action-on-unmanage 'deleteAll' `
                   --deny-settings-mode 'denyWriteAndDelete' `
                   --deny-settings-apply-to-child-scopes `
                   --deployment-subscription 'f124b668-7e3d-4b53-ba80-09c364def1f3'
                   