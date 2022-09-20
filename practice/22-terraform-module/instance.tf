module "mywebsver" {
  source        = "./modules/webserver"
  image_id      = var.image_name
  instance_type = var.instance_type
  key           = file("${path.module}/id_rsa.pub")
  key_name      = var.key_name
}

output "publicIp" {
  value = modules.mywebsever.publicIp
}
