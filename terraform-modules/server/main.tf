terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.31.0"
    }
  }
}
resource "hcloud_floating_ip" "minecraft_server_public_ip" {
  type          = "ipv4"
  home_location = var.server_location
}

resource "hcloud_server" "minecraft_server" {
  image       = "ubuntu-20.04"
  name        = "minecraft-server"
  server_type = var.server_type
  location    = var.server_location
  user_data = templatefile("${path.module}/minecraft-server.yml.tpl", {
    ssh_key : file(var.public_key_path),
    public_ip : hcloud_floating_ip.minecraft_server_public_ip.ip_address
  })
}

resource "hcloud_floating_ip_assignment" "minecraft_server_public_ip_assignment" {
  floating_ip_id = hcloud_floating_ip.minecraft_server_public_ip.id
  server_id      = hcloud_server.minecraft_server.id
}


