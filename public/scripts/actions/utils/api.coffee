{ CALL_API } = require 'redux-api-middleware'

module.exports = (object) ->
  api = {}
  api[CALL_API] = object
  return api
