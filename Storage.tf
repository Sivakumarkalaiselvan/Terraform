terraform{
required_version=">=1.0" 
required_providers{
    azurerm={
        source="hashicorp/azurerm"
        version=">=1.0.0"
    }
    random={
        source = "hashicorp/random"
        version = ">=3.0"
    }
}    
}
provider "azurerm"{ 
    features{}
    subscription_id ="8dbd13eb-c593-46e3-9c91-862635533188"
}

resource "random_string" "demo"{
    length=16
    upper=false
    special=false
}
resource "azurerm_resource_group" "myrg1"{
    name="my-rg1"
    location="East US"
}

resource "azurerm_storage_account" "mysa"{
    name= "mysa${random_string.demo.id}"
    resource_group_name= azurerm_resource_group.myrg1.name
    location = azurerm_resource_group.myrg1.location
    account_tier="Standard"
    account_replication_type = "GRS"
    #account_encryption_source="Microsoft.storage"
    tags={
      environment= "Stagging"
    }
}

