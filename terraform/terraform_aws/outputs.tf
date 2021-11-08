output "public_ip_1" {
  description = "The public IP address of the swam node"
  value       = aws_instance.swarm_node.public_ip
}
