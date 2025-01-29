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
    subscription_id = "57c15aa0-0560-43fc-91cf-2a23e9f7e0e9"
}