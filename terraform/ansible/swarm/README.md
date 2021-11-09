# Use ansible to configure the Swarm cluster

In this folder you have the ansible playbooks to create and destroy a swarm cluster.

You need to create first the EC2 instances using Terraform and update the file
`hosts.ini` with the public ips of the instances.

To create the swarm cluster:

```shell
ansible-playbook -i hosts.ini -u ubuntu create_swarm.yml
```

To destroy the cluster:

```shell
ansible-playbook -i hosts.ini -u ubuntu destroy_swarm.yml 
```

