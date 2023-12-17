targetScope = 'subscription'

param location string = 'westeurope' 


module str1 'storageaccount.bicep' = {
  name: 'deployment-str1'
  scope: resourceGroup('sponsor-rg-rg1')
  params: {
    name: 'stackstr1'
    location: location
  }
}

module str2 'storageaccount.bicep' = {
  name: 'deployment-str2'
  scope: resourceGroup('sponsor-rg-rg2')
  params: {
    name: 'stackstr2'
    location: location
  }
}

module str3 'storageaccount.bicep' = {
  name: 'deployment-str3'
  scope: resourceGroup('sponsor-rg-rg2')
  params: {
    name: 'stackstr3'
    location: location
  }
}
