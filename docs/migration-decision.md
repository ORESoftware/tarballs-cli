# Tarzan / tarballs-cli migration decision

Tracking: [ORESoftware/tarballs-cli#1](https://github.com/ORESoftware/tarballs-cli/issues/1) · Linear: `DEN-3944`

## Current disposition

**Freeze the legacy package while preparing a migration.** Do not publish, archive, delete, or silently revive the current implementation.

This repository still contains useful command intent, but the present shell dispatcher, global active-repository state, direct Git effects, install-time home-directory write, old CI assumptions, and missing parser/security tests are not an acceptable release boundary. The freeze preserves source and consumer compatibility evidence while preventing another npm publication from being mistaken for a supported release.

The branch implementing this decision:

- marks the package private;
- removes the npm `postinstall` entry that writes under `$HOME`;
- adds a fail-closed `prepublishOnly` blocker;
- records repository-local agent and credential rules;
- declares the intended command vocabulary in `.cli-flags.toml` without claiming the legacy shell dispatcher consumes it.

## Why migration is preferred over immediate archive

The source contains ten named workflows—`init`, `use`, `add`, `get`, `view`, `fetch`, `push`, `repair`, `remove`, and `remove-all`—and historical documentation describes an artifact-to-Git repository workflow. Before retirement, the owner must know whether any scripts, CI images, globally installed packages, aliases, or repositories still rely on those names and storage conventions.

An immediate archive could strand consumers or erase useful behavior before it is mapped to `zed-pkg`, an artifact-storage client, or another maintained home. Conversely, the presence of source is not evidence that every command should survive. The migration must inventory actual use and preserve only justified behavior.

## Consumer inventory receipt

The inventory must be machine-readable and bind its result to immutable source evidence. At minimum it records:

- audit start/end time and actor/workflow identity;
- exact GitHub organizations, repositories, default-branch SHAs, package registries, images, and local configuration roots searched;
- every reference to `tarballs-cli`, package name, `tarzan`, `trbl`, `$HOME/.trbl`, and `$HOME/.oresoftware/bash/tarzan.sh`;
- whether the reference installs, invokes, documents, vendors, or merely mentions the CLI;
- inaccessible repositories, pagination limits, excluded private surfaces, and stale results;
- proposed replacement and migration owner for each active consumer;
- content digest of the normalized receipt.

A partial search is reported as partial. Absence cannot be inferred from inaccessible organizations, local machines, registries, or images.

## Runtime migration contract

The maintained runtime must use `flags-2-env/flags-2-env@0.3.0` as the sole argv parsing and coercion boundary. The root `.cli-flags.toml` is the reviewed command vocabulary, but command-specific positional schemas and compatibility aliases still require implementation and tests.

Architecture:

```text
argv + environment
  -> flags-2-env parse/validation
  -> immutable command value
  -> pure validation and effect plan
  -> filesystem/Git adapter
  -> bounded redacted receipt
```

The parser rejects unknown flags, invalid coercions, unsupported commands, and excess positionals. Defaults do not override explicit environment values. The domain layer never rereads process argv/environment.

## Effect and security requirements

Before any file or Git effect:

- canonicalize an explicitly allowed base without following an attacker-controlled final symlink;
- reject traversal, absolute destination paths where relative paths are required, special files, symlink escape, and ownership/mode violations;
- validate repository identifiers and refs with closed grammars;
- permit only reviewed remote URL schemes/hosts and reject userinfo, fragments, encoded credentials, ambiguous scp-like forms, link-local/metadata targets, and control characters;
- construct subprocess argv arrays without shell interpolation or `eval`;
- acquire a per-repository lock with bounded timeout and stale-lock recovery evidence;
- stage effects in a run-scoped directory and promote atomically where possible;
- make interruption/retry behavior explicit and idempotent;
- prohibit force pushes, destructive history rewrites, and remote deletion;
- redact tokens, SSH material, credential-helper output, home paths, file contents, and raw provider errors.

`dry-run` is the default in the declared contract. An apply path requires a deliberate opt-in plus an immutable plan or confirmation mechanism. Tests use temporary local repositories and fake remotes; no default test contacts GitHub.

## Install and package requirements

A future installation must:

- perform no network, repository, shell-profile, home-directory, or credential effect during package-manager lifecycle hooks;
- install only reviewed package files;
- be reproducible from a clean checkout and immutable dependency receipt;
- run smoke tests with an isolated temporary `HOME`;
- verify `npm pack --dry-run` / equivalent output and prohibit secrets, local state, test credentials, caches, and legacy CI artifacts from the package;
- publish only from an exact reviewed commit through a least-privilege workflow;
- produce an immutable npm/Zed release receipt and rollback/deprecation plan.

The old `assets/postinstall.sh` source is retained only as migration evidence; it is no longer invoked by npm. Removing it from history is neither necessary nor authorized.

## Zed ownership decision

Before adding `.zpkg.toml`, decide which package owns the behavior:

1. a command group inside `zed-pkg` when this is fundamentally package/artifact resolution;
2. a dedicated artifact-storage client when it manages generic immutable artifacts;
3. a reduced `tarballs-cli` successor when independent command/product ownership remains justified.

Do not duplicate upload/resolution policy across homes. The chosen owner must expose an immutable source revision, dependency lock/receipt, compatibility mapping, and consumer migration plan. Zed metadata may be staged only after that decision; metadata alone cannot close #1.

## Test gates

The migration PR cannot become ready until tests cover at least:

- every command and help/error path;
- missing, duplicate, unknown, and excess arguments;
- traversal, absolute paths, symlink races/escape, hard links, special files, and permission failures;
- remote URL credentials, fragments, control characters, unsupported schemes, host allow/deny policy, and command injection;
- interrupted clone/fetch/copy/commit/push sequences;
- concurrent writers, lock timeout, stale lock, and idempotent retry;
- dirty repositories, moved heads, non-fast-forward updates, merge conflicts, and rejected force behavior;
- redaction of environment, URLs, errors, paths, and subprocess diagnostics;
- isolated install with no writes outside the package target;
- deterministic dry-run and receipt output;
- behavior comparison for every command retained from the legacy CLI.

## Release, retirement, and closure gates

Issue #1 remains open. It may close only after one of these receipts is reviewed:

### Migration

- complete consumer inventory;
- approved ownership decision;
- maintained runtime and flags-2-env integration;
- green exact-head tests and reproducible packaging;
- immutable Zed/npm release receipt;
- consumer migration evidence and rollback/deprecation plan.

### Retirement

- complete consumer inventory;
- named replacement or explicit no-replacement rationale;
- package deprecation and publishing disablement evidence;
- documentation/redirect plan;
- owner-approved archive timing;
- salvage record for unique tests, contracts, and command behavior.

Until then, the safe repository state is preserved source plus blocked release/install side effects—not a new production release.
