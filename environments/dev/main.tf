locals {
  env = "dev"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "../../modules/network"

  project_id = "pepito-dev"
  region = "us-central1"
  network_name = "${local.env}-vpc"
  subnet_name = "${local.env}-subnet"
  subnet_cidr = "192.168.0.0/16"
  firewall_rule_name = "${local.env}-firewall"
  firewall_rule_protocol = "tcp"
  firewall_rule_ports = ["80", "443"]
}