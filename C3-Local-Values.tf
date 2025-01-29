# Local Values
locals {
owners = var.business_division
environment = var.Environment 
resource_group_prefix = "${var.business_division}-${var.Environment}"
common_tags = {
    owners = local.owners
    environmnet = local.environment
}
}   
