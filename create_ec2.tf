resource "aws_instance" "web_server1" {
  ami = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_web_subnet1.id
  key_name = "jupiter"
}
