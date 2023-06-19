output "ip_address" {
  value = google_compute_address.ip_address.address
}

output "zone_name" {
  value = google_dns_managed_zone.dns_zone.name
}

output "dns_name" {
  value = google_dns_managed_zone.dns_zone.dns_name
}