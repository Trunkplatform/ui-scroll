module.exports = (connect, options) ->
	express = require 'express'
	routes =         require './server'
	app = express()

	app.configure ->
		app.use express.logger 'dev'
		app.use express.bodyParser()
		app.use express.methodOverride()
		app.use express.errorHandler()
		app.use express.static options.base[0]
		app.use app.router
		routes app, options
	[connect(app)]