provider "aws" {
  region = "us-east-1"
}

resource "aws_ami_from_instance" "ami-jenkins" {
  name               = "terraform-jenkins-ffaihdw"
  source_instance_id = "i-0360098a543f2cac0"
}



output "ami" {
  value = [
    "AMI: ${aws_ami_from_instance.ami-jenkins.id}"
  ]
}


