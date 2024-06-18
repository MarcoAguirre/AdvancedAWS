output "lambdaURL" {
  value = aws_lambda_function_url.this.function_url
}
output "frontendURL" {
  value = aws_s3_bucket.this.website_endpoint
}