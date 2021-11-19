#!/bin/sh

mkdir ~/.ssh

echo $VAULT_PASS > /vault_passowrd_file.txt

ansible-vault decrypt \
  --vault-password-file=/vault_passowrd_file.txt /id_rsa_encrypted \
  --output=~/.ssh/id_rsa

chmod 0600 ~/.ssh/id_rsa

ansible-playbook -i /ansible/hosts /ansible/deploy.yml