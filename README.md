# DevOps Terraform Lab

Reusable Terraform modules with environment-specific Terragrunt configs for dev, staging, and prod.

## Structure

```
modules/
├── network/     — VPC, subnets, NAT
├── compute/     — Auto Scaling Group + launch template
└── monitoring/  — CloudWatch log group and CPU alarm
environments/
├── dev/         — minimal instance count
├── staging/     — medium footprint
└── prod/        — HA with larger instances
```

## Prerequisites

- Terraform 1.5+
- Terragrunt 0.50+ (optional but recommended)
- AWS credentials for plan/apply

## Quick Start (Terragrunt)

```bash
cd environments/dev
terragrunt run-all plan
```

## Quick Start (Terraform only)

```bash
cd environments/dev
terraform init
terraform plan -var-file=terraform.tfvars
```

## Drift Detection

```bash
bash scripts/drift-check.sh environments/dev
```

## CI

`.github/workflows/checkov.yml` scans modules and environments with Checkov.
