# Tarzan / tarballs-cli

> **Legacy package — release and installation frozen.** The current shell-dispatched CLI is retained for consumer and behavior discovery, but it is not approved for a new npm or Zed release. npm publication is blocked and the former install-time home-directory write has been removed from `package.json`. See [issue #1](https://github.com/ORESoftware/tarballs-cli/issues/1) and [`docs/migration-decision.md`](docs/migration-decision.md). Do not follow the historical global-install examples below for new systems.

## Historical behavior retained for migration review

### Clone a Git repository to which files were pushed

```bash
tarzan init oresoftware/tarballs "git@github.com:ORESoftware/tarballs.git"
```

Historically, `init` cloned the repository under `$HOME/.trbl/repos/oresoftware/tarballs` and registered `oresoftware/tarballs` as its ID. The replacement must validate ownership, paths, symlinks, remotes, credentials, concurrency, and interruption before preserving this behavior.

### Select a repository

```bash
tarzan use oresoftware/tarballs
```

Historically, `use` selected one repository globally for all shells. The migration must replace hidden global state with an explicit, validated configuration and must not mutate shell profiles during installation.

### Add and push an artifact

```bash
tarzan add foo.tgz "x/y/z/foo.tgz"
```

Historically, `add` copied a file into the active repository and attempted to push it. Any maintained version must default to dry-run, validate paths and remotes, serialize concurrent writers, avoid shell interpolation, prohibit force pushes, and emit bounded redacted receipts.

## Historical raw-GitHub installation example

The previous documentation installed tarballs from mutable branch URLs with a cache-busting query string. This is **not** an approved modern supply-chain workflow:

```bash
npm install --loglevel=warn -g \
  "https://raw.githubusercontent.com/<org>/<repo>/master/x/y/z/foo.tgz?$(date +%s)"
```

Do not use this pattern for new builds or Docker images. The migration decision must select an owning package system and use immutable content/revision digests, authenticated provenance, reproducible packaging, and reviewed release receipts.

## Intended command contract

Root [`.cli-flags.toml`](.cli-flags.toml) declares the ten commands that must be evaluated during migration:

- `init`
- `use`
- `add`
- `get`
- `view`
- `fetch`
- `push`
- `repair`
- `remove`
- `remove-all`

The legacy shell dispatcher does not yet consume the manifest. Issue #1 remains open until flags-2-env is the single parser, retained commands have characterization and adversarial tests, and either a migration or retirement receipt is approved.
