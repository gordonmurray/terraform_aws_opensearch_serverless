data "aws_caller_identity" "current" {}

# This is in the "Data access policies" section in the AWS Console
resource "aws_opensearchserverless_access_policy" "data" {
  name        = "data"
  type        = "data"
  description = "read and write permissions"
  policy = jsonencode([
    {
      Rules = [
        {
          ResourceType = "index",
          Resource = [
            "index/${var.name}/*"
          ],
          Permission = [
            "aoss:*"
          ]
        },
        {
          ResourceType = "collection",
          Resource = [
            "collection/${var.name}"
          ],
          Permission = [
            "aoss:*"
          ]
        }
      ],
      Principal = [
        data.aws_caller_identity.current.arn
      ]
    }
  ])
}
