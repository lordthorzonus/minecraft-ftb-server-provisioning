variable "main_domain_name" {
  type = string
  description = "The main domain that is registered already in AWS Route53"
}

variable "server_sub_domain_name" {
  type = string
  description = "The sub domain that should be pointed to the provisioned server"
}

variable "server_sub_domain_ip" {
  type = string
}
