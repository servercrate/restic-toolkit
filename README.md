# restic-toolkit

Production-grade Restic helpers. Works with **any** Restic backend (ServerCrate, BorgBase, rsync.net, your own SFTP, S3, B2 — anywhere Restic runs).

By [ServerCrate](https://servercrate.net) — zero-knowledge encrypted Restic backup hosting.

## What's in here

- `scripts/sc-backup.sh` — opinionated backup wrapper with sane defaults (cache, exclude, hostname, tags)
- `scripts/sc-restore.sh` — guided restore (snapshot picker, path picker, dry-run)
- `scripts/sc-verify.sh` — `check --read-data-subset` runner for periodic integrity verification
- `scripts/sc-prune.sh` — retention policy applier (`forget --prune` with safe defaults)
- `scripts/sc-init.sh` — repo bootstrap with passphrase prompt and verification
- `systemd/restic-backup@.service` + `.timer` — drop-in templated unit (one service per dataset)
- `docker/` — Dockerfile + docker-compose.yml for restic-in-a-container
- `templates/env.example` — every env var documented
- `docs/` — quickstart, restore drill, audit checklist

## Quick start

```bash
git clone https://github.com/servercrate/restic-toolkit
cd restic-toolkit
cp templates/env.example .env
# Edit .env — set RESTIC_REPOSITORY, RESTIC_PASSWORD_FILE, paths, retention
./scripts/sc-init.sh   # one-time
./scripts/sc-backup.sh # backup
```

For a full walkthrough, see [docs/quickstart.md](docs/quickstart.md).

## License

MIT. Use freely. PRs welcome.
