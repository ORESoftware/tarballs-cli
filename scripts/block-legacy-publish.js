'use strict';

const message = [
  'tarballs-cli publication is blocked while the legacy CLI is under migration review.',
  'See https://github.com/ORESoftware/tarballs-cli/issues/1 for the consumer, parser, packaging, and release gates.',
  'Do not bypass this guard or restore install-time side effects in the same change.',
].join(' ');

process.stderr.write(`${message}\n`);
process.exitCode = 1;
