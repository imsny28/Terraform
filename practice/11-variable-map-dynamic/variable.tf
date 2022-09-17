# terraform plan
# terraform plan -var username="fateh"
# terraform plan -var 'usersage={"gaurav": "20", "saurav":"19"}' -var username="gaurav"


variable "usersage" {
  type = map(any)
  default = {
    fateh = "29"
    sunny = "28"
  }
}

variable "username" {
  type = string
}

output "userage" {
  value = "my name is ${var.username} and my age is ${lookup(var.usersage, var.username)}"
}
