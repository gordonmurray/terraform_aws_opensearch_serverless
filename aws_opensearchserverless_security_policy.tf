resource "aws_opensearchserverless_security_policy" "encryption" {
  name        = "encryption"
  type        = "encryption"
  description = "encryption security policy for collection"
  policy = jsonencode({
    Rules = [
      {
        Resource = [
          "collection/${var.name}"
        ],
        ResourceType = "collection"
      }
    ],
    AWSOwnedKey = true
  })
}

resource "aws_opensearchserverless_security_policy" "network" {
  name        = "network"
  type        = "network"
  description = "Private access"
  policy = jsonencode([
    {
      Description = "access to collection and Dashboards endpoint",
      Rules = [
        {
          ResourceType = "collection",
          Resource = [
            "collection/${var.name}"
          ]
        },
        {
          ResourceType = "dashboard"
          Resource = [
            "collection/${var.name}"
          ]
        }
      ],
      AllowFromPublic = false,
      SourceVPCEs = [
        aws_opensearchserverless_vpc_endpoint.endpoint.id
      ]
    }
  ])
}




