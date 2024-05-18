resource "aws_key_pair" "xotocross-key" {
  key_name = "id-rsa-${var.aws_bucket_instance_input}"
  public_key = var.ssh_public_key
}

resource "aws_instance" "xotocross-master" {
  ami = var.ami["xotocross-master"] 
  instance_type = var.instance_type["xotocross-master"]
  key_name = aws_key_pair.xotocross-key.key_name
  associate_public_ip_address = true
  user_data = "${file("./credentials/create_user.sh")}"
  subnet_id = aws_subnet.xotocross-subnet.id
  vpc_security_group_ids = [aws_security_group.xotocross-master.id]
  
  root_block_device {
    volume_type = "gp2"
    volume_size = 14
  }
  
  timeouts {
    create = "10m"
  }
  
  tags = {
    Name = "xotocross-${var.aws_bucket_instance_input}-master"
  }
}

resource "aws_instance" "xotocross-workernode" {
  count = var.node_count
  ami = var.ami["xotocross-workernode"] 
  instance_type = var.instance_type["xotocross-workernode"]
  user_data = "${file("./credentials/create_user.sh")}"
  key_name = aws_key_pair.xotocross-key.key_name
  associate_public_ip_address = true
  subnet_id = aws_subnet.xotocross-subnet.id
  vpc_security_group_ids = [aws_security_group.xotocross-workernode.id]
  
  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  tags = {
    Name = "xotocross-${var.aws_bucket_instance_input}-workernode-${count.index}"
  }
}
