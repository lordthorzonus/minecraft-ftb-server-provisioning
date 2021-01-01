variable "public_key_path" {
  type = string
  description = "The path to your public ssh key to be used with communicating the provisioned server"
}

variable "server_type" {
  type = string
  description = "The type of the Hetzner server (cx11, cpx11, cx21, cpx21 etc.)"
  default = "cx21"
}

variable "server_location" {
  type = string
  description = "The location of the server (fsn1, nbg1, hel1)"
}
