terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
  }
}

provider "vault" {
  address = "https://vault.api.martinbourbier.com:443"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

