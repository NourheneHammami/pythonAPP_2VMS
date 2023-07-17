
#creation de log_analytics_workspace #VNet2

resource "azurerm_log_analytics_workspace" "log-workspace" {
  name                = "log-workspace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.rg-python-app.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

#terraform import azurerm_log_analytics_workspace.workspace1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.OperationalInsights/workspaces/workspace1
