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
          register: 'good'
          options:
            reporters:
              console: [{
                module: 'good-squeeze',
                name: 'Squeeze',
                args: [{ log: '*', response: '*' }]
              },
              {
                module: 'good-console'
              },
                'stdout'
              ],
              file: [{
                module: 'good-squeeze',
                name: 'Squeeze',
                args: [{ ops: '*' }]
              }, {
                module: 'good-squeeze',
                name: 'SafeJson'
              }],
              http: [{
                module: 'good-squeeze',
                name: 'Squeeze',
                args: [{ error: '*' }]
              }]
      },
      {
        plugin:
          register: './plugins/fakedata'
      }
      {
       plugin:
        register: './static'
      }
      {
        plugin:
          register: './api/feed'
        options:
          routes:
            prefix: '/api/feed'
      }
    ]
if process.env.NODE_ENV != 'production'
  Manifest.registrations.push({
    plugin:
      register: 'hapi-webpack-dev-plugin',
      options:
        compiler: require('webpack')(require '../webpack.config.js')
        quiet: false
        devIndex: 'public/view/index.html'
  })


module.exports = Manifest
