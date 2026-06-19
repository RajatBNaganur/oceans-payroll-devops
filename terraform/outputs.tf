output "vpc_id" {
  value = aws_vpc.main.id
}

output "company_instance_id" {
  value = aws_instance.company.id
}

output "bureau_instance_id" {
  value = aws_instance.bureau.id
}

output "employee_instance_id" {
  value = aws_instance.employee.id
}

output "rds_endpoint" {
  value = aws_db_instance.payroll_db.endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.documents.bucket
}