# terraform plan --> attractive mode
# terraform plan -var username="Fateh Singh" --> Non attractive mode
output "printusername" {
  value = "Hello, ${var.username}"
}



