resource "aws_opensearchserverless_vpc_endpoint" "endpoint" {
  name       = "opensearch-vpc-endpoint"
  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id
}