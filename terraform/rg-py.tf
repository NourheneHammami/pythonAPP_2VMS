
#Notre Ressource Groupe

resource "azurerm_resource_group" "rg-python-app" {
  name     = "rg-python-app"
  location = "West Europe"
}


#terraform import azurerm_resource_group.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1
