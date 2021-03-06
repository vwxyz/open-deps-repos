// Generated by CoffeeScript 1.9.2
var _, argv, fs, npm;

fs = require('fs');

npm = require('npm');

_ = require('lodash');

argv = require('yargs').argv;

module.exports = function() {
  var defaultFile, dependencies, devDependencies, jsonFile, packagesInfo, packagesList, ref;
  defaultFile = process.cwd() + '/package.json';
  if (argv._.length === 0) {
    jsonFile = defaultFile;
  } else {
    jsonFile = argv._[0];
  }
  ref = require(jsonFile), dependencies = ref.dependencies, devDependencies = ref.devDependencies;
  packagesInfo = dependencies;
  if (argv.dev) {
    packagesInfo = devDependencies;
  }
  if (argv.all) {
    packagesInfo = _.merge(dependencies, devDependencies);
  }
  packagesList = Object.keys(packagesInfo);
  return npm.load({
    global: true
  }, function(err, npm) {
    return _.each(packagesList, function(pkg) {
      npm.commands.repo([pkg], function(err) {
        if (err) {
          console.log("An error occurred when opening " + pkg + " repository page. " + err);
          return;
        }
        return console.log("open " + pkg + " repository page");
      });
    });
  });
};
