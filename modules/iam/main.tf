resource "aws_iam_role" "comprehend" {
  name = "ComprehendCustomClassifierRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "comprehend.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "s3_access" {
  name = "ComprehendS3Access"
  role = aws_iam_role.comprehend.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Effect = "Allow",
        Resource = [
          var.bucket_arn,
          var.bucket_objects
        ]
      }
    ]
  })
}
