output "vpc_id" {
  value = aws_vpc.main.id
}

output "igw_id" {
  value = aws_internet_gateway.default.id
}

output "vpc_default_security_group" {
  value = aws_default_security_group.default.id
}
