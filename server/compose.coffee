Glue = require 'glue'
Manifest = require './manifest'
options = {
  relativeTo: __dirname
}

module.exports =  Glue.compose.bind(Glue, Manifest, options)
