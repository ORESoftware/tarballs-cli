# Repository agent instructions

Read and obey the current organization baseline and [`ORESoftware/my-ai/AGENTS.md`](https://github.com/ORESoftware/my-ai/blob/main/AGENTS.md) before changing this repository. Where rules differ, follow the stricter rule.

## Current repository state

`tarballs-cli` / `tarzan` is a legacy shell-dispatched CLI under migration review in [issue #1](https://github.com/ORESoftware/tarballs-cli/issues/1). Do not describe it as modernized, Zed-published, reproducible, or production-ready until that issue's completion evidence exists.

## Release and installation freeze

- Do not publish the npm package, create a Zed release, add another package registry, or restore install-time side effects while issue #1 is open.
- Installation must not write to a user's home directory, mutate shell profiles, clone repositories, contact remotes, or read credentials.
- Do not bypass the `private` package guard or the prepublish blocker added during the migration gate.
- A release-enabling change requires an explicit migration/retirement decision, consumer evidence, green packaging tests, reviewed immutable dependency receipts, and a separate pull request.

## Command and input boundary

The intended command vocabulary is defined in root `.cli-flags.toml`. New runtime work must use the reviewed `flags-2-env` integration as the only argv parsing/coercion boundary. Reject unknown commands, flags, and extra positional arguments. Treat filenames, repository identifiers, refs, remote URLs, archive paths, and environment values as untrusted input.

Before any command performs an effect, validate:

- path traversal, symlink escape, special-file, ownership, and destination constraints;
- remote URL scheme/host/userinfo and credential absence;
- command and ref syntax without shell re-parsing;
- concurrency, lock, interruption, and idempotency behavior;
- dry-run output and diagnostic redaction.

Never use `eval`, concatenate untrusted shell commands, place credentials in URLs or process arguments, or log SSH keys, tokens, credential-helper output, repository contents, or raw provider errors.

## Git and repository effects

Keep remote writes behind an explicit effect adapter and an opt-in command. Default tests must use temporary local repositories and must not contact GitHub or another registry. Do not force-push, rewrite history, delete remote refs, or overwrite non-empty destinations. Preserve concurrent work and resolve conflicts semantically; never choose one side wholesale.

## Migration sequence

1. Inventory consumers and commands actually in use.
2. Add characterization and adversarial tests around the current public behavior.
3. Replace the shell dispatcher incrementally with a maintained runtime.
4. Integrate flags-2-env once at process entry.
5. Add immutable Zed metadata and dependency receipts without publishing.
6. Prove non-interactive packaging/install behavior in an isolated home directory.
7. Obtain review of the retirement or migration decision.
8. Enable release only in a dedicated, exact-head, least-privilege pull request.

Do not hand-edit generated artifacts or claim checks that were not run. Pull requests must link issue #1 and the corresponding Linear work, describe rollback and consumer impact, and remain draft while release, migration, or destructive behavior is unresolved.
