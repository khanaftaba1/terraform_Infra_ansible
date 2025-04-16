########################################## Bastion

resource "aws_instance" "bastion_host" {
  ami                    = "ami-08b5b3a93ed654d19" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_2.id
  key_name               = aws_key_pair.asg_key.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "Webserver-2-Bastion"
  }
}

############################################# VM3 & VM4

resource "aws_instance" "vm3_public" {
  ami                         = "ami-08b5b3a93ed654d19"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_3.id
  key_name                    = aws_key_pair.asg_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "VM3-Public"
  }
}

resource "aws_instance" "vm4_public" {
  ami                         = "ami-08b5b3a93ed654d19"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_4.id
  key_name                    = aws_key_pair.asg_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "VM4-Public"
  }
}

################################################ Private VM 5 & 6

resource "aws_instance" "private_webserver_vm5" {
  ami                    = "ami-08b5b3a93ed654d19"  # Amazon Linux 2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_1.id
  key_name               = aws_key_pair.asg_key.key_name
  vpc_security_group_ids = [aws_security_group.private_vm_sg.id]

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tags = {
    Name = "Private-Webserver-VM5"
  }
}

resource "aws_instance" "vm6_private" {
  ami                    = "ami-08b5b3a93ed654d19"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_2.id
  key_name               = aws_key_pair.asg_key.key_name
  vpc_security_group_ids = [aws_security_group.private_vm_sg.id]

  tags = {
    Name = "VM-6-PrivateSubnet2"
  }
}
