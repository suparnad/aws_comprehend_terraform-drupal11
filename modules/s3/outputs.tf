output "bucket_arn" {
  value = aws_s3_bucket.training.arn
}

output "bucket_arn_with_wildcard" {
  value = "${aws_s3_bucket.training.arn}/*"
}

output "training_data_s3_uri" {
  value = "s3://${aws_s3_bucket.training.bucket}/training_data/university_training_data.csv"
}

output "bucket_name" {
  value = aws_s3_bucket.training.bucket
}
