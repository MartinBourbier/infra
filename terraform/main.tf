terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.16"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
  }
}

data "vault_generic_secret" "cloudflare" {
  path = "in-cluster/infra/cloudflare"
}

provider "cloudflare" {
  api_token = data.vault_generic_secret.cloudflare.data.api_token
}

provider "vault" {
  address = "https://vault.api.martinbourbier.com:443"
}

