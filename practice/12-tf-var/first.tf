# terraform plan

variable "username" {
  type = string
}

variable "age" {
  type = number
}

output "printusername" {
  value = "Hello, ${var.username}, your age is ${var.age}"
}
