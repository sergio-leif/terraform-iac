rg_name     = "test-rg"
application = "app-name"
environment = "test"
location    = "westeurope"
capacity    = 5

default_tags = {
  environment = "test"
  deployed_by = "terraform-user"
}

address_space = "10.125.0.0/16"
subnet        = "10.125.20.0/24"

subscription_id = "$AZURE_SUBSCRIPTION_ID"
client_id       = "$AZURE_CLIENT_ID"
client_secret   = "$AZURE_SECRET"
tenant_id       = "$AZURE_TENANT"