terraform {
  backend "gcs" {
    bucket = "pepito-company-dev"
    prefix = "env/dev"
  }
}

module "google" {
  source = "../../modules/google"
  project = "pepito-company-dev"
  region = "us-central1"
}

locals {
  env = "dev"
  project_id = "pepito-company-dev"
  region = "us-central1"
}

module "network" {
  source = "../../modules/network"

  project_id = "${local.project_id}"
  region = "${local.region}"
  network_name = "${local.env}-vpc"
  subnet_name = "${local.env}-subnet"
  subnet_cidr = "192.168.0.0/16"
  firewall_rule_name = "${local.env}-firewall"
  firewall_rule_protocol = "tcp"
  firewall_rule_ports = ["80", "443"]
  env = "${local.env}"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${module.network.subnet_name}"
  ip_cidr_range = "${module.network.subnet_cidr}"
  network       = "${module.network.network_name}"
  region        = "${local.region}"
}

output "firewall_rule_protocol" {
  value = module.network.firewall_rule_protocol
}

output "firewall_rule_ports" {
  value = module.network.firewall_rule_ports
}