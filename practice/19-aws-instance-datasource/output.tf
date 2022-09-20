output "key_name" {
  value = aws_key_pair.key-tf.key_name
}

output "secuity_group_details" {
  value = aws_security_group.allow_tls.id
}
