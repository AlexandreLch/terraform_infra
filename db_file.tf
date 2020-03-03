resource "aws_db_instance" "default" {
  allocated_storage     = 20
  max_allocated_storage = 200
  storage_type          = "gp2"
  engine                = "postgres"
  engine_version        = "10.11"
  instance_class        = "db.t2.micro"
  name                  = "postgres_prod"
  username              = "super_db_user"
  password              = "verygreatpassword"
  parameter_group_name  = "default.postgres10.11"
}