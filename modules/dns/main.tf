resource "google_dns_managed_zone" "dns_zone" {
  name        = var.zone_name
  description = "DNS zone for ${var.environment_name} environment"

  dns_name    = "${var.environment_name}.${var.domain}"

  labels = {
    env = var.environment_name
  }
}

#resource "google_dns_record_set" "app_records" {
#  count        = length(var.app_names)
#  name         = "${var.app_names[count.index]}.${google_dns_managed_zone.dns_zone.dns_name}"
#  type         = var.record_type
#  ttl          = var.ttl
#  managed_zone = google_dns_managed_zone.dns_zone.name
#  rrdatas      = [google_compute_address.ip_address.address]
#}

resource "google_compute_address" "ip_address" {
  project      = var.project_id
  name         = var.address_name
  region       = var.region
  address_type = "EXTERNAL"
}