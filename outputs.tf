output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.home_garth_hosting.bucket_name
}

output "s3_website_endpoint" {
  description = "Endpoint for our S3 bucket"
  value       = module.home_garth_hosting.website_endpoint
}

output "cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value       = module.home_garth_hosting.domain_name
}