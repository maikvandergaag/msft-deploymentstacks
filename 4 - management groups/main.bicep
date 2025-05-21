targetScope = 'subscription'

metadata info = {
  title: 'Main file for demo 04'
  author: 'Maik van der Gaag'
}

metadata description = '''
Deployment file that deploy's resources to a management group
'''

param name string
param location string = deployment().location
param resourcesSubscription string
param monitoringSubscription string

module monitoringGroup 'rg.bicep' ={
  name: 'deploy-monitoringGroup'
  params:{
    name: name
    prefix: 'mct'
    location: location
  }
  scope: subscription(monitoringSubscription)
}

module applicationGroup 'rg.bicep' ={
  name: 'deploy-applicationGroup'
  params:{
    name: name
    prefix: 'sponsor'
    location: location
  }
  scope: subscription(resourcesSubscription)
}

module appInsights 'br/gaag:applicationinsights:0.0.1' = {
  name: 'deploy-appInsights'
  params: {
    environment: 'dev'
    logAnalyticsWorkspaceId: loganalytics.outputs.workspaceId
    name: name
  }
  dependsOn: [applicationGroup]
  scope: resourceGroup(resourcesSubscription, 'sponsor-rg-${name}')
}

module loganalytics 'br/gaag:loganalytics:0.0.1' = {
  name: 'deploy-loganalytics'
  params: {
    environment: 'dev'
    name: name
  }
  dependsOn: [monitoringGroup]
  scope: resourceGroup(monitoringSubscription, 'mct-rg-${name}')
}
