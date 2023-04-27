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