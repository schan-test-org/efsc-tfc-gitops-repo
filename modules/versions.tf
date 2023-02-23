terraform {
  required_version = ">= 1.2.0, < 2.0.0"

  required_providers {
    aws        = "~> 4.37.0"
    helm       = "~> 2.2.0"
  }
}
