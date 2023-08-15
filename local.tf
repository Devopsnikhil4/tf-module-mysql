locals {
    MYSQL_USER  = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["MYSQL_USERNAME"]
    MYSQL_PASS  = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["MYSQL_PASSWORD"]
}