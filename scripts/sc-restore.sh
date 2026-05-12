#!/usr/bin/env bash
# sc-restore.sh — guided restore from a snapshot.
# Usage: ./scripts/sc-restore.sh [snapshot-id|latest] [target-dir]
set -euo pipefail
cd "$(dirname "$0")/.."
# shellcheck source=/dev/null
set -a; . ./.env; set +a

SNAP="${1:-latest}"
TARGET="${2:-./restore-$(date +%Y%m%d-%H%M%S)}"
mkdir -p "$TARGET"
echo "[*] Restoring snapshot $SNAP to $TARGET"
restic restore "$SNAP" --target "$TARGET" --verbose
echo "[✓] restore at $TARGET"
