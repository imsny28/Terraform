terraform {
  required_version = ">= 1.1.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}
