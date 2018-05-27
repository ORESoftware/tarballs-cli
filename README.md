
### Tarzan / tarballs-cli

#### commands:

```bash

# clone a git repo, to which you will push files (tarballs, etc).
$ trbl init oresoftware/tarballs "git@github.com:ORESoftware/tarballs.git"


# set the given location as the repo to push files to
$ trbl use oresoftware/tarballs


# add a file and push it to the remote repo
$ trbl add foo.tgz "tgz/foo.latest.tgz"

```

### Install a tarball from Github, with NPM, etc

```bash

$ npm install --loglevel=warn -g \
 "https://raw.githubusercontent.com/<org>/<repo>/master/tarballs/r2g.tgz?$(date +%s)"

```

#### The above, a Dockerfile / Docker image:

```bash
RUN npm install --loglevel=warn -g \
 "https://raw.githubusercontent.com/<org>/<repo>/master/tarballs/r2g.tgz?$(date +%s)"
```

