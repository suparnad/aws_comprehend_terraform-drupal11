# Terraform - Amazon Comprehend Custom Classifier Deployment

This Terraform project provisions an AWS Comprehend custom classifier, S3 storage, and IAM roles to support AI-based content tagging in a Drupal 11 site.

---

## What This Project Does

- Creates an S3 bucket and uploads training data
- Creates an IAM role and policy for Comprehend to access S3
- Provisions an Amazon Comprehend custom classifier
- Deploys a real-time classifier endpoint

---


## Prerequisites

- AWS CLI v2 installed
- Valid AWS credentials (via `~/.aws/credentials` or env vars)
- Terraform ≥ 1.0 installed
- Python 3+

---
## Generate Training Data
python generate_university_training_data.py

---

## Deploy

```bash
terraform init
terraform apply

---

## Monitor Training
- Go to Amazon Comprehend → Custom classification to check progress.

---

## Create an Endpoint

```bash
aws comprehend create-document-classifier-endpoint \
  --endpoint-name UniversityClassifierEndpoint \
  --model-arn arn:aws:comprehend:eu-west-2:****************:document-classifier/UniversityContentClassifier



