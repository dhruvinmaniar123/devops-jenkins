variable "region" {
  default = "ap-south-1"
}

variable "image_id" {
  type        = map
  default = {
    ap-south-1    = "ami-0c1a7f89451184c8b"
  }
}

