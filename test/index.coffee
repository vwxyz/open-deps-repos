{ execFile } = require "child_process"
assert = require "assert"
fs = require "fs"

cmd =  "./bin/odr"
msg =
  coffee: "open coffee-script repository page\n"
  lodash: "open lodash repository page\n"
  npm: "open npm repository page\n"
  yargs: "open yargs repository page\n"
  mocha: "open mocha repository page\n"

 
describe "odr: open-deps-repos", ->
  testJson = "./test/test.package.json"

  it "without path and option", (done)->
    execFile cmd, (err, stdout, stderr)->
      assert.notEqual stdout.search(msg.coffee), -1
      assert.notEqual stdout.search(msg.lodash), -1
      assert.notEqual stdout.search(msg.npm), -1
      assert.notEqual stdout.search(msg.yargs), -1
      done()

  it "--dev option", (done)->
    execFile cmd, ["./test/test.package.json", "--dev"], (err, stdout, stderr)->
      assert.equal stdout, msg.mocha
      done()

  it "--all option", (done)->
    execFile cmd, ["./test/test.package.json", "--all"], (err, stdout, stderr)->
      assert.notEqual stdout.search(msg.coffee), -1
      assert.notEqual stdout.search(msg.lodash), -1
      assert.notEqual stdout.search(msg.npm), -1
      assert.notEqual stdout.search(msg.yargs), -1
      assert.notEqual stdout.search(msg.mocha), -1
      done()



