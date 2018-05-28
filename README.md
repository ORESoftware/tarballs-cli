
### Tarzan / tarballs-cli

#### commands:

```bash

# <sup>clone a git repo, to which you will push files (tarballs, etc).</sup>
$ trbl init oresoftware/tarballs "git@github.com:ORESoftware/tarballs.git"

# <sub>what the above does is clone the git repo to: "$HOME/.trbl/repos/oresoftware/tarballs"</sub>
# <sub>"oresoftware/tarballs" becomes the local id </sub>


# <sub>set the given location as the repo to push files to </sub>
$ trbl use oresoftware/tarballs


# <sub> add a local file and push it to the remote repo </sub>
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

