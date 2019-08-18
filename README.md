<h1 align="center">Welcome to Kubernetes Cluster Bootstrap 👋</h1>
<p>
  <img src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="https://twitter.com/fidelissauro">
    <img alt="Twitter: fidelissauro" src="https://img.shields.io/twitter/follow/fidelissauro.svg?style=social" target="_blank" />
  </a>
</p>

> Complete Kubernete Clusteron AWS using Terraform and Ansible 

## Run tests

```sh
terraform plan
```

## Terraform Provisioning on AWS

```sh
cd terraform/
terraform init
terraform apply
```

## Configure cluster using Ansible Dynamic Inventory

### Edit ansible.cfg

```ini
[defaults]
# Incluce ec2.py inventory
inventory = ./inventory/ec2.py
host_key_checking=false
deprecation_warnings=False
ansible_ssh_user=ubuntu
# Configure access key if necessary
ansible_ssh_private_key_file = "~/.ssh/id_rsa.pub"
```

### Apply ansible-playbook

```sh
ansible-playbook playbooks/k8s-cluster-aws.yml
```

## Deploy a Example Application for testing



```sh
ansible-playbook playbooks/deploy.yml
```

## Author

👤 **Matheus Fidelis**

* Twitter: [@fidelissauro](https://twitter.com/fidelissauro)
* Github: [@msfidelis](https://github.com/msfidelis)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](/issues).

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_