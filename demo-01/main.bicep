metadata info = {
  title: 'Main file for demo 01'
  author: 'Maik van der Gaag'
}

metadata description = '''
Deployment file that deploy's a storage account to a resource group
'''

param name string
param location string = resourceGroup().location
var storageName = toLower('str${take(replace(name, '-',''),18)}')

resource str 'Microsoft.Storage/storageAccounts@2023-01-01' ={
  name: storageName
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
}

/* var storageName02 = toLower('str${take(replace(name, '-',''),18)}02')

resource str2 'Microsoft.Storage/storageAccounts@2023-01-01' ={
  name: storageName02
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
}
 */
