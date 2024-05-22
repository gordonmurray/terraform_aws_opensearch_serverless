resource "aws_opensearchserverless_security_policy" "example" {
  name        = "example"
  type        = "encryption"
  description = "encryption security policy for collections that begin with \"example\""
  policy = jsonencode({
    Rules = [
      {
        Resource = [
          "collection/example*"
        ],
        ResourceType = "collection"
      }
    ],
    AWSOwnedKey = true
  })
}