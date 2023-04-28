variable "project_id" {}
variable "region" {}
variable "enable_apis" {}
variable "domain" {}
variable "zone" {}
variable "app_names" {
  default = ["nodejs", "react", "spring", "monitor"]
}