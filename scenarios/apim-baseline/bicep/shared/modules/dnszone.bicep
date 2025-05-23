param vnetName string
param networkingResourceGroupName string
param domain string

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' existing = {
  name: vnetName
  scope: resourceGroup(networkingResourceGroupName)
}

resource dnsZone 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  name: domain
  location: 'global'
}

resource vnetLinks 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  name: vnetName
  parent: dnsZone
  location: 'global'
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    registrationEnabled: false
  }
}

output dnsZoneName string = dnsZone.name
output dnsZoneId string = dnsZone.id
output vnetLinksLink string = vnetLinks.id
