
provider "random" {
  version = "~> 2.2.1"
}

data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN