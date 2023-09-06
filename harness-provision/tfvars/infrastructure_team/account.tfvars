remote_state = {
  workspace = "devsecops"
  bucket    = "crizstian-terraform"
  prefix    = "cristian-harness-ng"
}

organization = "Cristian_Labs"
project      = "Infrastructure Team"

harness_platform_default_connectors = {
  aws_connector        = "cristian_aws"
  docker_connector     = "cristian_docker"
  gcp_connector        = "cristian_gcp"
  github_connector     = "cristian_github"
  gitlab_connector     = "cristian_gitlab"
  kubernetes_connector = "cristian-k8s-tf"
}
