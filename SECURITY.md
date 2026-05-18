# Security policy

## Reporting a vulnerability

If you've found a security issue in `restic-toolkit`, please report it privately rather than opening a public issue.

- Email: security@servercrate.net
- PGP fingerprint: `AAB2 A06A E5F9 1879 B565 4584 C1B0 7D4D F41C B15F`
- Public key: https://servercrate.net/pgp/

We acknowledge within 72 hours and aim to provide a fix or mitigation timeline within 7 days for valid reports.

## Scope

In scope: shell injection, path traversal, or argument-handling bugs in `scripts/`; systemd unit/timer logic that could expose credentials, repository contents, or passphrases; default configurations that materially weaken Restic's encryption model.

Out of scope: bugs in upstream Restic (report to https://github.com/restic/restic/security); issues requiring root-on-the-client to exploit.

We don't run a paid bounty but we'll credit valid reports in release notes.
