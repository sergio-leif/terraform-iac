terraform {
  required_version = ">= 0.12.0"
}

module "az-rg" {
  source = "./modules/rg"
  location = var.location
  name = var.rg_name
  tags = "${merge(var.default_tags, map("type", "resource"))}"
}

#resource "azurerm_resource_group" "rg" {
#  name     = "myTFResourceGroup"
#  location = "westus2"
#}

module "application-vnet" {
  source              = "./modules/vnet"
  resource_group_name = "${module.az-rg.name}"
  location            = "${var.location}"
  tags                = "${merge(var.default_tags, map("type", "network"))}"
  vnet_name           = "${module.az-rg.name}-vnet"
  address_space       = "${var.address_space}"
}

module "application-subnets" {
  source              = "./modules/subnet"
  resource_group_name = "${module.az-rg.name}"
  location            = "${var.location}"
  tags                = "${merge(var.default_tags, map("type", "network"))}"
  vnet_name           = "${module.application-vnet.vnet_name}"

  subnets = [
    {
      name   = "${module.az-rg.name}-subnet"
      prefix = "${var.subnet}"
    }
  ]
}
module "vmss" {
  source              = "./modules/vmss"
  resource_group_name = "${module.az-rg.name}"
  location            = "${var.location}"
  tags                = "${merge(var.default_tags, map("type", "vmss"))}"
  saname              = "${var.application}${var.environment}"
  capacity            = "${var.capacity}"
  subnet_id           = "${module.application-subnets.vnet_subnets}"
}
