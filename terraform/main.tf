provider "aws" {
  region = "eu-central-1" 
}

terraform {
  backend "s3" {
    bucket = "opencampus-webserver"
    key    = "state/"
    region = "eu-central-1"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0ec7f9846da6b0f61"
  instance_type = "t2.micro"

  key_name = "opencampus-test"

  tags = {
    Name = "WebServer"
  }
}