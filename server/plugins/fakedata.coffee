axios = require 'axios'

exports.register = (plugin, options, next ) ->
  fakeContactCardPromise = () ->
    axios
      .get('http://faker.hook.io?property=helpers.createCard')
      .then ({ data }) -> data

  plugin.decorate('server', 'faker', fakeContactCardPromise)
  next()


exports.register.attributes = {
  name: 'faker',
  once: true,
};
