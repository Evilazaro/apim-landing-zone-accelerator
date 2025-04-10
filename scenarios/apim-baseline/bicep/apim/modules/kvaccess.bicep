param keyVaultName            string
param managedIdentity         object   

resource accessPolicyGrant 'Microsoft.KeyVault/vaults/accessPolicies@2024-12-01-preview' = {
  name: '${keyVaultName}/add'
  properties: {
    accessPolicies: [
      {
        objectId: managedIdentity.properties.principalId
        tenantId: managedIdentity.properties.tenantId
        permissions: {
          secrets: [ 
            'get' 
            'list'
          ]
          certificates: [
            'get'
            'list'
          ]
        }                  
      }
    ]
  }
}
