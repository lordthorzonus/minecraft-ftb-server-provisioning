# Minecraft server provisioning
This repository contains Terraform and Ansible scripts for provisioning a minecraft server with a FTB modpack into Hetzner cloud with AWS route 53 dns

The main infrastructure is first spun up by Terraform:
- One server of chosen type (cx11, cx21 etc.)
- A floating IP assigned to the server
- Subdomain A record pointing to the floating IP

Then Ansible provisions:
- Docker
- ufw
- fail2ban
- Minecraft server with a FTB modpack

 using the Hetzner cloud dynamic inventory plugin.

See `variables.tf` and `group_vars/all.yml` for currently easily modifiable variables regarding the server
## Requirements
- Terraform
- Ansible
- Hetzner cloud account and API key (https://docs.hetzner.cloud)
- Hcloud python `pip install hcloud`
- AWS account and user (https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication)
- Registered main domain in Route53 (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)
- Working ssh key to be used with ansible and ssh:ing into the server (default used key is ~/.ssh/id_rsa.pub)

## Provisioning
- Install required external ansible roles `ansible-galaxy role install -r requirements.yml`
- Install required external ansible collections `ansible-galaxy collections install -r requirements.yml`
- Install required terraform providers by running `terraform init`
- Spin up the server and dns records by running `terraform apply`
- Provision the minecraft server by running `HCLOUD_TOKEN=<your hetzner cloud token> ansible-playbook -i hcloud.yml minecraft-server-configuration.yml`

