provider "aws" {
  region = "eu-west-1"
}

data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = "devops-urjc-state"
    key     = "terraform/devops-swarm-state/terraform.tfstate"
    region = "eu-west-1"
  }
}

output "cluster" {
  value = try(data.terraform_remote_state.cluster.outputs.public_ips, [])
  description = "Cluster infra data"
}
