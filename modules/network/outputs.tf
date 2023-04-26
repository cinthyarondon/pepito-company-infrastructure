output "network_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "subnet_cidr" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}

output "firewall_rule_name" {
  value = google_compute_firewall.firewall_rules.name
}

output "firewall_rule_protocol" {
  value = google_compute_firewall.firewall_rules.allow.*.protocol
}

output "firewall_rule_ports" {
  value = google_compute_firewall.firewall_rules.allow.*.ports
}