
param location string = resourceGroup().location

param name string

resource str 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: toLower('str${name}')
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageAccountName string = str.name
output storageAccountResourceId string = str.id
