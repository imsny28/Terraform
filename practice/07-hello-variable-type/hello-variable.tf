# terraform plan --> attractive mode
# terraform plan -var username="Fateh Singh" -var age="29" --> Non attractive mode

output "printusername" {
  value = "Hello, ${var.username}, your age is ${var.age}"
}
