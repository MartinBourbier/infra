#!/bin/sh

export VAULT_ADDR="https://vault.api.martinbourbier.com:443"
vault login -method=oidc > /dev/null

