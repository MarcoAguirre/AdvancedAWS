terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway = "http://localstack:4566"
    cloudwatch = "http://localstack:4566"
    dynamodb   = "http://localstack:4566"
    iam        = "http://localstack:4566"
    lambda     = "http://localstack:4566"
    route53    = "http://localstack:4566"
    s3         = "http://localstack:4566"
  }
}
