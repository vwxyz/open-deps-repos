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

# if --dev option is used, odr will get package list from
#  `devDependencies` key instead of `dependencies`

odr <PATH/TO/package.json> --dev

# if --all option is used, odr will get package list from
# both `devDependencies` and  `dependencies` sections
```

##Installation

```bash
npm install open-deps-repos --save
```

##License

MIT