#!/usr/bin/env bash
# sc-verify.sh — periodic integrity verification.
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
set -a; . ./.env; set +a
echo "[*] Verifying ${VERIFY_SUBSET:-5%} of pack data"
restic check --read-data-subset="${VERIFY_SUBSET:-5%}"
echo "[✓] verify complete"
