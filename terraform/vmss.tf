# VMSS
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set

resource "azurerm_linux_virtual_machine_scale_set" "tfvmss" {

  name                = "${var.resource.prefix}pool"
  location            = data.azurerm_resource_group.tfrg.location
  resource_group_name = data.azurerm_resource_group.tfrg.name

  upgrade_mode        = "Manual"
  /*automatic_os_upgrade_policy = {
    disable_automatic_rollback  = true
    enable_automatic_os_upgrade = false
  }*/

  overprovision        = false

  sku                  = var.vm.size
  instances            = var.vm.count

  computer_name_prefix  = "${var.resource.prefix}pool"
  admin_username        = var.vm.admin_username
  admin_password        = data.azurerm_key_vault_secret.tfkvpwd.value //var.vm.admin_password
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb    = 64
  }

  //source_image_id = var.vm.osimageuri
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  extension {
      name      = "CustomScript"
      publisher = "Microsoft.Azure.Extensions"
      type      = "CustomScript"
      type_handler_version = "2.1"
      automatic_upgrade_enabled  = false
      auto_upgrade_minor_version = false
      protected_settings = jsonencode({
          "script" = base64encode(file("../script/script.sh"))
      })
  }

  network_interface {
    name        = "networkinterface"
    primary     = true

    ip_configuration {
      name      = "ipconfig"
      primary   = true
      subnet_id = data.azurerm_subnet.tfvnet.id
    }
  }

  identity {
      type = "UserAssigned"
      identity_ids = [data.azurerm_user_assigned_identity.tfmid.id]
  }
}
