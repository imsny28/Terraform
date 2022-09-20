
# resource "aws_key_pair" "key-tf" {
#   key_name   = "key-tf"
#   public_key = file("${path.module}/id_rsa.pub")
# }

# output "key_name" {
#   value = aws_key_pair.key-tf.key_name
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"

#   dynamic "ingress" {
#     for_each = [80, 443, 22, 3306, 27017]
#     iterator = port
#     content {
#       description = "TLS from VPC"
#       from_port   = port.value
#       to_port     = port.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }

#   # ingress {
#   #   description = "TLS from VPC"
#   #   from_port   = 22
#   #   to_port     = 22
#   #   protocol    = "tcp"
#   #   cidr_blocks = ["0.0.0.0/0"]
#   # }

#   # ingress {
#   #   description = "TLS from VPC"
#   #   from_port   = 80
#   #   to_port     = 80
#   #   protocol    = "tcp"
#   #   cidr_blocks = ["0.0.0.0/0"]
#   # }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }

# output "secuity_group_details" {
#   value = aws_security_group.allow_tls.id
# }

# resource "aws_instance" "web" {
#   ami                    = "ami-0b0ea68c435eb488d"
#   instance_type          = "t2.micro"
#   key_name               = aws_key_pair.key-tf.key_name
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   tags = {
#     Name = "first-tf-instance"
#   }
# }
