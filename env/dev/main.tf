terraform {
  backend "gcs" {
    bucket = "pepito-company-dev"
    prefix = "env/dev"
  }
}

module "google" {
  source  = "../../modules/google"
  project = "pepito-company-dev"
  region  = "us-central1"
}

locals {
  env         = "dev"
  project_id  = "pepito-company-dev"
  region      = "us-central1"
  enable_apis = ["dns.googleapis.com", 
                "compute.googleapis.com",
                "container.googleapis.com"]
}

resource "google_project_service" "apis" {
  project                    = "${local.project_id}"
  for_each                   = toset(local.enable_apis)
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}

module "network" {
  source                 = "../../modules/network"

  project_id             = "${local.project_id}"
  region                 = "${local.region}"
  network_name           = "${local.env}-vpc"
  subnet_name            = "${local.env}-subnet"
  subnet_cidr            = "192.168.0.0/16"
  firewall_rule_name     = "${local.env}-firewall"
  firewall_rule_protocol = "tcp"
  firewall_rule_ports    = ["80", "443"]
  env                    = "${local.env}"
}

module "dns" {
  source           = "../../modules/dns"

  project_id       = "${local.project_id}"
  region           = "${local.region}"
  zone_name        = "${local.env}-dns-zone"
  environment_name = "${local.env}"
  domain           = "pepitocompany.com."
  address_name     = "${local.env}-address"
}

module "gke" {
  source = "../../modules/gke"

  project_id = "${local.project_id}"
  cluster_name = "${local.env}-cluster"
  cluster_zone = "us-central1-c"
  env = "${local.env}"
  network_name   = module.network.network_name
  subnet_name    = module.network.subnet_name
}

output "firewall_rule_protocol" {
  value = module.network.firewall_rule_protocol
}

output "firewall_rule_ports" {
  value = module.network.firewall_rule_ports
}