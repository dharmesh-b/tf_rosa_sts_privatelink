data "aws_ami" "rhel9" {
  executable_users = ["self"]
  owners = ["309956199498"]
  most_recent      = true

  filter {
    name   = "name"
    values = ["RHEL-9*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

variable "cluster_name" {
  type        = string
  default     = "db-rosa-clstr"
  description = "ROSA cluster name"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "ROSA cluster region"
}

variable "availability_zones" {
  type        = list
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  description = "ROSA cluster availability zones"
}

variable "bastion_key_loc" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Public key for bastion host"
}

variable "bastion_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Bastion instance type"
}

variable "proxy_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Proxy instance type"
}

variable "rosa_vpc_cidr_block" {
  type        = string
  default     = "10.201.0.0/16"
  description = "cidr range for rosa private vpc"
}

variable "rosa_subnet_cidr_blocks" {
  type        = list
  default     = ["10.201.0.0/24", "10.201.1.0/24", "10.201.2.0/24"]
  description = "cidr range for rosa private vpc"
}

variable "egress_vpc_cidr_block" {
  type        = string
  default     = "10.200.0.0/16"
  description = "cidr range for egress vpc"
}

variable "egress_prv_subnet_cidr_block" {
  type        = string
  default     = "10.200.1.0/24"
  description = "cidr range for private subnet in egress vpc"
}

variable "egress_pub_subnet_cidr_block" {
  type        = string
  default     = "10.200.2.0/24"
  description = "cidr range for pub subnet in egress vpc"
}

variable "tgw_cidr_block" {
  type        = string
  default     = "10.128.0.0/9"
  description = "cidr range that should be used for tgw"
}

variable "enable_rosa_jumphost" {
  description = "If set to true, deploy a jumphost in the ROSA private subnet"
  type        = bool
  default     = true
}
