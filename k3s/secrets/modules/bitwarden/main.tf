data "kubernetes_secret" "bitwarden-db-creds" {
  metadata {
    name = "bitwarden.bitwarden.main-cluster.credentials"
    namespace = "bitwarden"
  }
}

locals {
  combined_creds = "${data.kubernetes_secret.bitwarden-db-creds.data.username}:${data.kubernetes_secret.bitwarden-db-creds.data.password}"
}

resource "kubernetes_secret" "bitwarden-database-info" {
  metadata {
    name = "bitwarden-database-info"
    namespace = "bitwarden"
  }

  data = {
    DATABASE_URL = "postgresql://${local.combined_creds}@main-cluster.postgres.svc.cluster.local/bitwarden"
  }
}

