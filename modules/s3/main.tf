resource "aws_s3_bucket" "training" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.training.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.training.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.training.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "training_data" {
  bucket       = aws_s3_bucket.training.id
  key          = "training_data/university_training_data.csv"
  source       = "${path.module}/training_data/university_training_data.csv"
  etag         = filemd5("${path.module}/training_data/university_training_data.csv")
  content_type = "text/csv"
}
