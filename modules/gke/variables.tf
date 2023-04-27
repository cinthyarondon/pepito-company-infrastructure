variable "project_id" {
  type          = string
  description   = "The ID of the project"
}

variable "cluster_name" {
  type = string
  description = "The GKE cluster name"
}

variable "cluster_zone" {
  type = string
  description = "The GKE cluster zone"
}

variable "env" {
  type = string
  description   = "the environment"
}

#variable "nodes_name" {
#  type = string
#  description = "The GKE cluster name"
#}

#variable "vm_type" {
#  type = string
#  description = "The GKE cluster name"
#}

variable "network_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "The CIDR range for the subnet"
}

variable "firewall_rule_name" {
  type        = string
  description = "The name of the firewall rule"
}

variable "firewall_rule_protocol" {
  type        = string
  description = "The protocol for the firewall rule"
}

variable "firewall_rule_ports" {
  type        = list(string)
  description = "The list of ports for the firewall rule"
}

variable "region" {
  type          = string 
  description   = "The region of the project"
}

variable "firewall_rules" {
  type = list(object({
    name           = string
    protocol    = string
    ports      = list(string)
  }))
}