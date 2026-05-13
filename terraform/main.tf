# This is a single-line comment
resource "aws_s3_bucket" "test" {
  bucket = "test-alerts-bucket"
  acl    = "public-read"
}

resource "aws_security_group" "open_ssh" {
  name = "open-ssh"

  ingress {
    from_port   = 23
    to_port     = 24
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
