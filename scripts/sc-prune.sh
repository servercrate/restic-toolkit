#!/usr/bin/env bash
# sc-prune.sh — apply retention policy.
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
set -a; . ./.env; set +a
echo "[*] Applying retention (h:${KEEP_HOURLY} d:${KEEP_DAILY} w:${KEEP_WEEKLY} m:${KEEP_MONTHLY} y:${KEEP_YEARLY})"
restic forget \
  --keep-hourly  "${KEEP_HOURLY:-24}" \
  --keep-daily   "${KEEP_DAILY:-7}" \
  --keep-weekly  "${KEEP_WEEKLY:-4}" \
  --keep-monthly "${KEEP_MONTHLY:-12}" \
  --keep-yearly  "${KEEP_YEARLY:-3}" \
  --prune
echo "[✓] prune complete"
