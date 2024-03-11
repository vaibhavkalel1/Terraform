resource "aws_instance" "example" {
  ami           = "ami-02ca28e7c7b8f8be1"
  instance_type = "t2.micro"
  key_name      = 'f2'
  tags = {
    Name = "Demo_Server"
  }
}
