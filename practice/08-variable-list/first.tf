# terraform plan --> attractive mode
# terraform plan -var 'users=["Fateh123", "Singh"]' --> Non attractive mode

output "printfirst" {
  value = "First User = ${var.users[0]}"
}
