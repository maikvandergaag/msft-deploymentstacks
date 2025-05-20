targetScope = 'subscription'

param name string
param prefix string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2025-03-01' = {
  name: '${prefix}-rg-${name}'
  location: location
}

output rgName string = rg.name
