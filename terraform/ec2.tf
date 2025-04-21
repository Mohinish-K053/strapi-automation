# Define the EC2 instance resource with user data

data "template_file" "user_data" {
  template = file("${path.module}/scripts/user_data.sh")

  vars = {
    DOCKER_TAG = var.docker_image_tag
  }
}

resource "aws_instance" "strapi" {
  ami                         = "ami-084568db4383264d4" # Ubuntu 24.04
  instance_type               = "t2.micro"
  key_name                    = "strapi-dp"  # Make sure to replace this with your SSH key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.strapi_sg.id]
  user_data                   = data.template_file.user_data.rendered

  tags = {
    Name = "StrapiEC2"
  }
}
