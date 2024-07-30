output "instance_public_ip" {
  value       = aws_instance.magento_server[0].public_ip
  description = "AWS EC2 instance public IP"
  sensitive   = false
}