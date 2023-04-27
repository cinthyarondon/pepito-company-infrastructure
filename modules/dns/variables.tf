#variable "app_names" {
#  type    = list(string)
#  #default = ["app1", "app2", "app3", "monitor"]
#}

variable "project_id" {
  type          = string
  description   = "The ID of the project"
}

variable "region" {
  type          = string 
  description   = "The region of the project"
}

variable "environment_name" {
  type    = string
  #default = ["dev", "stage", "prod"]
}

variable "zone_name" {
  type        = string
  description = "The DNS zone name"
}

variable "domain" {
  type        = string
  description = "The domain name"
}

#variable "record_type" {
#  type        = string
#  description = "DNS record type"
#  default     = "A"
#}

#variable "ttl" {
#  type        = number
#  description = "TTL (time to live) of the DNS record"
#  default     = 300
#}

variable "address_name" {
  type = string
}

