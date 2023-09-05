terraform {
  backend "s3" {
    # Kendi bucket adınızla değiştirin!
    bucket = "devops-case-s3-bucket"
    key    = "terraform/test-env/terraform.tfstate"
    region = var.region
    profile = "terraform"
    dynamodb_table = var.dynamodb_table_name
    encrypt        = true
  }
}
