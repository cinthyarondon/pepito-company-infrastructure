variable "enable_apis" {
  type = list(string)
  default = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "dns.googleapis.com"
  ]
}