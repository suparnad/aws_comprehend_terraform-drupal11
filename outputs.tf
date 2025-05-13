output "classifier_arn" {
  value = module.comprehend.classifier_arn
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}
