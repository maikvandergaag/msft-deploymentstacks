targetScope = 'subscription'

metadata info = {
  title: 'Main file for demo 01'
  author: 'Maik van der Gaag'
}

metadata description = '''
Deployment file that deploy's two resource group with a storage account
'''

param name string

param location string = deployment().location 


resource rg1 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'mvp-rg-${name}-rg1'
  location: location
}

resource rg2 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'mvp-rg-${name}-rg2'
  location: location
}

module str1 'storageaccount.bicep' = {
  name: 'deployment-str1'
  scope: rg1
  params: {
    name: '${name}-st1'
    location: location
    env:'dev'
  }
}

module str2 'storageaccount.bicep' = {
  name: 'deployment-str2'
  scope: rg2
  params: {
    name: '${name}-st2'
    location: location
    env: 'dev'
  }
}
