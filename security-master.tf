resource "aws_security_group" "xotocross-master" {
  name = "xotocross-${var.aws_bucket_instance_input}-master"
  vpc_id = aws_vpc.xotocross-vpc.id

  ingress {
      description = "xotocross ssh"
      protocol = "tcp"
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross https"
      protocol = "tcp"
      from_port = 443
      to_port = 443
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross api server"
      protocol = "tcp"
      from_port = 6443
      to_port = 6443
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross etcd"
      protocol = "tcp"
      from_port = 2379
      to_port = 2380
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross weavenet tcp"
      protocol = "tcp"
      from_port = 6783
      to_port = 6783
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross weavenet udp"
      protocol = "udp"
      from_port = 6784
      to_port = 6784
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross weavenet udp"
      protocol = "udp"
      from_port = 6783
      to_port = 6783
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross kubelet api, kube_scheduler, kube_controller_manager"
      protocol = "tcp"
      from_port = 10248
      to_port = 10260
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      description = "xotocross nodeport service"
      protocol = "tcp"
      from_port = 30000
      to_port = 32767
      cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    name = "xotocross-${var.aws_bucket_instance_input}-master"
  }
}