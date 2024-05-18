resource "local_file" "inventory_file" {
  content = templatefile("./inventory.template", {
      ansible_host_var=aws_instance.xotocross-master.public_ip
      ec2_public_ip = [aws_instance.xotocross-master.public_ip]
      xotocross_master_public_ip = [aws_instance.xotocross-master.public_ip]
      xotocross_worker_public_ip = [for i in aws_instance.xotocross-workernode : i.public_ip]
      
    }
  )
  filename = "./inventory"
}

output "xotocross-master-ip" {
  value = aws_instance.xotocross-master.public_ip
}

output "xotocross-workernode-ip" {
  value = [for i in aws_instance.xotocross-workernode : i.public_ip]
}


