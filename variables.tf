variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-1"
}

variable "bucket_name" {
  description = "Name of your S3 bucket."
  type        = string
}

variable "access_type" {
  description = "Access type for the S3 bucket: 'public-private-read' OR 'private-read-only'."
  type        = string
  validation  {
    condition = var.access_type == "public-private-read" || var.access_type == "private-read-only"
    error_message = "Specify either 'public-private-read' OR 'private-read-only'."
  }
}

variable "tags" {
  description = "Tags."
  type        = map(any)
  default     = {
    Environment = "development"
  }
}
