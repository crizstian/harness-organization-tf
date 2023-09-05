terraform {
  backend "gcs" {}
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  lower   = true
}


data "terraform_remote_state" "global" {
  backend   = "gcs"
  workspace = "devsecops"

  config = {
    bucket = var.remote_state.bucket
    prefix = var.remote_state.prefix
  }
}

data "terraform_remote_state" "state" {
  backend   = "gcs"
  workspace = var.remote_state.workspace

  config = {
    bucket = var.remote_state.bucket
    prefix = var.remote_state.prefix
  }
}
