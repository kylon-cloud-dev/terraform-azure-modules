# Troubleshooting Notes

This document captures the main issues encountered while building the Terraform Azure Module Library with HCP Terraform, HashiCorp Vault, GitHub Actions OIDC, and Azure dynamic credentials.

---

## 1. HCP Terraform Module Had No Version Tags

### Issue

When publishing modules to the HCP Terraform private registry, HCP showed an error that the source repository had no tags.

### Cause

HCP Terraform private registry modules require version tags. Because this repository contains multiple modules, each module needed a module-specific tag prefix.

### Resolution

Created and pushed module-specific tags:

```bash
git tag vnet-v1.0.0
git tag acr-v1.0.0
git tag aks-v1.0.0

git push origin vnet-v1.0.0 acr-v1.0.0 aks-v1.0.0
