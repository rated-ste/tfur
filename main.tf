provider "aws" {
    region = "eu-west-3"
}

resource "aws_instance" "example" {
    ami                    = "ami-0d857c06968b4f4fb"
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF

    tags = {
        Name = "base_node"
    }
}

resource "aws_security_group" "instance" {
    name = "base_node_sg"

    ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}