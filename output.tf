output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.web_alb.dns_name
}

output "bastion_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "vm3_public_ip" {
  value = aws_instance.vm3_public.private_ip
}

output "vm4_public_ip" {
  value = aws_instance.vm4_public.private_ip
}

output "vm5_private_ip" {
  value = aws_instance.private_webserver_vm5.private_ip
}

output "vm6_private_ip" {
  value = aws_instance.vm6_private.private_ip
}

