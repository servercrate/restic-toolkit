#!/usr/bin/env bash
# sc-backup.sh — opinionated Restic backup with sane defaults.
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
set -a; . ./.env; set +a

EXCLUDE_ARGS=()
[ -f "${EXCLUDE_FILE:-}" ] && EXCLUDE_ARGS+=(--exclude-file="$EXCLUDE_FILE")

TAG_ARGS=()
IFS=',' read -ra TAGS_ARR <<< "${BACKUP_TAGS:-}"
for t in "${TAGS_ARR[@]}"; do TAG_ARGS+=(--tag "$t"); done

# shellcheck disable=SC2086
restic backup \
  --host "$(hostname -f)" \
  --verbose \
  "${EXCLUDE_ARGS[@]}" \
  "${TAG_ARGS[@]}" \
  $BACKUP_PATHS

echo "[✓] backup complete"
