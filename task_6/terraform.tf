terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.44.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.15.0"
    }
    
  }
  required_version = ">= 1.1.0"
}

