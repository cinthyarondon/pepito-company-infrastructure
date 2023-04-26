provider "google" {
  project = var.project
  region  = var.region
}

required_providers {
  google = {
    source  = "hashicorp/google"
    version = "4.25.0"
  }
}