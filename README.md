#open-deps-repos

**open-deps-repos**  is a tiny wrapper for [`npm repo <package>`](https://www.npmjs.com/package/npm-repo) command


##Usage

```bash

#basic

odr <PATH/TO/package.json>

#without no args, odr receives package.json in current directory

odr

# if --dev option  odr will get package list from `devDependencies` key
# instead of `dependencies`

odr <PATH/TO/package.json> --dev
```

##Installation

```bash
npm install padding --save
```

##License

MIT