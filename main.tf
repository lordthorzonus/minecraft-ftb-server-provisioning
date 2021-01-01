terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.23.0"
    }
    aws = "~> 3.0"
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "aws" {
  region = var.aws_region
}

module "minecraft_server" {
  source          = "./terraform-modules/server"
  public_key_path = var.public_key_path
  server_location = var.server_location
  server_type     = var.server_type
}

module "dns" {
  source                 = "./terraform-modules/dns"
  main_domain_name       = var.main_domain_name
  server_sub_domain_name = var.server_sub_domain_name
  server_sub_domain_ip   = module.minecraft_server.minecraft_server_public_ip_address
}

