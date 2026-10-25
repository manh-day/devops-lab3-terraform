output "ec2_instance_id" {
  value = aws_instance.lab.id
}

output "ec2_private_ip" {
  value = aws_instance.lab.private_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.lab.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.lab.arn
}