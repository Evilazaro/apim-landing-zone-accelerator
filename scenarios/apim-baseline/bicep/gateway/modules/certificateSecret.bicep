param keyVaultName string
param secretName   string

resource keyVaultCertificate 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' existing = {
  name: '${keyVaultName}/${secretName}'
}

output secretUri string = keyVaultCertificate.properties.secretUriWithVersion
