variable "aws_region_input" {
  description = "xotocross region name"
  type = string
  default = "AWS_REGION_INPUT"
}

variable "aws_bucket_instance_input" {
  description = "xotocross instance name"
  type = string
  default = "AWS_BUCKET_INSTANCE_INPUT"
}

variable "provisioner" {
  description = "xotocross provisioner"
  type = string
  default = "terraform"
}

variable "cidr_vpc" {
  description = "xotocross cidr range for vpc"
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_vpc_subnet" {
  description = "xotocross cidr range for public vpc subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "ami" {
  description = "xotocross amazon machine image"
  type = map(string)
  default = {
    xotocross-master = "ami-00ac45f3035ff009e"
    xotocross-workernode = "ami-00ac45f3035ff009e"
  }
}

variable "instance_type" {
  description = "xotocross instance type"
  type = map(string)
  default = {
    xotocross-master = "t2.medium"
    xotocross-workernode = "t2.micro"
  }
}

variable "ssh_public_key" {
  description = "xotocross ssh public key"
  type = string
}

variable "node_count" {
  description = "xotocross number of worker nodes"
  type = number
  default = 2
}

variable "github_workspace" {
  description = "xotocross the github workspace directory"
  type = string
  default = "{{ github.workspace }}"
}

variable "egress_rules" {
  description = "xotocross egress rules"
  type = list
  default = ["all-all"]
}

variable "ingress_rules" {
  description = "xotocross ingress rules"
  type = list
  default = ["http-80-tcp", "ssh-tcp"]
}