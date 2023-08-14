tf-module-mysql
RDS is a managed service offered in AWS for MySQL.

All the terraform code to provision RDS will be hosted in this repository.
This will be the backend module, which will be called from the root module "terraform-databases"

As of today, RDS Supports the below list of Sequel Databases
    *   MySQL
    *   Oracle 
    *   Aurora ( MYSQL )
    *   Aurora ( Postgress )
    *   Postgress
    *   SQL-Server 
    *   MariaDB