variable "main_domain_name" {
  type        = string
  description = "The main domain that is registered already in AWS Route53"
}

variable "server_sub_domain_name" {
  type        = string
  description = "The sub domain that should be pointed to the provisioned server"
}

variable "hcloud_token" {
  type        = string
  description = "The token used communicating with Hetzner API"
}

variable "public_key_path" {
  type        = string
  description = "The path to your public ssh key to be used with communicating the provisioned server"
  default     = "~/.ssh/id_rsa.pub"
}

variable "server_type" {
  type        = string
  description = "The type of the Hetzner server (cx11, cpx11, cx21, cpx21 etc.)"
  default     = "cx21"
}

variable "server_location" {
  type        = string
  description = "The location of the server (fsn1, nbg1, hel1)"
  default     = "hel1"
}

variable "aws_region" {
  type    = string
  default = "eu-north-1"
}
