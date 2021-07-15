provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "spawing_example" {
  ami= "var.ami_id,var.region"
  instance_type="t2.micro"
}

