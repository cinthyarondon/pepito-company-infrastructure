data "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  depends_on = [
    data.google_project_service.compute
  ]

  count = length(data.google_project_service.compute.versions) == 0 ? 1 : 0
}

resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "firewall_rules" {
  name          = var.firewall_rule_name
  network       = google_compute_network.vpc_network.self_link
  allow {
    protocol    = var.firewall_rule_protocol
    ports       = var.firewall_rule_ports
  }
}