variable "region" {
  description = "The AWS region to create resources in"
}

variable "ami" {
  description = "The AMI ID to use for the instance"
}

variable "instance_type" {
  description = "The instance type to use"
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
}

variable "subnet_ids" {
  description = "The list of subnet IDs to launch the instance in"
  type        = list(string)
}

variable "security_group_name" {
  description = "The name of the security group"
  default     = "polodevexample-sg"
}

variable "vpc_id" {
  description = "The VPC ID to create the security group in"
}

variable "security_group_tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
  default     = {}
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
}

variable "volume_size" {
  description = "The size of the EBS volume in GB"
  default     = 10
}

variable "volume_tags" {
  description = "Tags to apply to the EBS volume"
  type        = map(string)
}

variable "device_name" {
  description = "The device name to attach the EBS volume as"
  default     = "/dev/sdh"
}
