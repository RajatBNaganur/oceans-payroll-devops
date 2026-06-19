#########################################
# AWS Secrets Manager
#########################################

resource "aws_secretsmanager_secret" "db_credentials" {
  name        = "${var.project_name}-db-credentials"
  description = "Database credentials"

  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "db_secret" {
  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = "payrolladmin"
    password = "CHANGE_ME_IN_PRODUCTION"
  })
}

#########################################
# SSM Parameter Store
#########################################

resource "aws_ssm_parameter" "environment" {
  name  = "/${var.project_name}/environment"
  type  = "String"
  value = "development"

  tags = local.common_tags
}