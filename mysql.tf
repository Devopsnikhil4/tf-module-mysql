# Provisions Elastic Cache Cluster : mysql
resource "aws_elasticache_cluster" "mysql" {
  cluster_id           = "roboshop-${var.ENV}-mysql"
  engine               = "mysql"
  node_type            = "cache.m4.large"   
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.mysql_pg.name
  engine_version       = "6.2"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.mysql_subnet_group.name
  security_group_ids   = [aws_security_group.allows_mysql.id]
}

# Creates Parameter Group needed for Elastic Cache
resource "aws_elasticache_parameter_group" "mysql_pg" {
  name   = "roboshop-${var.ENV}-mysql-pg"
  family = "mysql6.x"
}


# creates subnet group 
resource "aws_elasticache_subnet_group" "mysql_subnet_group" {
  name       = "roboshop-mysql-${var.ENV}-subnetgroup"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-mysql-${var.ENV}-subnetgroup"
  }
}