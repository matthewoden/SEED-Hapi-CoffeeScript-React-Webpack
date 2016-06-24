Boom = require('boom')

exports.register = (server, options, next) ->
  server.route({
    method: 'GET'
    path: '/'
    handler: (request, reply) ->
      console.log('got here!')
      Promise.all([
        server.faker()
        server.faker()
        server.faker()
      ])
      .then (results) ->
        reply(results)
      .catch (err) ->
        console.log(err)
        reply(Boom.badImplementation('Something Terrible Happened', err))
  })

  next()

exports.register.attributes = {
    name: 'feed'
}
