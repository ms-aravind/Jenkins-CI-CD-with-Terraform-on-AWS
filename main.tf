provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0e1c4170d9c01184b"
  instance_type = "t3.micro"
  key_name      = "my-key"

  tags = {
    Name = "Jenkins Server"
  }
}
