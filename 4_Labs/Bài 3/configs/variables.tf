variable "aws_region" {
  description = "AWS Region trien khai"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Ten du an"
  type        = string
  default     = "manh-devops-lab3"
}

variable "instance_type" {
  description = "Loai may ao EC2"
  type        = string
  default     = "t3.micro"
}