targetScope = 'subscription'

param name string
param prefix string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: '${prefix}-rg-${name}'
  location: location
}

output rgName string = rg.name
