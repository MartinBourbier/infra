data "cloudflare_zone" "this" {
  name = "martinbourbier.com"
}

resource "cloudflare_record" "api" {
  zone_id = data.cloudflare_zone.this.id
  name    = "api"
  value   = "116.203.220.234"
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

