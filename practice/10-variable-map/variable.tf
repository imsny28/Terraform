variable "usersage" {
  type = map(any)
  default = {
    fateh = "29"
    sunny = "28"
  }

}

output "userage" {
  value = "my name is fateh and my age is ${lookup(var.usersage, "fateh")}"
}
