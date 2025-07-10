output "vm_id" {
  description = "ID of the VM"
  value       = azurerm_linux_virtual_machine.csi_vm.id
}

output "vm_name" {
  description = "Name of the VM"
  value       = azurerm_linux_virtual_machine.csi_vm.name
}

output "public_ip" {
  description = "Public IP address (if enabled)"
  value       = var.enable_public_ip ? azurerm_public_ip.csi_public_ip[0].ip_address : null
}
