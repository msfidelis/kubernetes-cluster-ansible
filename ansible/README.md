# Pre-install common configs on all cluster machines

```bash
nsible-playbook playbooks/bootstrap.yml -u ubuntu
```

# Install Docker and Configure Cluster

```bash
ansible-playbook playbooks/kubernetes.yml -u ubuntu
```

Ref: https://github.com/deveth0/kubernetes-cluster-ansible/blob/master/kube-setup-cluster.yml
