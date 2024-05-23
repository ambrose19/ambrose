provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "13.3"
  instance_class       = "db.t2.micro"
  name                 = "mydatabase"
  username             = "mydbuser"
  password             = "mypassword"
  parameter_group_name = "default.postgres13"
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    Name = "MyPostgresDB"
  }
}

output "db_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "db_username" {
  value = aws_db_instance.postgres.username
}

output "db_password" {
  value = aws_db_instance.postgres.password
}