provider "aws" {
    region = "eu-west-3"
}

resource "aws_instance" "example" {
    ami           = "ami-0cb72d2e599cffbf9"
    instance_type = "t2.micro"

    tags = {
        Name = "base-node"
    }
}