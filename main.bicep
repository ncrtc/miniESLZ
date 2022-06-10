targetScope='subscription'

param rgName string
param location string
param storageAccountName string
param logAnalyticsName string

var tags = {
  'env': 'sandbox'
}

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: rgName
  location: location
  tags: tags
}

module createStorage 'storage.bicep' = {
  scope: newRG
  name: 'storageModule'
  params: {
    location: location
    storageAccountName: storageAccountName
    tags: tags
  }
}

module create 'LogAnalytics.bicep' = {
  scope: newRG
  name: 'logAnalyticsModule'
  params: {
    location: location
    logAnalyticsName: logAnalyticsName
    tags: tags
  }
}
