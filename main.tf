resource "aws_s3_bucket" "example" {
  bucket = "il-tuo-nome-bucket-unico-2026"

  tags = {
    Name        = "EsempioBucket"
    Environment = "Dev"
  }
}