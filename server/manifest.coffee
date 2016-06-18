Confidence = require 'confidence';
Config = require './config'
path = require 'path'

criteria = {
    env: process.env.NODE_ENV
};

Manifest =
  server: {
      debug: {
          request: ['error']
      },
      connections: {
          routes: {
              security: false
          }
      }
  },
  connections: [{
      port: 8000,
      labels: ['web']
  }],
  registrations: [
      {
        plugin:
          register: 'inert'
      },

      {
       plugin:
        { register: './static' }
      }
    ]
if process.env.NODE_ENV != 'production'
  Manifest.registrations.push({
    plugin:
      register: 'hapi-webpack-dev-plugin',
      options:
        compiler: require('webpack')(require '../webpack.config.js')
        quiet: true
        devIndex: 'public/view/index.html'
  })


module.exports = Manifest
