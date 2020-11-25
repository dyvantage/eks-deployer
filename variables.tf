# define providers and initialize default values

provider "kubernetes" {
  load_config_file       = "false"
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = "us-east-2"
}

locals {
  cluster_name = "dyvantage-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

