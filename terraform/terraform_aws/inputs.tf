variable "key_name" {
  type = string
  default = "ssh_public_key"
}

variable "tag" {
  type = string
  default = "swarm"
}

variable "cluster_size" {
  type = number
  description = "Number of nodes in the cluster"
  default = 3
}