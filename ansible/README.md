# Pre-install common configs on all cluster machines

```bash
ansible-playbook -u ubuntu -i inventory/ec2.py  playbooks/bootstrap.yml --limit tag_Workload_kubernetes
```

# Install Docker

```bash
ansible-playbook -u ubuntu -i inventory/ec2.py  playbooks/kubernetes.yml --limit tag_Workload_kubernetes
```

Ref: https://github.com/deveth0/kubernetes-cluster-ansible/blob/master/kube-setup-cluster.yml
