output "s3_endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}

output "interface_endpoints_ids" {
  value = { for k, v in aws_vpc_endpoint.interface_endpoints : k => v.id }
}

output "endpoints_sg_id" {
  value = aws_security_group.endpoints_sg.id
}
