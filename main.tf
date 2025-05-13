module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "comprehend" {
  source              = "./modules/comprehend"
  s3_uri              = module.s3.training_data_s3_uri
  comprehend_role_arn = module.iam.comprehend_role_arn
}


module "iam" {
  source         = "./modules/iam"
  bucket_arn     = module.s3.bucket_arn
  bucket_objects = module.s3.bucket_arn_with_wildcard
}

