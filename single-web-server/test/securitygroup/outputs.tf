output "security-group" {
  value       = aws_security_group.instance.id
  description = "Name of the security group"
}