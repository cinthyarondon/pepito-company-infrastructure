locals {
  env = "dev"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "../../modules/network"

  project = var.project_id
  region  = var.region
  network_name = var.network_name
  subnet_name            = var.subnet_name
  subnet_cidr            = var.subnet_cidr
  firewall_rule_name     = var.firewall_rule_name
  firewall_rule_protocol = var.firewall_rule_protocol
  firewall_rule_ports    = var.firewall_rule_ports
}