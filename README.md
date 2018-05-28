
#### Tarzan / tarballs-cli

---------------------------------------------------------

### Clone a git repo, to which you will push files (tarballs, etc).

```bash
$ tarzan init oresoftware/tarballs "git@github.com:ORESoftware/tarballs.git"
```
>
> <sup> <b> <i> the init command clones the git repo to: "$HOME/.trbl/repos/oresoftware/tarballs" </i> </b> </sup><br>
> <sup> <b> <i> and "oresoftware/tarballs" becomes the id for that repo </i> </b> </sup>
>

### Use a repo to push files to

```bash
$ tarzan use oresoftware/tarballs
```

### Add a local file and push it to the remote repo

```bash
$ tarzan add foo.tgz "tarballs/foo.tgz"
```

----------------------------------------------------

### Install a tarball from Github, with NPM, etc

```bash

$ npm install --loglevel=warn -g \
 "https://raw.githubusercontent.com/<org>/<repo>/master/tarballs/foo.tgz?$(date +%s)"

```

### Using a Dockerfile / building a Docker image:

```bash
RUN npm install --loglevel=warn -g \
 "https://raw.githubusercontent.com/<org>/<repo>/master/tarballs/foo.tgz?$(date +%s)"
```

