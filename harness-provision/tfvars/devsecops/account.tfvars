remote_state = {
  workspace = "devsecops"
  bucket    = "crizstian-terraform"
  prefix    = "cristian_lab_account"
}

organization = "Cristian DevSecOps TF"
project      = "Organization Setup"

harness_platform_default_connectors = {
  aws_connector        = "cristian_aws"
  docker_connector     = "cristian_docker"
  gcp_connector        = "cristian_gcp"
  github_connector     = "cristian_github"
  gitlab_connector     = "cristian_gitlab"
  kubernetes_connector = "cristian-k8s-tf"
}
