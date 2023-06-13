resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name_prefix}-rg"
  location = "${local.location}"
  tags = local.common_tags
}

resource "azurerm_storage_account" "static_storage" {
  name                     = "${local.storage_name}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }

  tags = local.common_tags
}