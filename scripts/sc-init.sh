#!/usr/bin/env bash
# sc-init.sh — one-time Restic repo bootstrap.
# Usage: ./scripts/sc-init.sh
set -euo pipefail
cd "$(dirname "$0")/.."
[ -f .env ] || { echo "[!] .env missing — copy templates/env.example"; exit 1; }
# shellcheck source=/dev/null
set -a; . ./.env; set +a
[ -n "${RESTIC_REPOSITORY:-}" ] || { echo "[!] RESTIC_REPOSITORY unset"; exit 1; }
[ -f "${RESTIC_PASSWORD_FILE:-}" ] || { echo "[!] password file missing: $RESTIC_PASSWORD_FILE"; exit 1; }
echo "[*] Initializing repo at $RESTIC_REPOSITORY"
restic init
restic cat config
echo "[✓] repo initialized"
