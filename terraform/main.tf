resource "aws_instance" "ec2_nginx" {
  ami                         = "ami-09e67e426f25ce0d7"
  instance_type               = "t2.micro"
  key_name                    = "key-dev-tf"
  subnet_id                   = "subnet-0b6ee665d5b518339"
  associate_public_ip_address = true
  root_block_device {
    encrypted   = true
    volume_size = 20
  }
   
  tags = {
    Name = "ec2-nginx-ffaihdw"
  }
  vpc_security_group_ids = ["${aws_security_group.sg_nginx.id}"]
}

resource "aws_security_group" "sg_nginx" {
  name        = "sg_nginx_ffaihdw"
  description = "sg nginx and ssh inbound traffic"
  vpc_id      = "vpc-080da39cf7b8a7fdc"

  ingress = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = "SSH from VPC"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description      = "Nginx"
      from_port        = 80
      to_port          = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "sg_nginx_ffaihdw"
  }
}


