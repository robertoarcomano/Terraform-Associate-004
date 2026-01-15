resource "aws_s3_bucket" "example" {
  bucket = "il-tuo-nome-bucket-unico-2026"

  tags = {
    Name        = "EsempioBucket"
    Environment = "Dev"
  }
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "s3_net" {
  vpc_id = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
}
