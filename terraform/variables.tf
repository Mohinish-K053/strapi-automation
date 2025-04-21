# Define the variables for your Terraform configuration

# Variable for the Docker image tag
variable "docker_image_tag" {
  type        = string
  description = "Docker image tag to deploy"
  default     = "latest"  # You can change this as needed
}

# Variable for the AWS region
variable "aws_region" {
  type        = string
  description = "AWS region to deploy in"
  default     = "us-east-1"  # Change this based on your region
}
