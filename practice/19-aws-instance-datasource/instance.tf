data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = [var.owner_id]

  filter {
    name   = "name"
    values = [var.image_name]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# creating instance.
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  # file, local-exec, remote-exec

  # file
  provisioner "file" {
    source      = "readme.md"      # terraform machine
    destination = "/tmp/readme.md" # remote machine
  }

  provisioner "file" {
    content     = "this is test content" # terraform machine
    destination = "/tmp/content.md"      # remote machine
  }

  # local-exec
  provisioner "local-exec" {
    command = "echo testing > /tmp/test.txt"
  }

  provisioner "local-exec" {
    working_dir = "/tmp"
    command     = "echo ${self.public_ip}>myip.txt"
  }

  provisioner "local-exec" {
    interpreter = [
      "/usr/bin/python3", "-c"
    ]
    command = "print('HelloWorld')"
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = "env>env.txt"
    environment = {
      envname = "envvalue"
    }
  }

  provisioner "local-exec" {
    command = "echo 'at create'"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete'"
  }

  # remote-exec
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/ifconfig.output",
      "echo 'hello Fateh Singh'>/tmp/test.txt"
    ]
  }

  provisioner "remote-exec" {
    script = "./testscript.sh"
  }
}
