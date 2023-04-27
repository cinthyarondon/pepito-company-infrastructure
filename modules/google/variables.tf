variable "project" {
  type = string
  description = "The GCP project ID"
}

variable "region" {
  type = string
  description = "The GCP region to use"
}

variable "bucket" {
  type = string
  description = "The name of the GCS bucket to use as the backend"
}

variable "prefix" {
  type = string
  description = "The prefix to use for storing the Terraform state file in the GCS bucket"
}