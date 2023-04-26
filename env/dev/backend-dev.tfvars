terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.25.0"
    }
  }
  
  backend "gcs" {
    bucket = "pepito-dev-tfstate"
    prefix = "env/dev"
  }

  provider "google" {
    project = "pepito-company-dev"
    region  = "us-central1"
  }
}