locals {
  env = "dev"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "../../modules/network"

  project_id = "pepito-dev"
  region = "us-central1"
  network_name = "${local.env}-vpc"
}