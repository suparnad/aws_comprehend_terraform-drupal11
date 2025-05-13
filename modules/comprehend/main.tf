resource "aws_comprehend_document_classifier" "university" {
  name                 = "UniversityContentClassifier"
  data_access_role_arn = var.comprehend_role_arn

  input_data_config {
    s3_uri = var.s3_uri
  }

  language_code = "en"
  version_name  = "v1"
  mode          = "MULTI_CLASS"
}
