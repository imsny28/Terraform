
# export TF_VAR_username='sunny'
# terraform plan

variable "username" {
  type = string
}

output "printusername" {
  value = "Hello, ${var.username}"
}
