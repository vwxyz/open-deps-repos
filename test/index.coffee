{ exec } = require "child_process"
assert = require "assert"
fs = require "fs"
 
describe "odr", ->
  cmds = []
  testJson = "./test/test.package.json"

  beforeEach ->
    cmds = []
    cmds.push "coffee ./bin/odr"


  it "should open urls of packages in package.json of current directory", (done)->
    console.log cmds
    exec cmds.join "", (err, stdout, stderr)->
      fixture = fs.readFileSync "/test/fixture.txt", "utf-8"
      assert.equal stdout, fixture
      done()

  it "should open urls devDependencies packages when --dev option is used", (done)->
    cmds.push testJson
    cmds.push "--dev"
    exec cmds.join " ", (err, stdout, stderr)->
      assert.equal stdout, '0open mocha repository page'
      done()



