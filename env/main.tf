resource "azurerm_resource_group" "myrg" {
  name     = "AngularT19"
  location = "West Europe"
}

resource "azurerm_service_plan" "myasp" {
  name                = "nextopsajaspt19"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "myapp" {
  name                = "nextopsajwat19"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_service_plan.myasp.location
  service_plan_id     = azurerm_service_plan.myasp.id

  site_config {
    application_stack {
      node_version = "20-lts"
    }
  }
}
