variable "region" {
  default = "eu-west-1"
}

variable "tags_team" {
  default = "cig"
}

variable "app_name" {
  default = "cig-tf-data-transformation-bigquery"
}

variable "environment" {}

variable "project_name" {
  default = "data-transformation-bigquery"
}

variable "dpu" {
  default = 5
}

variable "domain_bucket" {}

variable "raw_bucket" {}

variable "raw_database" {
  default = "customerintelligence_raw"
}

variable "raw_bigquery_table" {
  default = "source_bigquery"
}
