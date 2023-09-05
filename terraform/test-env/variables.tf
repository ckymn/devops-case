# Environment variables

variable "region" {
    description = "AWS region"
    type       = string
}

variable "project_name" {
    description = "Project name"
    type        = string
}

variable "environment" {
    description = "Environment"
    type        = string
}

variable "bucket_name" {
    description = "S3 bucket name"
    type        = string
}

variable "dynamodb_table_name" {
    description = "DynamoDB table name"
    type        = string
}

variable "vpc_cidr_block" {
    description = "VPC CIDR block"
    type        = string
}

variable "public_subnet_cidr_block_az1" {
    description = "Public subnet CIDR block AZ1"
    type        = string
}

variable "public_subnet_cidr_block_az2" {
    description = "Public subnet CIDR block AZ2"
    type        = string
}

variable "private_app_subnet_cidr_block_az1" {
    description = "Private app subnet CIDR block AZ1"
    type        = string
}

variable "private_app_subnet_cidr_block_az2" {
    description = "Private app subnet CIDR block AZ2"
    type        = string
}

variable "private_data_subnet_cidr_block_az1" {
    description = "Private data subnet CIDR block AZ1"
    type        = string
}

variable "private_data_subnet_cidr_block_az2" {
    description = "Private data subnet CIDR block AZ2"
    type        = string
}

# security group variables
variable "ssh_location" {
    description = "SSH location : Ip address that can ssh into the server"
    type        = string
}

# rds variables
variable "db_snapshot_identifier" {
    description = "DB snapshot identifier"
    type        = string
}

variable "db_instance_class" {
    description = "DB instance class"
    type        = string
}

variable "db_instance_identifier" {
    description = "DB instance identifier"
    type        = string
}

variable "multi_az" {
    description = "Multi AZ"
    type        = bool
}

# acm variables
variable "domain_name" {
    description = "Domain name"
    type        = string
}

variable "alternative_names" {
    description = "Sub domain names"
    type        = string
}

# s3 variables
variable "env_file_name" {
    description = "Environment file name"
    type        = string
}

# ecs variables
variables "architecture" {
    description = "ecs CPU architecture"
    type        = string
}

variables "container_image" {
    description = "ecs container image"
    type        = string
}

# Route 53 variables
variable "record_name" {
    description = "sub domain name"
    type        = string
}