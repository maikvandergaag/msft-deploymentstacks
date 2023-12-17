Login-AzAccount

Set-AzContext -Subscription "f124b668-7e3d-4b53-ba80-09c364def1f3"

New-AzResourceGroup -Name "sponsor-rg-stacks" -Location "westeurope"
New-AzResourceGroup -Name "sponsor-rg-rg1" -Location "westeurope"
New-AzResourceGroup -Name "sponsor-rg-rg2" -Location "westeurope"

New-AzSubscriptionDeploymentStack `
  -Name "stack-demo-01" `
  -Location "westeurope" `
  -TemplateFile ".\main.bicep" `
  -DeploymentResourceGroupName "sponsor-rg-stacks" `
  -DenySettingsMode "none"


Set-AzSubscriptionDeploymentStack `
  -Name "stack-demo-01" `
  -Location "westeurope" `
  -TemplateFile ".\main.bicep" `
  -DeploymentResourceGroupName "sponsor-rg-stacks" `
  -DenySettingsMode "none"