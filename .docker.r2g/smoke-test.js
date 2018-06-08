const assert = require('assert');
const tarballsCLI = require('tarballs-cli');

assert.equal(typeof tarballsCLI.r2gSmokeTest, 'function', 'missing exported function');
