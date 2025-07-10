output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value = {
    for key, subnet in azurerm_subnet.subnets :
    key => subnet.id
  }
}
