using './main.bicep'

param env = 'prd'
param name = 'integration-monitoring'
param resourcegroupName = 'monitoring'
param tags = {
  owner: 'maik@familie-vandergaag.nl'
  environment: env
  purpose: 'monitoring'
  version: '1.0.0'
}
