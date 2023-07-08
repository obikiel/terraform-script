//create the S3 bucket 
resource "aws_s3_bucket" "izzy" {
  bucket = var.bucket-name
}

//this is to unblock all public access to thhe bucket
resource "aws_s3_bucket_public_access_block" "izzy-bucket-public-access" {
  bucket = var.bucket-name
  block_public_acls       = false 
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

//this is to enable static hosting on the bucket
resource "aws_s3_bucket_website_configuration" "izzy-bucket-website-config" {
  bucket = var.bucket-name

  index_document {
    suffix = "index.html"
  }
}

//this is to upload the files(objects) into the s3 bucket 
resource "aws_s3_object" "izzy-object" {
  bucket = var.bucket-name
  for_each = fileset("static/", "*")
  key    = each.value
  source = "static/${each.value}"
  content_type = "text/html"
  etag = filemd5("static/${each.value}")
}

//Assigning the bucket policy
resource "aws_s3_bucket_policy" "izzy-bucket-policy" {
  bucket = var.bucket-name
  policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::izzy-bucket44/*"
            ]
        }
    ]
}

EOF
}

