variable "project_id" {
  type          = string
  description   = "The ID of the project"
}

variable "region" {
  type          = string 
  description   = "The region"
}

variable "network_name" {
  type          = string
  description   = "The network name"
}

variable "subnet_name" {
  type          = string
  description   = "The subnet name"
}

variable "subnet_cidr" {
  type          = string
  description   = "The subnet IP address range"
}

variable "firewall_rule_name" {
  type          = string
  description   = "The firewall rule name"
}

variable "firewall_rule_protocol" {
  type          = string
  description   = "Protocol allowed in firewall rule"
}

variable "firewall_rule_ports" {
  type          = list(string)
  description   = "Ports allowed in the firewall rule"
}