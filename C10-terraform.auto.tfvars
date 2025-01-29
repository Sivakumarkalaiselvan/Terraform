business_division = "HR"
Environment = "Dev"
vnet_address_space = ["10.1.0.0/16"]
websubnet_address_space = ["10.1.1.0/24"]

bastion_address_prefix = ["10.1.100.0/24"]


# When "".tfvars" file is not loaded, then try to change the file name as ".auto.tfvars"