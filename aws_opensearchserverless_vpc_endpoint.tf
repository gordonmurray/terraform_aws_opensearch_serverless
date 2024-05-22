resource "aws_opensearchserverless_vpc_endpoint" "endpoint" {
  name               = "opensearch-vpc-endpoint"
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
  security_group_ids = [aws_security_group.vpc_endpoint_sg.id]
}