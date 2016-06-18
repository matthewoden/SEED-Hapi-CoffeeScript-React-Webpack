Composer = require './server/compose'

localDevelopment = process.env.NODE_ENV isnt 'production'

Composer (err, server) ->
  if err
    throw err
  else
    server.start () -> console.log "Started the plot device on port #{server.info.port}"
