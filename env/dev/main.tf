terraform {
  backend "gcs" {
    bucket = "pepito-co-dev"
    prefix = "env/dev"
  }
}

module "google" {
  source  = "../../modules/google" 
  project = var.project_id
  region  = var.region
}



locals {
  env = "dev"
}

resource "google_project_service" "apis" {
  project                    = var.project_id
  for_each                   = toset(var.enable_apis)
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}

module "dns" {
  source           = "../../modules/dns"

  project_id       = var.project_id
  region           = var.region
  zone_name        = "${local.env}-dns-zone"
  environment_name = "${local.env}"
  domain           = var.domain
  address_name     = "${local.env}-address"

  depends_on = [
    google_project_service.apis
  ]  
}

module "network" {
  source                 = "../../modules/network"

  project_id             = var.project_id
  region                 = var.region
  network_name           = "${local.env}-vpc"
  subnet_name            = "${local.env}-subnet"
  subnet_cidr            = "192.168.0.0/16"
  firewall_rule_name     = "${local.env}-firewall"
  firewall_rule_protocol = "tcp"
  firewall_rule_ports    = ["80", "443"]
  env                    = "${local.env}"

  depends_on = [
    google_project_service.apis
  ]
}

module "gke" {
  source = "../../modules/gke"

  project_id = var.project_id
  cluster_name = "${local.env}-cluster"
  zone = var.zone
  env = "${local.env}"

  network_name = module.network.network_name
  subnet_name  = module.network.subnet_name

  nodes_name = "${local.env}-nodes"
  vm_type = "e2-medium"

  depends_on = [
    module.network
  ]
}

output "firewall_rule_protocol" {
  value = module.network.firewall_rule_protocol
}

output "firewall_rule_ports" {
  value = module.network.firewall_rule_ports
}