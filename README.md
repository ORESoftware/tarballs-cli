
#### Tarzan / tarballs-cli

---------------------------------------------------------

### Clone a git repo, to which you will push files (tarballs, etc).

```bash
$ tarzan init oresoftware/tarballs "git@github.com:ORESoftware/tarballs.git"
```
>
> <sup><b><i> the 'init' command clones the git repo to: "$HOME/.trbl/repos/oresoftware/tarballs" </i></b></sup><br>
> <sup><b><i> and "oresoftware/tarballs" becomes the id for that repo </i></b></sup>
>

### Use a repo to push files to

```bash
$ tarzan use oresoftware/tarballs
```
>
> <sup><b><i> the 'use' command sets a certain repo as the active one (globally/for all shells) </i></b></sup>
>

### Add a local file and push it to the remote repo

```bash
$ tarzan add foo.tgz "x/y/z/foo.tgz"
```
>
> <sup><b><i> the 'add' command writes a file to the active repo to the path and attempts to push the file to the remote.</i></b></sup>
>

----------------------------------------------------

### Install a tarball from Github, with NPM, etc

```bash

$ npm install --loglevel=warn -g \
 "https://raw.githubusercontent.com/<org>/<repo>/master/x/y/z/foo.tgz?$(date +%s)"

```

### Using a Dockerfile / building a Docker image:

```bash
RUN npm install --loglevel=warn -g \
 "https://raw.githubusercontent.com/<org>/<repo>/master/x/y/z/foo.tgz?$(date +%s)"
```

