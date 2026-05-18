# Contributing

## Ground rules

This toolkit is intentionally small. Every script earns its place by being:

1. Backend-agnostic — works with Restic against SFTP, REST, S3, B2, local. No ServerCrate hardcoding.
2. Production-honest — failure modes go to stderr with non-zero exit codes. No silent best-effort.
3. POSIX-shell + Restic only — no Python, Node, or compiled deps. Runtime: stock Linux/BSD with restic, flock, logger, coreutils.

## Process

- Open an issue before sending a large PR.
- One logical change per PR.
- shellcheck clean. CI rejects otherwise.
- Test against a real Restic repo: init, backup, verify, restore. State it in the PR description.
- Update docs/ if behavior or flags change.

## Conventions

- `set -euo pipefail` at the top
- Quote everything: `"$var"`
- `${VAR:?env not set}` for required env, not `${VAR:-default}` that masks bugs
- Errors to stderr: `echo "msg" >&2`
- Exit codes: 0 success, 1 user/config error, 2 operational error

## Not merged

- ServerCrate-specific endpoints or branding inside scripts
- Telemetry of any kind
- New runtime dependencies
- Changes to Restic's security model

By contributing you agree your work is released under MIT.
