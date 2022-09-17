
# terraform plan --> attractive mode
# terraform plan -var 'users=["Fateh123", "Singh"]' --> Non attractive mode

output "printjoinsusers" {
  value = "First User = ${join("-->", var.users)}"
}

output "printUppercase" {
  value = "First User = ${upper(var.users[0])}"
}

output "printLowercase" {
  value = "First User = ${lower(var.users[1])}"
}

output "printTitle" {
  value = "First User = ${title(var.users[2])}"
}
