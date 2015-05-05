#open-deps-repos

**open-deps-repos**  is a tiny wrapper for [`npm repo <package>`](https://www.npmjs.com/package/npm-repo) command


##Usage

```bash

#basic

odr <PATH/TO/package.json>

#without no args, odr receives package.json in current directory

odr

# so above is same as:

odr "./packge.json"

# --dev option
# will open urls of `devDependencies` instead of `dependencies`

odr <PATH/TO/package.json> --dev

# --dev option
# will open  urls of both `devDependencies` and  `dependencies` sections
odr <PATH/TO/package.json> --all
```

##Installation

```bash
npm install open-deps-repos --g
```

##License

MIT