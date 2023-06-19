resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  project       = var.project_id
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "firewall_rules" {
  name          = var.firewall_rule_name
  project       = var.project_id
  network       = google_compute_network.vpc_network.self_link
  allow {
    protocol    = var.firewall_rule_protocol
    ports       = var.firewall_rule_ports
  }
  source_tags   =  [ var.env ] 
}
