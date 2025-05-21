metadata info = {
  title: 'Main file for demo 03'
  author: 'Maik van der Gaag'
}

metadata description = '''
Deployment file that deploy's a unmanaged resources (storage account) to a resource group
'''

param name string
param location string = resourceGroup().location
var storageName = toLower('str${take(replace(name, '-',''),18)}')

resource str 'Microsoft.Storage/storageAccounts@2024-01-01' ={
  name: storageName
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
}
