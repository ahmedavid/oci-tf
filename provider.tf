terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.120.0"
    }
  }

  backend "s3" {
    bucket                      = "leadreplay-terraform"
    key                         = "oci-david.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}

variable "tenancy_ocid" {}
variable "user_ocid" {}

variable "private_key_path" {
  type = string
  default = "./SSH_KEYS/key.pem"
}
variable "fingerprint" {}

variable "region" {
  type = string
  default = "eu-frankfurt-1"
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
}

provider "random" {}