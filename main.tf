provider "aws" {
    region = "us-east-1"    #set ur desired region
}


resource "aws_security_group" "mysg" {
  name   = "my-web-sg"

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "infra-provision-through-Jenkins-Server" {
    ami = "ami-0c7217cdde317cfec"    # AWS Ubuntu instance AMI ID
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.mysg.id]
    
  
}
