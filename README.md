# Minecraft server provisioning
This repository contains terraform and ansible scripts for provisoning a minecraft server with a FTB modpack into Hetzner cloud with AWS route 53 dns

## Requirements
- Terraform
- Ansible
- Hetzner cloud account and API key (https://docs.hetzner.cloud)
- Hcloud python `pip install hcloud`
- AWS account and user (https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication)
- Registered main domain in Route53 (https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-register.html)

## Provisioning
- Install required external ansible roles `ansible-galaxy role install -r requirements.yml`
- Install required external ansible collections `ansible-galaxy collections install -r requirements.yml`
- Spin up the server and dns records by running `terraform apply`
- Provision the minecraft server by running `HCLOUD_TOKEN=<your hetzner cloud token> ansible-playbook -i hcloud.yml minecraft-server-configuration.yml`

