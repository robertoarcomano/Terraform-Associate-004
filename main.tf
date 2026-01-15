resource "aws_s3_bucket" "example" {
  bucket = "il-tuo-nome-bucket-unico-2026"

  tags = {
    Name        = "EsempioBucket"
    Environment = "Dev"
  }
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "s3_net" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "free_tier" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.s3_net.id
  key_name      = aws_key_pair.ssh.key_name

  associate_public_ip_address = false
}

resource "aws_key_pair" "ssh" {
  key_name   = "eice-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_ec2_instance_connect_endpoint" "endpoint" {
  subnet_id = aws_subnet.s3_net.id
}