# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "ami" {
  description = "The port the server will use for HTTP requests"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "vpc_security_group_ids" {
  description = "The port the server will use for HTTP requests"
  type        = list
}

variable "region" {
  default = "us-gov-east-1"
}

variable "profile" {
  default = "tapestry"
}

variable "server_port" {
  default = 8080
  type    = number
}
