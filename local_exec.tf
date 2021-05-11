provider "aws" {
  region = "us-east-1"
  access_key = "Your_access_key"
  secret_key = "Your_secret_key"
}


resource "aws_instance" "test" {
     ami = "ami-042e8287309f5df03"
     instance_type = "t2.micro"
     tags = {
           name = "provisioner_test"
        }
     provisioner "local-exec" {
         command = "echo ${self.public_ip} > public-ip.txt"
   }
}
