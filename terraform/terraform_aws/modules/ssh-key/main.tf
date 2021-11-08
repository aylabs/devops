resource "aws_key_pair" "admin_key" {
  key_name   = var.key_name
  public_key = var.public_key
}
