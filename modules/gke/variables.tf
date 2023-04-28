variable "project_id" {
  type          = string
  description   = "The ID of the project"
}

variable "cluster_name" {
  type = string
  description = "The GKE cluster name"
}

variable "zone" {
  type = string
  description = "The GKE cluster zone"
}

variable "env" {
  type = string
  description   = "The environment"
}

variable "nodes_name" {
  type = string
  description = "Nodes name"
}

variable "vm_type" {
  type = string
  description = "The type of virtual machine"
}

variable "network_name" {
  type        = string
  description = "The name of the VPC network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
}

