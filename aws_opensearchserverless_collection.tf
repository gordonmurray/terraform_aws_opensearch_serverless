resource "aws_opensearchserverless_collection" "example" {
  name             = "example"
  description      = "Opensearch Serverless Collection"
  standby_replicas = "DISABLED" # ENABLED by default
  type             = "SEARCH"   # Defaults to TIMESERIES


  tags = {
    Project = "terraform_aws_opensearch_serverless"
  }

  depends_on = [aws_opensearchserverless_security_policy.example]
}
