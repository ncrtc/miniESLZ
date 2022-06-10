param location string
param logAnalyticsName string

//required
param tags object

resource createLogAnalytics 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: logAnalyticsName
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}
