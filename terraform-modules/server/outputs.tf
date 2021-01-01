output "minecraft_server_public_ip_address" {
  value       = hcloud_floating_ip.minecraft_server_public_ip.ip_address
  description = "The public ip address of the provisioned minecraft server"
}
