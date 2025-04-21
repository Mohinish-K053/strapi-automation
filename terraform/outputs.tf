# Output the public IP of the EC2 instance

output "ec2_public_ip" {
  value       = aws_instance.strapi.public_ip
  description = "Public IP of deployed EC2 instance"
}
