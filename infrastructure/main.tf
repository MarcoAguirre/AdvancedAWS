data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "this" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../app/main.py"
  output_path = "advancedsawsbackend.zip"
}

resource "aws_lambda_function" "this" {
  filename      = "advancedsawsbackend.zip"
  function_name = "status_code_function"
  role          = aws_iam_role.this.arn
  handler       = "main.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"
}

resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"

  depends_on = [aws_lambda_function.this]
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_object" "this" {
  depends_on   = [aws_s3_bucket.this]
  for_each     = fileset("${path.root}", "*.html")
  bucket       = var.bucket_name
  key          = basename(each.value)
  source       = each.value
  etag         = filemd5("${each.value}")
  content_type = "text/html"
  acl          = "public-read"
}

resource "aws_s3_object" "thisBuilStatic" {
  depends_on = [aws_s3_bucket.this]
  for_each   = fileset(path.module, "static/*")
  bucket     = var.bucket_name
  key        = each.value
  source     = each.value
  etag       = filemd5("${each.value}")
  acl        = "public-read"
}
