targetScope = 'subscription'

@allowed([
  'dev'
  'tst'
  'prd'
])
@description('The environment for the resources in this solution')
param env string = 'prd'

@description('The name for the resources in this solution')
param name string = 'integration-monitoring'

@description('The name of the resource group to deploy the resources into.')
param resourcegroupName string

param tags object

@description('Location for all resources.')
param location string = deployment().location

resource group 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: 'sponsor-rg-${resourcegroupName}-${env}'
  location: location
  tags: tags
}

module workspace './modules/loganalytics.bicep' = {
  name: 'workspace-deployment'
  params: {
    env: env
    name: name
    enableDeleteLock: true
    retentionInDays: 30
    location: location
    tags: tags
    sku:'PerGB2018'
  }
  scope: group
}

output logAnalyticsWorkspaceId string = workspace.outputs.workspaceId
output logAnalyticsWorkspaceName string = workspace.outputs.workspaceName
output resourceGroupName string = group.name
output resourceGroupId string = group.id
