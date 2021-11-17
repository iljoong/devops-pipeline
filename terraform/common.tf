# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = var.azure.subscription_id
  client_id       = var.azure.client_id
  client_secret   = var.azure.client_secret
  tenant_id       = var.azure.tenant_id

  # use latest
  #version         = 2.1

  features {}
}

data "azurerm_resource_group" "tfrg" {
  name = var.resource.name
}

data "azurerm_key_vault" "tfkv" {
  name                = var.kv.name
  resource_group_name = var.kv.rgname
}

data "azurerm_key_vault_secret" "tfkvpwd" {
    name = var.kv.secretname
    key_vault_id  = data.azurerm_key_vault.tfkv.id
}

# Get virtual network
data "azurerm_subnet" "tfvnet" {
  name                 = var.net.subnetname
  virtual_network_name = var.net.vnetname
  resource_group_name  = var.resource.name
}

data "azurerm_user_assigned_identity" "tfmid" {
  name                = var.vm.idname
  resource_group_name = data.azurerm_resource_group.tfrg.name
}