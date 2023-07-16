output "created_bucket_name" {
  description = "Name of the S3 bucket that got created."
  value       = aws_s3_bucket.bucket.id
}

output "created_bucket_arn" {
  description = "ARN of the S3 bucket that got created."
  value       = aws_s3_bucket.bucket.arn
}