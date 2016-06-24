path = require 'path'
exports.register = (plugin, options, next) =>
  plugin.route({
      method: 'GET',
      path: '/app/{param*}',
      handler: {
          directory: {
              path: 'public',
              listing: true
          }
      }
  });

  plugin.route({
    method: 'GET'
    path: '/{page*}'
    handler: (request, reply) =>
      reply.file('./index.html')
  })

  next();


exports.register.attributes = {
    name: 'public'
}
