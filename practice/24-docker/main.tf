
# 1. Terraform: Docker deployment

# You want to deploy a web application using Terraform. As part ofthe process, complete the file
# stub "lhome/ubuntu/1075512-terraform-docker-deployment/mainitf". Use HCL to code one or more
# steps that do the following:

# - Initialize the provider plugin "kreuzwerker/docker", at version "2.11.0".
# - Using a "docker_container" resource create a new docker container from an "nginx" image
#   on "latest" tag and container name "web".
# - Forward port "80" of the container "web" to one of the ports given in the existing
#   variable "ports" which is in the "users" port range (i.e‘ 1024—49151).

# Note
# - The completed solution will be evaluated in a new, clean environment. Be sure everything is in
#   the "/home/ubuntu/i07551Z-terraform-docker-deployment" folder.
# - Tasks should execute with "sudo solve" invoked from the question directory.
# - You have sudo access.

# Grading
# - The execution of "sudo solve" invoked from the question directory solves the task.

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "nginx" {
  name  = "web"
  image = docker_image.nginx.name

  ports {
    external = "8080"
    internal = "80"
  }
}

