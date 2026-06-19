variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "oceans-payroll"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "development"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2" {
  default = "10.0.2.0/24"
}

variable "private_subnet_1" {
  default = "10.0.3.0/24"
}

variable "private_subnet_2" {
  default = "10.0.4.0/24"
}