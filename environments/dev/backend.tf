terraform {
  backend "gcs" {
    bucket = "pepito-dev-tfstate"
    prefix = "env/dev"
  }
}