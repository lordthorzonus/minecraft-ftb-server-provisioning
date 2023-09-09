terraform {
  required_providers {
    aws = "~> 5.0"
  }
}

data "aws_route53_zone" "main_domain" {
  name = var.main_domain_name
}

resource "aws_route53_record" "server_sub_domain_a_record" {
  zone_id = data.aws_route53_zone.main_domain.zone_id
  name    = var.server_sub_domain_name
  type    = "A"
  ttl     = "300"

  records = [var.server_sub_domain_ip]
}
