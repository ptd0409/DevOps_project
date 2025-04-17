variable "aws_region" {
  default = "ap-southeast-1"
}

variable "cluster_name" {
  default = "max-weather-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# You can add more like public_subnet_cidrs, private_subnet_cidrs, etc.
