#!/bin/sh

# Terraform install
wget -q https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
unzip -o terraform_1.0.11_linux_amd64.zip -d ~

# Use Terraform to collect the cluster ips
cd terraform/pipeline
~/terraform init
~/terraform apply -auto-approve
~/terraform output | grep '"' | awk -F '"' 'BEGIN {i=1; print "[cluster]"} {print "node0" i++ " ansible_host="$2}' > ../../terraform/ansible/hosts.ini
cd ../..

# Ansible configuration
mkdir ~/.ssh

echo $VAULT_PASS > ~/vault_passowrd_file.txt

ansible-vault decrypt \
  --vault-password-file=~/vault_passowrd_file.txt terraform/ansible/id_rsa_devops_encrypted \
  --output=~/.ssh/id_rsa

rm ~/vault_passowrd_file.txt

# Use Ansible to configure the cluster
ansible-playbook -u ubuntu -i terraform/ansible/hosts.ini terraform/ansible/swarm/destroy_swarm.yml

# Use Terraform to destroy the cluster
cd terraform/terraform_aws
~/terraform init
~/terraform destroy -auto-approve
