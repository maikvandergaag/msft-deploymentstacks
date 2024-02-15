metadata info = {
  title: 'Storage Account Module'
  version: '1.0.3'
  author: 'Maik van der Gaag'
}

metadata description = '''
Module for creating a storage account
'''

@description('The name of the storageaccount will be in the format azstr[name][environment]')
param name string

@description('The location of the storageaccount')
param location string = resourceGroup().location

@description('The SKU of the storage account')
param storageSKU string = 'Standard_LRS'
@allowed([
  'tst'
  'acc'
  'prd'
  'dev'
])
@description('The environment were the service is beign deployed to (tst, acc, prd, dev)')
param env string

var storageName = toLower('str${take(replace(name, '-',''),15)}${env}')

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
}

output name string = storage.name
