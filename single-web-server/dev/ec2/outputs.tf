output "public_ip" {
  value       = module.example_instance.public_ip
  description = "The public IP of the web server"
}
