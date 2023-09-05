# Terraform ile S3 bucket oluşturmak için
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name

  # Bu S3 bucket'ın yanlışlıkla silinmesini önleyin
  lifecycle {
    prevent_destroy = true
  }
}

# İlk olarak, bucketta bir dosyaya yapılan her güncellemenin aslında o dosyanın yeni bir sürümünü oluşturması için S3 bucketta sürüm oluşturmayı etkinleştirelim.
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 klasörüne yazılan tüm veriler için sunucu tarafı şifrelemeyi varsayılan olarak açmak için
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# S3 bucketa tüm public erişimi engellemek için
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# upload the environment file from local computer into the s3 bucket
resource "aws_s3_object" "upload_env_file" {
  bucket = aws_s3_bucket.terraform_state.id
  key = var.env_file_name
  source = "../${var.env_file_name}"
}
