# Terraform - Amazon Comprehend Custom Classifier Deployment

This project provisions AWS resources for a custom document classification workflow using Amazon Comprehend, S3, and IAM. It supports integrating with a Drupal 11 site that automatically tags content using AI.

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



