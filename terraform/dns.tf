data "cloudflare_zone" "this" {
  name = var.domain_name
}

resource "cloudflare_record" "api" {
  zone_id = data.cloudflare_zone.this.id
  name    = "api"
  value   = var.server_ip
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "argocd" {
  zone_id = data.cloudflare_zone.this.id
  name    = "argocd.api"
  value   = "api.${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "keycloak" {
  zone_id = data.cloudflare_zone.this.id
  name    = "keycloak.api"
  value   = "api.${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "s3" {
  zone_id = data.cloudflare_zone.this.id
  name    = "s3.api"
  value   = "api.${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "console_s3" {
  zone_id = data.cloudflare_zone.this.id
  name    = "console.s3.api"
  value   = "api.${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "portfolio" {
  zone_id = data.cloudflare_zone.this.id
  name    = "portfolio"
  value   = "${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "bitwarden" {
  zone_id = data.cloudflare_zone.this.id
  name    = "bitwarden"
  value   = "${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "harbor" {
  zone_id = data.cloudflare_zone.this.id
  name    = "harbor"
  value   = "${data.cloudflare_zone.this.name}"
  type    = "CNAME"
  proxied = false
}

