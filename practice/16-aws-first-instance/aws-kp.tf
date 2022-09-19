# creating ssh-key.

# ssh-keygen -t rsa   
# ./id_rsa
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}
