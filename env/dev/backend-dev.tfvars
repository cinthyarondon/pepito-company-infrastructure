terraform {
  backend "gcs" {
    bucket = "pepito-company-dev"
    prefix = "env/dev"
  }
}