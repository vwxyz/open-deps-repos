fs = require 'fs'
npm = require 'npm'
_ = require 'lodash'
{ argv } = require 'yargs'

module.exports = ->
	defaultFile = process.cwd() + '/package.json'

	if argv._.length is 0
		jsonFile = defaultFile
	else
		jsonFile = argv._[0]

	{ dependencies, devDependencies } = require jsonFile

	packagesInfo = dependencies
	packagesInfo = devDependencies if argv.dev
	packagesInfo = _.merge(dependencies, devDependencies) if argv.all

	packagesList = Object.keys packagesInfo

	# console.log packagesList

	npm.load {global: true}, (err, npm)->
		_.each packagesList, (pkg)->
			npm.commands.repo [pkg], (err)->
				if err
					console.log "An error occurred when opening #{pkg} repository page. #{err}"
					return
				console.log "open #{pkg} repository page"
			return 