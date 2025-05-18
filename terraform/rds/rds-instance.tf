resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "default" {
  identifier        = "postgres-db"
  engine            = "postgres"
  engine_version    = "15.3"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  db_name              = var.db_name
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = var.security_groups

  skip_final_snapshot = true
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}

