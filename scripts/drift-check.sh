#!/usr/bin/env bash
# drift-check.sh — Compare Terraform state to real infrastructure (plan-only).
set -euo pipefail

ENV_DIR="${1:-environments/dev}"

if [[ ! -d "$ENV_DIR" ]]; then
  echo "Directory not found: $ENV_DIR"
  exit 1
fi

echo "=== Drift check: $ENV_DIR ==="

if command -v terragrunt >/dev/null 2>&1 && [[ -f "$ENV_DIR/terragrunt.hcl" ]]; then
  (cd "$ENV_DIR" && terragrunt plan -detailed-exitcode) && RC=$? || RC=$?
else
  (cd "$ENV_DIR" && terraform init -input=false && terraform plan -detailed-exitcode -var-file=terraform.tfvars) && RC=$? || RC=$?
fi

case "$RC" in
  0) echo "No drift detected." ;;
  2) echo "Drift detected — review plan output above."; exit 2 ;;
  *) echo "Plan failed with exit code $RC"; exit "$RC" ;;
esac
