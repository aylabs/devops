#!/bin/sh

# Terraform install
wget -q https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
unzip -o terraform_1.0.11_linux_amd64.zip -d ~

# Use Terraform to create the cluster
cd terraform/terraform_aws
~/terraform init
~/terraform apply -var="cluster_size=3" -auto-approve
~/terraform output | grep '"' | awk -F '"' 'BEGIN {i=1; print "[cluster]"} {print "node0" i++ " ansible_host="$2}' > ../../terraform/ansible/hosts.ini
cd ../..

# Wait until docker is installed in all the nodes
echo "Waiting 60s for docker install process in the cluster nodes"
sleep 60

# Ansible configuration
mkdir ~/.ssh

echo $VAULT_PASS > ~/vault_passowrd_file.txt

ansible-vault decrypt \
  --vault-password-file=~/vault_passowrd_file.txt terraform/ansible/id_rsa_devops_encrypted \
  --output=~/.ssh/id_rsa

rm ~/vault_passowrd_file.txt

# Use Ansible to configure the cluster
ansible-playbook -u ubuntu -i terraform/ansible/hosts.ini terraform/ansible/swarm/create_swarm.yml
