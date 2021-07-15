provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "spawing_example" {
  ami= "${lookup(var.ami_id, var.region)}"
  instance_type="t2.micro"
}

