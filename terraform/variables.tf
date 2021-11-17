# azure service principal info
variable azure {
  default = {
    subscription_id = "_add_here_"
    # client_id or app_id
    client_id       = "_add_here_"
    client_secret   = "_add_here_"
    # tenant_id or directory_id
    tenant_id       = "_add_here_"
  }
}

variable vm {
  default = {
    admin_username = "_add_here_"
    admin_password = "_add_here_"
    admin_keydata  = "_add_here_"
    size           = "Standard_D2as_v4"
    count          = 1
    osimageuri     = "_add_here_"
    idname         = "_add_here_"
  }
}

variable net {
    default = {
      vnetname = "_add_here_"
      subnetname = "_add_here_"
    }
}

variable kv {
    default = {
      name = "_add_here_"
      secretname = "adminpassword"
      rgname = "_add_here_"
    }
}

variable resource {
    default = {
        name   = "_add_here_"
    }
}